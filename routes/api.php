<?php

use App\User;
use App\News;
use App\Places;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

function baseResponse($statusCode, $message)
{
	return [
		'statusCode' => $statusCode,
		'message' => $message,
	];
}

function guardWeb()
{
	return Auth::guard('web');
}

function getValidator($request, $rules)
{
	return Validator::make($request->all(), $rules);
}

Route::post('/login', function (Request $request) {
	$validator = getValidator($request, [
		'email' => 'required',
		'password' => 'required',
	]);

	if ($validator->fails()) 
	{
		return response()->json(baseResponse(200, 'user email or password is required'));
	}

	$guard = guardWeb();
	$isLogged = $guard->attempt($request->only('email', 'password'));

	if ($isLogged)
	{
		session()->regenerate();

		return response()->json(
			array_merge(
				baseResponse(200, 'Login sucessfully'),
				[
					'api_token' => $guard->user()->api_token,
					'current_user' => $guard->user(),
				]
			)
		);
	} else
	{
		return response()->json(baseResponse(401, 'user email of password is not correct'));
	}
});	

Route::post('/logout', function (Request $request) {
	$api_token = $request->has('api_token') ? $request->get('api_token') : null;

	if (is_null($api_token))
	{
		return response()->json(baseResponse(500, 'logout failed, require pass api_token'));
	}

	$user = User::where('api_token', $api_token)->first();
	
	try 
	{
		DB::beginTransaction();
		$user->api_token = str_random(60);
		$user->save();
	}
	catch(Exception $e)
	{
		$isFailed = true;
		DB::rollBack();
		return response()->json(baseResponse(200, 'logout errors cause:'.$e->getMessage()));
	}

	if (!isset($isFailed))
	{	
		DB::commit();
	}

	return response()->json(baseResponse(200, 'logout successfully'));
});

Route::post('register', function (Request $request) {
	$validator = getValidator($request, [
		'email' => 'required|email',
		'password' => 'required|min:6|max:20',
		'password_confirmation' => 'required|min:6|max:20',
	]);

	if ($validator->fails()) 
	{
		return response()->json(baseResponse(401, 'data is not matching with required'));
	}

	if ($request['password'] !== $request['password_confirmation'])
	{
		return response()->json(baseResponse(401, 'password is not matched with password confirmation'));
	}

	

	try 
	{
		DB::beginTransaction();
		User::create([
			'email' => $request->get('email'),
			'password' => bcrypt($request->get('password')),
			'api_token' => str_random(60),
			'name' => $request->get('name'),
		]);
	}
	catch(Exception $e)
	{
		$isFailed = true;
		DB::rollBack();
		return response()->json(baseResponse(200, 'register user error cause :'.$e->getMessage()));
	}

	if (!isset($isFailed))
	{	
		DB::commit();
	}

	return response()->json(baseResponse(200, 'register successfully'));

});

Route::group(['middleware' => 'auth:api'], function () {
	Route::get('/user', function (Request $request) {
	    return $request->user();
	});

	Route::get('/getNewsList', function (Request $request) {
		return response()->json(
			array_merge(
				baseResponse(200, 'get news lists successfully'),
				['news_list' => DB::table('news')->latest()->get()]
			)
		); 
	});

	Route::post('/storePlaceByUser', function (Request $request) {
		$validator = getValidator($request, [
			'lat' => 'required',
			'lng' => 'required',
			'user_id' => 'required|integer',
		]);

		if ($validator->fails()) 
		{
			return response()->json(baseResponse(401, 'data is not matching with required'));
		}

		try 
		{
			DB::beginTransaction();
			$places = Places::create($request->all());
		}
		catch (Exception $e)
		{
			DB::rollBack();

			return response()->json(baseResponse(200, 'store places of customer is errors cause :'.$e->getMessage())); 
		}

		DB::commit();

		return response()->json(baseResponse(200, 'store places of customer is successfully'));
	});

	Route::get('/getNewDetail', function (Request $request) {
		$validator = getValidator($request, [
			'new_id' => 'required|integer',
		]);

		if ($validator->fails()) 
		{
			return response()->json(baseResponse(401, 'id must be a integer and required'));
		}

		$new = News::where('id', $request->get('new_id'))->first();
		$place = $new->places()->get();
		$user = $new->users()->get();

		return response()->json(
			array_merge(
				baseResponse(200, (!is_null($new) || !$new->isEmpty()) ? 'get a new detailed informations successfully' : 'the new with this id is not exists in database'),
				[
					'new' => $new,
					'user' => $user,
					'place' => $place, 
				]
			)
		); 
	});

	Route::get('/getNewListByUser', function (Request $request) {
		$validator = getValidator($request, [
			'user_id' => 'required|integer',
		]);

		if ($validator->fails()) 
		{
			return response()->json(baseResponse(401, 'id must be a integer and required'));
		}

		$new = News::where('user_id', $request->get('user_id'))->orderBy('created_at', 'desc')->get();

		return response()->json(
			array_merge(
				baseResponse(200, (!is_null($new) || !$new->isEmpty()) ? 'get a new detailed informations by user'. $request->get('user_id') .' successfully' : 'the new created by this user is not exists in database'),
				['new_data' => $new]
			)
		); 
	});

	Route::get('/getNewListByPlace', function (Request $request) {
		$newsByCity = \App\News::whereIn('place_id', function($query){
			$query->from('places')
                    ->select('place_id')
                    ->where('type', 'city');
		})->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		->select('news.*', 'check_readed.is_readed')
		->get();

		$newsByCounty = \App\News::whereIn('place_id', function($query){
			$query->from('places')
                    ->select('place_id')
                    ->where('type', 'county');
		})
		->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		->select('news.*', 'check_readed.is_readed')
		->get();

		$newsByGuild = \App\News::whereIn('place_id', function($query){
			$query->from('places')
                    ->select('place_id')
                    ->where('type', 'guild');
		})
		->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		->select('news.*', 'check_readed.is_readed')
		->get();

		return response()->json(array_merge(
			baseResponse(200, 'get list successfully'),
			compact('newsByCity', 'newsByCounty', 'newsByGuild')
		));
	});

	Route::post('/checkReaded' , function(Request $request) {
		$message = 'To readed this new is noted!!';
		if ($request->has('new_id') && $request->has('user_id'))
		{
			\App\CheckReaded::updateOrCreate(
				$request->except('api_token'),
				['is_readed' => true]
			);
		}
		else
		{
			$message = 'For note to readed this new is failed!!';
		}
		
		return response()->json([
			'message' => $message,
			'statusCode' => 200,
		]);
	});

	Route::get('/getTotalNewsNotReaded', function (Request $request){
		$userId = $request->get('user_id');
		if (empty($userId))
		{
			return response()->json([
				'message' => 'userId is required, missing user id to get total news are not readed',
				'statusCode' => 200,
			]);
		}

		$total = \App\News::whereNotIn('id', function($query) use ($userId){
			$query->from('check_readed')
                    ->select('new_id')
                    ->where('user_id', $userId)
                    ->where('is_readed', true)
                    ;
		})->count();

		return response()->json([
			'statusCode' => 200,
			'total' => $total ?? 0,
		]);
	});

	Route::get('/getNewsListNotReaded', function (Request $request){
		$userId = $request->get('user_id');
		if (empty($userId))
		{
			return response()->json([
				'message' => 'userId is required, missing user id to get total news are not readed',
				'statusCode' => 200,
			]);
		}

		$newsList = \App\News::whereNotIn('id', function($query) use ($userId){
			$query->from('check_readed')
                    ->select('new_id')
                    ->where('user_id', $userId)
                    ->where('is_readed', true)
                    ;
		})->get();

		return response()->json([
			'statusCode' => 200,
			'newsList' => $newsList,
		]);
	});


});

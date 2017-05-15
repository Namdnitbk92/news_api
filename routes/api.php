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
		session()->put('currentUser', $guard->user());
		$place_detail = $guard->user()->getAddressByUser();
		return response()->json(
			array_merge(
				baseResponse(200, 'Login sucessfully'),
				[
					'api_token' => $guard->user()->api_token,
					'current_user' => $guard->user(),
					'place_detail' => $place_detail,
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
// , 'city.name', 'check_readed.is_readed',
	Route::get('/getNewListByPlace', function (Request $request) {
		$user = \Auth::guard('api')->user();
		$type = $user->belong_to_place;
		$original_place_id = $user->original_place_id;

		if ($type === 'city')
		{
			$newsByCity = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('city', 'places.original_place_id', '=', 'city.id')
		    ->where('places.type', '=', $type)
		    ->where('places.original_place_id', '=', $original_place_id)
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'city.name as place_name')
		    ->get();

		    $temp = [];
		    $newsByCity = $newsByCity->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByCity = $temp;

		    $newsByCounty = [];
		    $newsByGuild = [];
		}
		else if ($type === 'county')
		{
			$newsByCity = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('city', 'places.original_place_id', '=', 'city.id')
		    ->where('places.type', '=', 'city')
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'city.name as place_name')
		    ->get(); 

		    $temp = [];
		    $newsByCity = $newsByCity->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByCity = $temp;

			$newsByCounty = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('county', 'places.original_place_id', '=', 'county.id')
		    ->where('places.type', '=', $type)
		    ->where('places.original_place_id', '=', $original_place_id)
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'county.name as place_name')
		    ->get();

		    $temp = [];
		    $newsByCounty = $newsByCounty->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByCounty = $temp;

		    $newsByGuild = [];
		} 
		else if($type === 'guild')
		{
			$guild = DB::table('guild')->where('id', $original_place_id)->first();
			$newsByCity = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('city', 'places.original_place_id', '=', 'city.id')
		    ->where('places.type', '=', 'city')
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'city.name as place_name')
		    ->get();

		    $temp = [];
		    $newsByCity = $newsByCity->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByCity = $temp;

			$newsByCounty = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('county', 'places.original_place_id', '=', 'county.id')
		    ->where('places.type', '=', 'county')
		    ->where('places.original_place_id', '=', $guild->county_id)
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'county.name as place_name')
		    ->get();

		    $temp = [];
		    $newsByCounty = $newsByCounty->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByCounty = $temp;

		    $newsByGuild = DB::table('news')
		    ->join('places', 'news.place_id', '=', 'places.place_id')
		    // ->leftJoin('check_readed', 'news.id', '=', 'check_readed.new_id')
		    ->leftJoin('guild', 'places.original_place_id', '=', 'guild.id')
		    ->where('places.type', '=', $type)
		    ->where('places.original_place_id', '=', $original_place_id)
		    ->where('news.status_id', '=', 3)
		    ->where('news.publish_time', '<=', \Carbon\Carbon::now())
		    ->select('news.*',  'places.type', 'places.original_place_id', 'guild.name as place_name')
		    ->get();

		    $temp = [];
		    $newsByGuild = $newsByGuild->each(function ($value, $key) use (&$temp, $user){
		    	$conds = ['new_id'=> $value->id, 'user_id' => $user->id, 'is_readed' => true];
		    	$read = \App\CheckReaded::where($conds)->first();
		    	if (!empty($read))
		    	{
		    		$value->is_readed = 1;
		    	}
		    	else
		    	{
		    		$value->is_readed = 0;
		    	}	

		    	$temp[] = $value;
			});
		    $newsByGuild = $temp;
		}

		return response()->json(array_merge(
			baseResponse(200, 'get list successfully'),
			compact('newsByCity', 'newsByCounty', 'newsByGuild')
		));
	});

	Route::post('/checkReaded' , function(Request $request) {
		$message = 'To readed this new is noted!!';
		if ($request->has('new_id') && $request->has('user_id'))
		{
			$data = ['new_id' => $request->get('new_id'), 'user_id' => $request->get('user_id')];
			$read = \App\CheckReaded::where($data)->first();
			if (!empty($read))
			{
				$read->update(array_merge($data, ['is_readed' => true]));
			}
			else
			{
				\App\CheckReaded::create(array_merge($data, ['is_readed' => true]));
			}
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

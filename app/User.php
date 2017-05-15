<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'api_token',
    ];

    public function getAddressByUser()
    {
        $belong_to_place = $this->belong_to_place;
        $original_place_id = $this->original_place_id;
        $guild = '';
        $county = '';
        $city = '';
        switch ($belong_to_place) {
                case 'city':
                    $original_place = \DB::table('city')->where('id', $original_place_id)->first();
                    // \App\City::find($original_place_id);
                    $city = $original_place ? $original_place->name : '';
                    break;
                
                case 'county':
                    // $original_place = \App\County::find($original_place_id);
                    $original_place = \DB::table('county')->where('id', $original_place_id)->first();
                    $parent = \DB::table('city')->where('id', $original_place->city_id)->first();
                    if ($original_place)
                    {
                        $county = $original_place->name;
                        $city = (isset($parent) ? $parent->name : '');
                    }
                    break; 

                case 'guild':
                    // $original_place = \App\Guild::find($original_place_id);
                    $original_place = \DB::table('guild')->where('id', $original_place_id)->first();
                    $county = \DB::table('county')->where('id', $original_place->county_id)->first();
                    $city = \DB::table('city')->where('id', $county->city_id)->first();
                    if ($original_place)
                    {
                        $guild = $original_place->name;
                        $county = (isset($county) ? $county->name : '');
                        $city = (isset($city) ? $city->name : '');
                    }
                    break;   

                default:
                    break;
            }

        return compact('guild', 'county', 'city');
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function news()
    {
        return $this->hasMany('App\News', 'user_id', 'id');
    }
}

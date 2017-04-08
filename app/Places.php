<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Places extends Model
{
    protected $table = "places";

    protected $fillable = [
        'user_id', 'lat', 'lng', 'type', 'name',
    ];

    public function news()
    {
        return $this->belongsTo('App\News', 'place_id');
    }
}

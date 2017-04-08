<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $table = "news";

    protected $fillable = [
        'title', 'sub_title', 'status_id', 'audio_path', 'place_id', 'user_id'
    ];

    public function places()
    {
        return $this->belongsTo('App\Places', 'place_id', 'place_id');
    }

    public function users()
    {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
}

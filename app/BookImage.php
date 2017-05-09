<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BookImage extends Model
{
    protected $fillable = [
        'id', 'book_id','image_url'
    ];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderedBook extends Model
{
    //

    protected $fillable = [
        'id', 'order_id', 'book_id', 'count', 'price', 'discount', 'created_at', 'updated_at'
        ];
}

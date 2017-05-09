<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    //
    protected $fillable = [
        'id', 'user_id','full_name','email', 'is_paid', 'order_date', 'trans_status', 'shipping_date', 'shipping_address',
         'shipping_province','shipping_district', 'shipping_ward','shipping_phone_number',
        'total_price', 'vat','ship_fee', '' ,'created_at', 'updated_at'
    ];
}
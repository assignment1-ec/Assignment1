<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->references('id')->on('users');/*--Constraint--*/
            $table->boolean('is_paid')->default(false);
            $table->dateTime('order_date')->nullable();
            $table->integer('trans_status')->nullable();
            $table->dateTime('shipping_date')->nullable();
            $table->string('shipping_address');
            $table->integer('shipping_province')->references('id')->on('province_regions');;
            $table->integer('shipping_district')->references('id')->on('district_regions');;
            $table->integer('shipping_ward')->references('id')->on('ward_regions');;
            $table->string('shipping_phone_number')->nullable();
            $table->integer('total_price')->nullable();
            $table->integer('vat')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}

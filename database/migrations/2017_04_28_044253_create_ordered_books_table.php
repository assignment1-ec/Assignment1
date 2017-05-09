<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrderedBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ordered_books', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id')->references('id')->on('orders');/*--Constraint--*/
            $table->integer('book_id')->references('id')->on('books');/*--Constraint--*/
            $table->integer('count')->nullable();
            $table->integer('price')->nullable();
            $table->integer('discount')->nullable();
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
        Schema::dropIfExists('ordered_books');
    }
}

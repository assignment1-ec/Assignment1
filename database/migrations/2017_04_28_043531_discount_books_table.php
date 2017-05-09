<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DiscountBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('discount_books', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('book_id')->references('id')->on('books');/*--Constraint--*/
            $table->integer('discount_percent');
            $table->integer('discount_price');
            $table->integer('start_date');
            $table->integer('end_date');
            $table->integer('count')->nullable();
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
        Schema::dropIfExists('discount_books');
    }
}

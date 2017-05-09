<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookManagementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_managements', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('book_id')->references('id')->on('books');/*--Constraint--*/
            $table->integer('count');
            $table->integer('sold_count_week');
            $table->integer('sold_count');
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
        Schema::dropIfExists('book_managements');
    }
}

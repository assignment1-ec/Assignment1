<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOldBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('old_books', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('book_id')->references('id')->on('books');/*--Constraint--*/
            $table->integer('user_id')->references('id')->on('users');/*--Constraint--*/
            $table->integer('count')->nullable();
            $table->string('address')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('price')->nullable();
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
        Schema::dropIfExists('old_books');
    }
}
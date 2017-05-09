<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('books', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->default('Không rõ');
            $table->boolean('is_published') ->nullable();
            $table->integer('price')->nullable();
            $table->string('author')->nullable();/*- TODO Nen co bang author*/
            $table->string('publisher')->nullable(); /*Nha Xuat ban*/
            $table->date('published_date')->nullable();
            $table->date('republished_date')->nullable();
            $table->integer('weight')->nullable();
            $table->string('isbn')->nullable();
            $table->string('language')->nullable(); /*--TODO: nen co bang language*/
            $table->string('short_description')->nullable();/**/
            $table->text('long_description')->nullable();
            $table->float('vat')->nullable();
            $table->string('icon')->nullable();
            $table->integer('book_type_id')->references('id')->on('book_types');/*--Constraint--*/
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
        Schema::dropIfExists('books');
    }
}

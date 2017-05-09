<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/

Auth::routes();

Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index');


Route::get('/transcript', 'HomeController@transcript');
Route::get('/return-term', 'HomeController@return_term');


//USER ACC
Route::match(['get', 'post'], 'account/profile', 'UserController@profile');
Route::post('account/changeProfile', 'UserController@changeProfile');
Route::post('account/changePassword', 'UserController@changePassword');

//BOOK
Route::match(['get', 'post'], 'book-explore', 'BookController@exploreBooks');
Route::match(['get', 'post'], 'books/{book_id}', 'BookController@detailBook');
Route::match(['get', 'post'], 'search/books', 'BookController@search');

Route::post('order', 'BookController@order');
Route::match(['get', 'post'], 'receipt', 'BookController@receipt');
Route::match(['get', 'post'], 'processReceipt', 'BookController@processReceipt');


//AUTHENTICATED GROUP
Route::group(['middleware' => 'auth'], function () {
    Route::match(['get', 'post'], 'add2cart', 'BookController@addToCart');
    Route::match(['get', 'post'], 'cart', 'BookController@cart');
    Route::match(['delete'], 'carts/{book_id}', 'BookController@deleteBookCart');
});


//REGION
Route::post('region/get-provinces', 'RegionController@getProvinces');
Route::get('region/get-districts/{province_id}', 'RegionController@getDistricts');
Route::get('region/get-wards/{district_id}', 'RegionController@getWards');

//API
Route::match(['get', 'post'], 'api/search/books', 'Api\SearchController@searchBooks');



<?php
/**
 * Created by PhpStorm.
 * User: vrams
 * Date: 4/23/2017
 * Time: 8:24 PM
 */

namespace App\Http\Controllers;

use App\Book;
use App\BookType;
use Illuminate\Http\Request;

class HomeController extends Controller{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $hot_week_category_books = Book::all() -> take(10);
        $sold_hot_years_category_books = $hot_week_category_books;
        $new_hot_category_books = $hot_week_category_books;

        return view('home', ['hot_week_category_books'=> $hot_week_category_books,
            'sold_hot_years_category_books'=> $sold_hot_years_category_books,
            'new_hot_category_books'=> $new_hot_category_books
            ]

        );
    }

    public function transcript()
    {
        return view('transcript');
    }

    public function  return_term(){
        return view('return-term');
    }


} 
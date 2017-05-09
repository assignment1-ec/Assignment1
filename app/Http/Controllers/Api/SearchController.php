<?php

namespace App\Http\Controllers\Api;

use App\BookType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;


class SearchController extends Controller
{
    //

    public function searchBooks(Request $request){
        $keyword = $request -> input('keyword');
        $category = $request -> input('category');
        $bookType = null;
        if($category != null) {
            $bookType = BookType::where('typename', 'like', $category);
            $bookType = $bookType->first();
        }
        if($bookType != null) {
            $books = DB::select('SELECT id, name, author, publisher, short_description, weight, vat, icon'
                .' FROM books'
                .' WHERE name LIKE ?' . ' AND book_type_id =?'
                .' LIMIT '. 5
                , ['%'.$keyword.'%', $bookType->id]);
        }else{
            $books = DB::select('SELECT id, name, author, publisher, short_description, weight, vat, icon'
                                .' FROM books'
                      .' WHERE name LIKE ?'
                      .' LIMIT '. 5
                , ['%'.$keyword.'%']);
        }

        $arr = json_decode(json_encode($books), true);
        $arrLen = count($arr);
        for($i = 0; $i < $arrLen; $i++){
            $arr[$i]['url'] = URL::to('/').'/books/'.$arr[$i]['id'];
        }

        return json_encode($arr);
    }

}

<?php

namespace App\Http\Controllers;

use App\Book;
use App\BookImage;
use App\BookType;
use App\Cart;
use App\DistrictRegion;
use App\Order;
use App\OrderedBook;
use App\ProvinceRegion;
use App\WardRegion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Mail;

class BookController extends Controller
{
    //

    public function getBookTypes(){
        $book_types = BookType::all();
        return $book_types;
    }

    public function exploreBooks(Request $request){
        if($request -> input('category') == null){
            //TODO REDIRECT to HOME
        }
        $books = Book::all()->take(20); //TODO
        $data = array();
        $data[0]['books'] = $books;
        $data[0]['category_name'] = $request -> input('category');
        return view('explore_books', ['data' => $data]);
    }

    public function  detailBook($bookId){
        $book = Book::where('id', $bookId)->first();
        $img = DB::select('SELECT * FROM book_images WHERE book_id = ?', [$bookId]);
        //$book = Book::all();
        if($book == null){

        }else {
            return view('book_detail', ['book' => $book, 'book_images' => $img]);
        }
    }

    public function search(Request $request){ //TODO: SEARCH RESULT GROUP BY BOOK_TPYE, Phân trang
        $keyword = $request -> input('keyword');
        $category = $request -> input('category');
        $bookType = null;
        if($category != null) {
            $bookType = BookType::where('typename', 'like', $category);
            $bookType = $bookType->first();
        }
        if($bookType != null) {
            $books = DB::select('SELECT * FROM books WHERE name LIKE ?' . ' AND book_type_id =?'.' LIMIT '. 30 , ['%'.$keyword.'%', $bookType->id]);
        }else{
            $books = DB::select('SELECT * FROM books WHERE name LIKE ?'. ' LIMIT '. 30, ['%'.$keyword.'%']);
        }
        return view('search_book_results', ['search_results' => $books, 'search_categories' => $category, 'search_keyword' => $keyword]);
    }


    public function addToCart(Request $request){ //TODO XU LY KHONG CAN LOGIN
        //$this->middleware('auth');
        if($request->isMethod('post')){
            $data = $request->all();
            //VALIDATE
            //$this->validateCartInput($data)->validate();
            //ADD CART

            //$select = DB::select("select number FROM carts WHERE user_id = ? AND id = ?", [$request->user()->id, $data['book_id']]);
            $select = Cart::all()->where('user_id', $request ->user()->id) -> where('book_id', $data['book_id']) -> first();
            $select = Cart:: where('user_id', $request->user()->id) ->where('book_id',$data['book_id']) -> first();
            if(count($select) <= 0) {
                $cart = Cart::create([
                    'book_id' => $data['book_id'],
                    'user_id' => $request->user()->id,
                    'number' => $data['item_count']
                ]
                );
            }else{ //TODO CAN XU LI TRUONG HOP NHIEU ROWS
                //UPDATE
                $number = $select -> number + $data['item_count'];
                $select -> number = $number;
                $select->save();
            }
            return back()->with(['msg' => 'Thêm vào giỏ hàng thành công', 'type' => 'success']);
        }else{ //TODO-> Prompt Error Message
            return back() -> withErrors(['msg' => "Lỗi, Request không hợp lệ", 'type' => 'error']);
        }
    }

    public function validateCartInput($data){
        $validator = Validator::make($data, [
            'book_id' => 'required',
            'item_count' => 'required|integer|min:1'
        ]);
        return $validator;
    }

    public function cart(Request $request){
        $sql = 'SELECT carts.id, carts.book_id, carts.number, books.name, books.price, books.publisher'
        .', books.republished_date, books.author, books.isbn, books.weight, books.short_description, books.vat, books.icon'
            .' FROM carts'
             .' LEFT JOIN books ON carts.book_id = books.id'
              .'  WHERE carts.user_id = ?';
        $result = DB::select($sql, [$request->user()->id]);
        return view('cart', ['items' => $result]);
    }

    public function deleteBookCart($book_id){
        //TODO CHECK METHOD IS A DELETE METHOD
        DB::table('carts') -> where('book_id', '=', $book_id) -> delete();
        return back()->with(['msg' => '', 'type' => 'success']);
    }

    public function order(Request $request){ //TODO STORE REGIONS IN DATABASE (Khu Vuc, Dia chi)
        //TODO: VALIDATE INPUTS (JSON)
        $data = $request->input();
        $orders = json_decode($data['json'], true);
        $provinces =  ProvinceRegion::all(); //json_decode(app('App\Http\Controllers\RegionController') -> getProvinces());
        return view('order', ['orders' => $orders, 'cover_price' => 5000, 'sticker_price' => 6000,
            'present_price' => 10000, 'provinces' => $provinces]);
    }

    public function receipt(Request $request){//TODO
        $input = $request->all();
        /*$validator = $this->validateReceiptInput($input);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }*/

        $province = ProvinceRegion::where('id', $input['customer_province']) ->first();
        $district = DistrictRegion::where('id', $input['customer_district']) ->first();
        $ward = WardRegion::where('id', $input['customer_ward']) ->first();;
        $phone = $input['customer_phone'];
        $address = $input['customer_address'];
        $full_name = $input['customer_full_name'];
        $orders = json_decode($input['orders'], true);
        $ship_fee = 20000;
        $email = $input['customer_email'];

        return view('receipt', ['province' => $province, 'district' => $district, 'ward' => $ward,
        'phone' => $phone, 'address' => $address, 'full_name' => $full_name, 'orders' => $orders,
            'ship_fee' => $ship_fee,
            'email' => $email
        ]);
    }

    protected  function validateReceiptInput($input){
        $validator = Validator::make($input, [
            'customer_province' => 'required|integer|min:1',
            'customer_district' => 'required|integer|min:1',
            'customer_ward' => 'required|integer|min:1',
            'customer_phone' => 'required|integer|min:1', //TODO FIX VALIDATE
            'customer_full_name' => 'required|string|max:255',
            'orders' => 'required|string',
            'customer_email' => 'required|string|email|max:255',
        ]);
        return $validator;
    }


    public function processReceipt(Request $request){ // TODO
        $input = $request->all();
     /*   $validator = $this->validateReceiptInput($input);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }*/

        $province = ProvinceRegion::where('id', $input['customer_province']) ->first();
        $district = DistrictRegion::where('id', $input['customer_district']) ->first();
        $ward = WardRegion::where('id', $input['customer_ward']) ->first();;
        $phone = $input['customer_phone'];
        $address = $input['customer_address'];
        $full_name = $input['customer_full_name'];
        $orders = json_decode($input['customer_orders'], true);
        $ship_fee = $input['ship'] == 'fee_ship'? 20000 : 0;
        $email = $input['customer_email'];
        $userId = Auth::user() != null? Auth::user()->id : 0;
        $total = $this->getTotalPriceVat($orders);
        $od = Order::create([
            'user_id' => $userId,
            'full_name' => $full_name,
            'is_paid' => 0,
            'shipping_address' => $address,
            'shipping_province' => $province -> id,
             'shipping_district' => $district-> id,
            'shipping_ward' => $ward -> id,
            'shipping_phone_number' => $phone,
            'ship_fee' => $ship_fee,
            'email' => $email,
            'total_price' => $total['total'] + $total['vat'],
            'vat' => $total['vat']
        ]);

        //ADD ORDERED_BOOK

        foreach($orders as $order){
            $ob = OrderedBook::create([
                'order_id' => $od->id,
                 'book_id' => $order['book_id'],
                  'count' => $order['count'],
                  'price' => $order['price']
                   //'discount' => $order['discount'],//TODO DO LATER


            ]);
        }/*id	order_id	book_id	count	price	discount	created_at	updated_at*/

        //TODO ======================================> GUI EMAIL
        $email_msg = "Cảm ơn quý khách đã mua sách tại website chúng tôi! Mã đơn đặt hàng của quý khách là ". $od->id .'.';

        $email_data = ['province' => $province, 'district' => $district, 'ward' => $ward,
            'phone' => $phone, 'address' => $address, 'full_name' => $full_name, 'orders' => $orders,
            'ship_fee' => $ship_fee,
            'email' => $email,
            'email_msg' => $email_msg,
            'ship_type' => $input['ship']
        ];

        Mail::send('email.receipt_v1', $email_data, function($message) use ($email, $full_name){
            $message->to($email, $full_name)->subject('Đơn đặt hàng từ cửa hàng Swift Shop');
        });

        //==============

        $msgTitle1 = "Đặt hàng thành công! Mã đơn đặt hàng của quý khách là ". $od->id .'.';
        $msgBody1 = " Vui lòng kiểm tra email!";
        $msg = [
                ['title' => $msgTitle1, 'body' => $msgBody1],
      /*          ['title' => 'Mã số đặt hàng của bạn là', 'body' => $od->id],*/
                ['title' => 'Cảm ơn quý khách đã tin tưởng và mua hàng online tại website chúng tôi.', 'body' => '']
        ];
        return view('message', ['messages' => $msg, 'title' => 'Đặt hàng thành công!']);
    }

    private function getTotalPriceVat($orders){
        $total = 0;
        $vat = 0;
        foreach($orders as $order){
            $total += $order['price'] * $order['count'];
            $vat += ($order['vat'] *$order['price']) * $order['count'];
        }
        return ['total' => $total, 'vat'=> $vat];
    }



}

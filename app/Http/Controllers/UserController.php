<?php
/**
 * Created by PhpStorm.
 * User: vrams
 * Date: 4/27/2017
 * Time: 8:06 AM
 */

namespace App\Http\Controllers;

use App\OrderedBook;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function profile(){
        $sql = 'SELECT	ordered_books.book_id,'
                .'ordered_books.count,'
                .'ordered_books.discount,'
                .'ordered_books.order_id,'
                .'orders.is_paid,'
                .'books.name,'
                .'books.price,'
                .'books.icon,'
                .'books.author'
                .' FROM orders'
                .' RIGHT JOIN ordered_books ON orders.id = ordered_books.order_id'
                .' LEFT JOIN books ON ordered_books.book_id = books.id'
                .' WHERE orders.user_id= ?'
        ;

        $ordered_books = DB::select($sql, [Auth::user()->id]);
        return view('user.info', ['ordered_books' => $ordered_books]);
    }


    public function changeProfile(Request $request){
        if ($request->isMethod('post')) {
            $this->validateChangingUserProfile($request, $request->all())->validate();
            /*if ($validator->fails()) {
                return redirect()->back()
                    ->withErrors($validator)
                    ->withInput();
            }*/

            $user = $request->user();
            $user = User::findOrFail( $user->id );
            $user->full_name = $request->input('full_name');
            $user->email = $request->input('email');
            $user->username = $request->input('username');
            $phone_number = $request->input('phone_number');
            if($phone_number != null) {
                $user->phone_number = $phone_number;
            }
            $user->save();
            return back()->with('changed', 'Your profile has been changed.');
        }else{
            abort('550');
        }

    }


    protected function validateChangingUserProfile(Request $request, array $data)
    {
        $validator =  Validator::make($data, [
            'full_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'username' => 'required|string|max:255' // So dien thoai phai duy nhat va hop le
        ]);

        $user = $request->user();
        if($request ->input('email') != $user->email){
            $us = User::where('email', $request->input('email'));
            if($us != null){
                $validator->getMessageBag()->add('email', 'email đã tồn tại');
            }
        }
        if($request ->input('username') != $user->username){
            $us = User::where('username', $request->input('username'));
            if($us != null){
                $validator->getMessageBag()->add('username', 'username đã tồn tại');
            }
        }
        return $validator;
    }


    public function changePassword(Request $request){
        if ($request->isMethod('post')) {
            $this->validateChangingPassword($request)->validate();
            $user = User::findOrFail( $request->user()->id );
            //$oldPass = bcrypt($request->input('old_password'));
            if(Hash::check($request->input('old_password'),$user->password )){
                $user->password = bcrypt( $request->input('new_password') );
                $user->save();
                return back()->with('changed', 'Mật khẩu đã được thay đổi thành công');
            }else{
                return back()->with('error', 'Mật khẩu cũ không đúng');
            }
        }else{
            abort('550');
        }
    }

    protected  function validateChangingPassword(Request $request){
        $validator =  Validator::make($request->all(), [
            'old_password' => 'required|string|max:255|min:6',
            'new_password' => 'required|string|max:255|min:6|same:new_confirmation_password'
        ]);

        return $validator;

    }

} 
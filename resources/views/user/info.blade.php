@extends('...layouts.master')
@section('title')
    {{Auth::user()->full_name}}
@endsection
@section('content')
    <div class="container-fluid main-page ">
        <ul class="breadcrumb">
            <li><a href="{{url('/')}}">Trang chủ</a></li>
            <li>Thông tin người dùng</li>
        </ul>
        <div class="content-page user-bar">
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a data-toggle="tab" href="#userinfo">Thông tin người dùng</a></li>
                    <li><a data-toggle="tab" href="#chang-pwd">Đổi mật khẩu</a></li>
                    <li><a data-toggle="tab" href="#history">Lịch sử mua hàng</a></li>
                </ul>
            </div>
            <div class="col-md-9">
                <div class="panel panel-default user-panel">
                    <div class="panel-body">
                        <div class="tab-content">
                            <form id="userinfo" class="tab-pane fade in active" role="form" method="POST" action="{{ url('account/changeProfile') }}" >

                                <div class="row">
                                 {{csrf_field()}}
                                    <div class="col-md-2">
                                        <img id="avatar" src="{{asset('images/avatar.jpg')}}" alt="avatar" width="95" height="100">
                                        <input type="file"  name="avatar" value="Avatar" id="upload-avatar">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="col-md-5">
                                            <input type="text" name="full_name" id="user-fullname" class="user-fullname" value="{{Auth::user()->full_name}}">
                                        </div>
                                        <div class="col-md-5">
                                            <button id="edit-fullname" onclick="return false;"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="full-info">
                                    <table>
                                        <tr>
                                            <td>
                                                <label for="user-name">Tên đăng nhập :</label>
                                            </td>
                                            <td>
                                                <input id="user-name" name="username" type="text" value="{{Auth::user()->username}}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="user-email">Địa chỉ email:</label>
                                            </td>
                                            <td>
                                                <input id="user-email" name="email" type="email" value="{{Auth::user()->email}}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="user-phone">Số điện thoại:</label>
                                            </td>
                                            <td>
                                                <input id="user-phone" name="phone_number" type="text" value="{{Auth::user()->phone_number}}">
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <input id="submit" type="submit" class="btn btn-primary btn-nhat" value="Lưu">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>

                            <form id="chang-pwd" class="tab-pane fade" method="post"action="{{ url('account/changePassword') }}">
                                {{csrf_field()}}
                                <table>
                                    <tr>
                                        <td>
                                            <label for="user-pwd">Nhập mật khẩu:</label>
                                        </td>
                                        <td>
                                            <input id="user-pwd" name="old_password" type="password" placeholder="Nhập mật khẩu">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="user-renew-pwd">Mật khẩu mới:</label>
                                        </td>
                                        <td>
                                            <input id="user-renew-pwd" name="new_password" type="password" placeholder="Mật khẩu mới">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="user-renew-repwd">Nhập lại mật khẩu mới:</label>
                                        </td>
                                        <td>
                                            <input id="user-renew-repwd" name="new_confirmation_password" type="password" placeholder="Nhập lại mật khẩu mới">
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <input id="submit-repwd" type="submit" class="btn btn-primary btn-nhat" value="Lưu">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div id="history" class="tab-pane fade">
                                @foreach($ordered_books as $ordered_book)
                                <div class="item">
                                    <div class="col-md-2">
                                        <img src="{{asset($ordered_book->icon)}}" alt="item" width="150" height="170">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="col-md-10">
                                            <a href="{{url('books/'. $ordered_book->book_id)}}"><h3>{{$ordered_book->name}}</h3></a>
                                            <p>Giá : {{number_format($ordered_book->price, 0)}}<sup>đồng</sup></p>
                                            <p><?php echo ($ordered_book->is_paid == 0? "Chưa thanh toán" : "Đã thanh toán") ?></p>
                                        </div>
                                       {{-- <div class="col-md-2">
                                            <button><i class="fa fa-search " aria-hidden="true "></i></button>
                                        </div>--}}
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-lg"></div>
        </div>
    </div>
@endsection
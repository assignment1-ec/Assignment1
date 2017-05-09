
<?php
    use \Illuminate\Support\Facades\Auth;
    $book_types = \App\BookType::all();
    $cartItemCount = 0;
    if(!Auth::guest()){
        $cart = \Illuminate\Support\Facades\DB::select('SELECT id FROM carts WHERE user_id = ?', [Auth::id()]);
        $cartItemCount = count($cart);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>@yield('title','Swift-Book Shop')</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="{{asset('css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('plugin/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{ url('vendor/selectize/css/selectize.bootstrap3.css') }}" rel="stylesheet">

    {{--<link rel="stylesheet" href="{{asset('css/jquery-ui.css')}}">--}}
    <link href="{{asset('css/style.css')}}" rel="stylesheet">
    <link href="{{asset('css/main-style.css')}}" rel="stylesheet">
    @yield('styles')

</head>

<body>
    <div class="header-page ">
        <div style="width: 100%" class="row navbar navbar-inverse" data-spy="affix" data-offset-top="197">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                 </button>
            <div class="col-md-2">
                <h3 class="title-page">
                    <a href="{{url('/')}}"><img src="{{asset('images/logo2.png')}}" alt="logo"></a>
                </h3>
            </div>
            <div class="col-md-7">
                <section id="search">
                    <div class="dropdown">
                        <a  id="search-form_dropdown-title" class="dropdown-toggle" data-toggle="dropdown">Tất cả <span class="caret"></span> </a>
                        <ul class="dropdown-menu">
                            <li><a onclick="onCategoryNameClicked(this)">Tất cả</a></li>
                            @foreach($book_types as $book_type)
                                <li><a onclick="onCategoryNameClicked(this)">{{$book_type->typename}}</a></li>
                            @endforeach
                        </ul>
                    </div>
                    <button type="button" id="btnSearch"><i class="fa fa-search" aria-hidden="true"></i></button>
                   <form  style="background: transparent" method="get" action="{{url('search/books')}}">
                        <input name="keyword" id="search-input1" class="form-control input-lg" placeholder="Tìm kiếm " autocomplete="off" spellcheck="false" autocorrect="off" tabindex="1">
                        <input id="search-from_category" type="hidden" name="category" value="Tất cả">
                        <a id="search-clear" href="#" class="fa fa-times-circle hide" aria-hidden="true"><span class="sr-only">Clear search</span></a>
                    </form>
                </section>

               {{-- <section id="search">
                    <div class="dropdown" name="category">
                        <select name="category">
                            <option selected><a href="#">Tất cả</a></option>
                            @foreach($book_types as $book_type)
                                <option><a href="#">{{$book_type->typename}}</a></option>
                            @endforeach
                        </select>
                    </div>
                    <button type="button" id="btnSearch"><i class="fa fa-search" aria-hidden="true"></i></button>
                    <input id="search-input" name="keyword" class="form-control input-lg" placeholder="Tìm kiếm " autocomplete="off" spellcheck="false" autocorrect="off" tabindex="1">
--}}{{--
                    <a id="search-clear" href="#" class="fa fa-times-circle hide" aria-hidden="true"><span class="sr-only">Clear search</span></a>
--}}{{--                --}}{{--//TODO--}}{{--
--}}{{--
                    <select  placeholder="Search products or categories..." class="form-control"></select>
--}}{{--

                </section>--}}
            </div>
            <div class="col-md-3 clearfix ">
                <section class="sale-icon">
                    <a href="{{url('cart')}}"><i class="fa fa-cart-plus pull-right  cart-shop " aria-hidden="true"><span class="badge">{{$cartItemCount > 0? $cartItemCount : ""}}</span></i></a>
{{--
                    <a href="#"> <i class="fa fa-shopping-bag pull-right  bag-shop" aria-hidden="true"></i></a>
--}}
                </section>
            </div>
        </div>
        <div class="col-md-offset-1">
            <nav class=" navbar navbar-inverse nav-custom " style="z-index: 1;">
                <div class="collapse navbar-collapse " id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="{{url('/')}}" class="active-choice"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp;Trang chủ</a></li>
                        <li><a href="{{url('/return-term')}}"><i class="fa fa-motorcycle" aria-hidden="true"></i>&nbsp;Chính sách đổi trả</a></li>
                        <li><a href="{{url('/transcript')}}"><i class="fa fa-cart-plus" aria-hidden="true"></i>&nbsp;Quy trình mua hàng</a></li>
                        <li><a href="#footer-page"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp; Liên hệ tư vấn</a></li>
                        <li><a href="#footer-page"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp; Thông tin công ty</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                    @if (Auth::guest())
                        <li><a href="{{ route('login') }}" class="login" id="login"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp; Đăng nhập</a></li>
                    @else
                        <li><a href="{{url('/account/profile')}}" class="login" id="userinfo"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Xin chào {{ Auth::user()->full_name }}</a></li>
                        <li><a href="{{ route('logout') }}" class="login" id="login"  onclick="event.preventDefault();
                                                                        document.getElementById('logout-form').submit();">
                            <i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp; Đăng xuất
                            </a>
                        </li>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                                    {{ csrf_field() }}
                                                                </form>
                    @endif
                    </ul>
                </div>
            </nav>
        </div>
    </div> <!--end-->
    <div class="container-fluid main-page">
        @yield('content')
    </div>
    <div class="footer-page">
        <section>
            <div class=" col-md-offset-2 col-md-8">
                <div class="col-xs-6 col-md-6 ">
                    <h3>Danh mục </h3>
                    <ul>
                        <li>
                            <a href="#">Đặt hàng</a>
                        </li>
                        <li>
                            <a href="#">Kho sách</a>
                        </li>
                        <li>
                            <a href="#">Liên hệ</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6 col-md-6">
                    <h3>Liên hệ </h3>
                    <ul>
                        <li>
                            <a href="#"><i class="fa fa-phone" aria-hidden="true"></i> &nbsp; +123456789 Support by Pê Đê</a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="copy-right" id="footer-page">
            <a href="https://github.com/assignment1-ec/Assignment1">https://github.com/assignment1-ec/Assignment1</a>
            <p>@2017 Swift-Book Shop. All Rights Reserved</p>
        </div>
    </div>
    <script type="text/javascript">
        var root = '{{url("/")}}';

        function onCategoryNameClicked(ele){
            document.getElementById('search-from_category').value = ele.innerHTML+"";
            document.getElementById('search-form_dropdown-title').innerHTML = ele.innerHTML +"";
        }
    </script>

     <script src="{{asset('js/jquery-3.1.1.min.js')}}"></script>
     <script src="{{asset('js/bootstrap.min.js')}}"></script>
     <script type="text/javascript" src='{{ url("vendor/selectize/js/standalone/selectize.min.js") }}'></script>
     {{--<script src="{{asset('plugin/ckeditor/ckeditor.js')}}"></script>--}}
     {{--<script src="{{asset('js/jquery-ui.js')}}"></script>--}}
     <script src="{{asset('js/main.js')}}"></script>
     <script src="{{asset('js/script.js')}}"></script>
    @yield('scripts')

</body>

</html>
@extends('...layouts.master')
@section('title')
    {{'Đăng nhập tài khoản Swift-Book Shop'}}
@endsection
@section('content')
    <div class="col-md-4 col-md-offset-4">
            <div class="title-page text-center">
                <a href="{{url('/')}}"><img src="images/logo2.png" alt="logo"></a>
            </div>
            <ul class="nav nav-tabs tab-user">
                <li class="active"><a data-toggle="tab" href="#signin"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp; Đăng nhập</a></li>
                <li><a data-toggle="tab" href="#signup"><i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;Đăng kí</a></li>

            </ul>
            <div class="tab-content">
                <div id="signin" class="tab-pane fade in active">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('login') }}">
                     {{ csrf_field() }}
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" id="user-name" required>
                                @if ($errors->has('username'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" id="user-pwd" required>
                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="signin-button">
                                <button type="submit" id="user-login" class="btn btn-primary">Đăng nhập</button>
                                <section class="clearfix">
                                    <div class="checkbox pull-left">
                                        <label><input type="checkbox" value="">Nhớ mật khẩu</label>

                                    </div>

                                    <a href="{{ route('password.request') }}" class="pull-right">Quên mật khẩu ?</a>
                                </section>
                            </div>
                        </div>
                    </form>
                </div>

                {{--============================================ SIGN UP ===========================================================--}}

                <div id="signup" class="tab-pane fade">
                    <form  class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
                        {{csrf_field()}}
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" name="full_name" placeholder="Họ và tên" id="user-fullname" required>
                                @if ($errors->has('full_name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('full_name') }}</strong>
                                    </span>
                                @endif
                                <input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" id="user-name" required>
                                @if ($errors->has('username'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                                <input type="email" class="form-control" name="email" placeholder="Nhập email" id="user-email" required>
                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" id="user-pwd" required>
                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                                <input type="password" class="form-control" name="password_confirmation" placeholder="Nhập lại mật khẩu" id="user-re-pwd" required>
                            </div>
                            <div class="signin-button">
                                <button type="submit" class="btn btn-primary">Đăng kí</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </form>
    </div>
@endsection

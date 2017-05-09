@extends('layouts.master')
@section('title')
    {{'Quy trình mua hàng'}}
@endsection
@section('content')
<div class="container-fluid main-page">
        <ul class="breadcrumb">
            <li><a href="{{url('/')}}">Trang chủ</a></li>
            <li>Quy trình mua hàng</li>
        </ul>
        <div class="content-page transcript-bar">
            <div class="col-md-3 ">
                <div class="transcript-around">
                    <h1>Thêm vào giỏ hàng</h1>
                    <label><i class="fa fa-cart-plus" aria-hidden="true"></i></label>
                </div>

            </div>
            <div class="col-md-3 ">
                <div class="transcript-around">
                    <h1>Kiểm tra đơn hàng</h1>
                    <label><i class="fa fa-money" aria-hidden="true"></i></label>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="transcript-around">
                    <h1>Xác nhận thông tin</h1>
                    <label><i class="fa fa-check-circle" aria-hidden="true"></i></label>

                </div>
            </div>
            <div class="col-md-3">
                <div class="transcript-around">
                    <h1>Hoàn thành</h1>
                    <label><i class="fa fa-shopping-bag" aria-hidden="true"></i></label>
                </div>
            </div>

        </div>
</div>
@endsection
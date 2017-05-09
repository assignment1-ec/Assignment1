@extends('layouts.master')
@section('title')
    {{'Chính sách đổi trả'}}
@endsection
@section('content')
<div class="container-fluid main-page">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li>Chính sách đổi trả</li>

    </ul>
    <div class="content-page">
        <h1>Đổi trả hàng dễ dàng với <strong>Swift-Book Shop</strong></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th>Kể từ khi giao hàng</th>
                        <th>Sản phẩm lỗi</th>


                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Với các đơn hàng Online</td>
                        <td>7 ngày</td>
                        <td>Đổi mới Trả không thu phí</td>

                    </tr>
                    <tr>
                        <td>Các đơn hàng còn lại</td>
                        <td>
                            2 tuần
                        </td>
                        <td>Trả không thu phí</td>

                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
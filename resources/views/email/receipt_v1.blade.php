@extends('layouts.email')
@section('content')
<!-- Begin Conttent -->
<div class="container-fluid main-page">
    <div class="content-page">

        <div class="alert alert-success">
            <strong>{{$email_msg}}</strong>
         </div>

        <div class="recript">
            <h4 class="title-receipt">Thông tin khách hàng</h4>
            <div class="row info-receiver">
                <hr>
                <div class="info-1">
                    <label class="name-receiver">Khách hàng: {{$full_name}}</label><br>
                    <label class="address-receiver">{{$address}}</label><br>
                    <label class="city-receiver">{{$province -> name}}</label> <span> - </span> <label class="district-receiver">{{$district -> name}}</label> <span> - </span><label class="wards-receiver">{{$ward -> name}}</label><br>
                    <label>Điện thoại di động:</label><span>  </span><label class="phone-num">{{$phone}}</label><br>
                </div>
            </div>
            <div class="row info-receipt">
                <h4 class="title-receipt">Thông tin đơn hàng <span>({{count($orders)}})</span></h4>
                <hr>
                <table>
                    <tr>
                        <th class="col-1">Mã sản phẩm</th>
                        <th class="col-2">Tên sản phẩm</th>
                        <th class="col-3">Số lượng</th>
                        <th class="col-4">Đơn giá</th>
                        <th class="col-4">VAT (1 sản phẩm)</th>
                    </tr>

                    <?php
                        $total = 0;
                        $vat = 0;
                    ?>

                    @foreach($orders as $order)
                         <?php
                            $total += $order['price'] * $order['count'];
                            $vat += ($order['vat'] *$order['price']) * $order['count'];
                        ?>
                        <tr>
                            <td class="pro-col-1">{{$order['book_id']}}</td>
                            <td class="pro-col-2">{{$order['name']}}</td>
                            <td class="pro-col-3">{{$order['count']}}</td>
                            <td class="pro-col-4">{{number_format($order['price'], 0)}}<span> VND</span></td>
                            <td class="pro-col-3">{{number_format($order['vat'] * $order['price'], 0)}}<span> VND</span></td>
                        </tr>
                    @endforeach
                </table>
            </div>

            <div>
                <div class="row date-ship">
                    <h4 class="title-receipt"></h4>
                    <hr>
                    @if($ship_type == 'free_ship')
                        <label for="free_ship">Giao hàng miễn phí (3 - 5 ngày kể từ ngày đặt hàng)</label> <br>
                    @else
                     <label for="fee_ship"> Giao hàng nhanh {{number_format($ship_fee, 0)}} VND (2 ngày kể từ ngày đặt hàng)</label><br>
                    @endif
                </div>
                <div class="row total-receipt">
                    <label class="total-rec">Tổng hóa đơn (bao gồm VAT<?php  echo $ship_type == 'free_ship'? '': ' + Vận chuyển' ?>): </label><label class="num-money" id="total-rec-total-money"><strong><h3 style="display: inline-block">{{number_format($vat + $total + $ship_fee, 0)}}</h3></strong><span> VND</span></label><br>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Content -->
@endsection

@section('scripts')
<script>

</script>
@endsection


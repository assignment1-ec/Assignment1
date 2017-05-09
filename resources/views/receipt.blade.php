@extends('layouts.master')
@section('title')
    {{'Thông tin thanh toán'}}
@endsection
@section('content')
<!-- Begin Conttent -->
<div class="container-fluid main-page">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li>Thông tin thanh toán</li>
    </ul>
    <div class="content-page">
        <div class="recript">
            <div class="row info-receiver">
                <hr>
                <div class="info-1">
                    <label class="name-receiver">{{$full_name}}</label><br>
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
            <form method="post" action="{{url('processReceipt')}}">
                    {{ csrf_field() }}
                <div class="row date-ship">
                    <h4 class="title-receipt">Thông tin giao hàng</h4>
                    <hr>
                    <input  onclick="onShipMethodChanged(this)" type="radio" name="ship" checked="checked" id="free_ship" value="free_ship"><label for="free_ship">Giao hàng miễn phí (3 - 5 ngày kể từ ngày đặt hàng)</label> <br>
                    <input onclick="onShipMethodChanged(this)" type="radio" name="ship" id="fee-ship" value="fee_ship"><label for="fee_ship"> Giao hàng nhanh {{number_format($ship_fee, 0)}} VND (2 ngày kể từ ngày đặt hàng)</label><br>
                </div>
                <div class="row total-receipt">
                    <label class="total-rec">Tổng hóa đơn (bao gồm VAT + vận chuyển): </label><label class="num-money" id="total-rec-total-money">{{number_format($vat + $total, 0)}}<span> VND</span></label><br>
                    <button class="btn btn-primary btn-confirm  btn-nhat" id="submit">Xác nhận đơn hàng</button>
                </div>
                <input type="hidden" name="customer_address" value="{{$address}}">
                <input type="hidden" name="customer_full_name" value="{{$full_name}}">
                <input type="hidden" name="customer_province" value="{{$province -> id}}">
                <input type="hidden" name="customer_district" value="{{$district -> id}}">
                <input type="hidden" name="customer_ward" value="{{$ward->id}}">
                <input type="hidden" name="customer_phone" value="{{$phone}}">
                <input type="hidden" name="customer_email" value="{{$email}}">
                <input type="hidden" name="customer_orders" value="{{json_encode($orders)}}">
            </form>
        </div>
    </div>
</div>
<!-- End Content -->
@endsection

@section('scripts')
<script>
    var totalPrice = {{$vat + $total}};
    var ship_fee = {{$ship_fee}};
    var totalEle = document.getElementById('total-rec-total-money');
    function onShipMethodChanged(element){
        if(element.value == 'free_ship'){
            totalEle.innerHTML = ((totalPrice).formatMoney(0) +  '<span> VND </span>');
        }else if(element.value == 'fee_ship'){
             totalEle.innerHTML = ((totalPrice + ship_fee).formatMoney(0) +  '<span> VND </span>');
        }else{
            alert('Lỗi, không rõ phương thức vận chuyển -_-');
        }
    }


</script>
@endsection


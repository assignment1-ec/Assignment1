<?php
 use Illuminate\Support\Facades\Auth;?>

@extends('layouts.master')
@section('title')
    {{'Swift Book Shop-Đặt hàng'}}
@endsection
@section('content')
<!-- Begin Conttent -->
<div class="container-fluid main-page">
    <ul class="breadcrumb">
        <li><a href="index.html">Trang chủ</a></li>
        <li>Đặt hàng</li>
    </ul>
    <div class="content-page">
        <div class="row">
            <div class="col-md-8 col-xs-12">
                <div class="login-buy">
                    <div class="title-buy">
                        <h4 class="log-buy-title">ĐẶT HÀNG</h4>
                    </div>
                    <div class="info-customer">

                        <!-- edit -->
                        <div class="row">{{--
                            <div class="col-md-7 col-xs-12">
                                <div class="info-email">
                                    <h4 class="title-customer">Chọn hình thức mua hàng (Đăng nhập tài khoản hoặc không đăng nhập)</h4>
                                    <table>
                                        <tr>
                                            <td class="label-input-email">Xin vui lòng nhập Email: </td>
                                        </tr>
                                        <tr>
                                            <td class="textbox-input-email">
                                                <input type="email" id="user-email" placeholder="example@gmail.com" name="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="radio-check" id="user-no-register">
                                                <input type="radio" name="choose-login" checked="checked" id="no-register" name="">  Đặt hàng mà không cần đăng nhập<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="radio-check" id="user-register">
                                                <input type="radio" name="choose-login" id="register" name="">  Tôi đã có tài khoản tại Swift Book Store<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textbox-input-pwd">
                                                <input type="password" placeholder="Vui lòng nhập mật khẩu" name="" id="pwd-user">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lost-pwd"><a href="#getPwd.html">Quên mật khẩu?</a></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>--}}
                            <div class="col-md-5 col-xs-12">
                                {{--<div class="bonus">
                                    <h4>Một số dịch vụ kèm theo</h4>
                                    <table>
                                        <tr>
                                            <th class="service-name">DỊCH VỤ</th>
                                            <th class="num-service">SỐ LƯỢNG</th>
                                            <th class="price-service">GIÁ</th>
                                        </tr>
                                        <tr>
                                            <td class="service-1">
                                                <input type="checkbox" name="service" value="Bao-bia-sach"> Bao bìa sách<br>
                                            </td>
                                            <td class="spin">
                                                <input id="add-service" type="number" min="0" max="30" step="1" value ="0"/>
                                            </td>
                                            <td class="price-ser">{{number_format($cover_price, 0)}}<span> VND/1</span></td>
                                        </tr>
                                        <tr>
                                            <td class="service-1">
                                                <input type="checkbox" name="service" value="Mua-sticker"> Sticker<br>
                                            </td>
                                            <td class="spin">
                                                <input id="add-service" type="number" min="0" max="30" step="1" value ="0"/>
                                            </td>
                                            <td class="price-ser">{{number_format($sticker_price, 0)}}<span> VND/1</span></td>
                                        </tr>
                                        <tr>
                                            <td class="service-1">
                                                <input type="checkbox" name="service" value="Goi-qua"> Gói quà tặng<br>
                                            </td>
                                            <td class="spin">
                                                <input id="add-service" type="number" min="0" max="30" step="1" value ="0"/>
                                            </td>
                                            <td class="price-ser">{{number_format($present_price, 0)}}<span> VND/1</span></td>
                                        </tr>
                                    </table>
                                </div>--}}
                            </div>

                        </div>

                        <!-- edit -->
                        <form class="customer" id="form-customer" action="{{url('receipt')}}" method="post" onsubmit="return onFormSubmit()">
                            {{ csrf_field() }}
                            <input hidden="hidden" value="{{json_encode($orders)}}" name="orders">
                            <h4 class="title-customer">Thông tin của khách hàng </h4>
                            <table>

                                <tr>
                                    <td class="label-name">Tên: </td>
                                    <td class="input-name">
                                        <input required type="text" placeholder="Họ & Tên" id="user-name" name="customer_full_name"
                                        <?php
                                               if(!Auth::guest()){
                                                   echo 'value="'.Auth::user()->full_name.'"';
                                               }
                                               ?>
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-address">Nhập số nhà: </td>
                                    <td class="input-address">
                                        <textarea required type="text" placeholder="Vui lòng điền chính xác tầng, số nhà, đường" name="customer_address" id="address" rows = "3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-city">Tỉnh/Thành phố: </td>
                                    <td class="input-city">
                                        <select required id="select-city" name="customer_province" onchange="onProvinceSelectionChanged(this);" >
                                            <option value="init">Chọn</option>
                                            @foreach($provinces as $province)
                                            <option value="{{$province -> id}}">{{$province->name}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-district">Quận/Huyện: </td>
                                    <td class="input-district">
                                        <select required id="select-district" name="customer_district" onchange="onDistrictSelectionChanged(this);">
                                            <option value="init">Chọn</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-wards">Phường/Xã: </td>
                                    <td class="input-wards">
                                        <select required id="select-wards" name="customer_ward">
                                            <option value="init">Chọn</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-phone">Số điện thoại: </td>
                                    <td class="input-num-phone">
                                        <input required type="number" placeholder="Số điện thoại" id="phone-num" name="customer_phone"
                                        <?php
                                           if(!Auth::guest()){
                                               if(Auth::user()->phone_number != null){
                                                   echo 'value="'.Auth::user()->phone_number.'"';
                                               }
                                           }
                                           ?>
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td class="label-email" for="user-email">Địa chỉ email: </td>
                                   <td class="textbox-input-email">
                                       <input required type="email" id="user-email" placeholder="example@gmail.com" name="customer_email"
                                       <?php
                                           if(!Auth::guest()){
                                               if(Auth::user()->email != null){
                                                   echo 'value="'.Auth::user()->email.'"';
                                               }
                                           }
                                           ?>
                                        >
                                   </td>
                               </tr>
                            </table>
                            <div class="order-button">
                                <input type="submit" style="color: #FFF;" onsubmit="onFormSubmit();" class="button-ord" value="Tiếp tục >>">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-xs-12">
                <div class="detail-order">
                    <form>
                        <h4 class="ord-title">
                            Thông tin đơn hàng
                            <span>({{count($orders)}} sản phẩm)</span>
                        </h4>
                        <div class="ord-main">
                            <table class="order-header">
                                <tr>
                                    <th class="left-align">SẢN PHẨM</th>
                                    <th class="qty">SỐ LƯỢNG</th>
                                    <th class="right-align">ĐƠN GIÁ</th>
                                </tr>
                            </table>
                            <table class="order-main">
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
                                    <td class="left-align-1"><span>- </span>{{$order['name']}}</td>
                                    <td class="qty-1">{{$order['count']}}</td>
                                    <td class="right-align-1">{{number_format($order['price'], 0)}}<span> VND</span></td>
                                </tr>
                                @endforeach
                                {{--<tr>
                                    <td class="left-align-1"><span>- </span>Bao bìa sách</td>
                                    <td class="qty-1">2</td>
                                    <td class="right-align-1">6.000 <span> VND</span></td>
                                </tr>--}}
                            </table>
                            <table class="order-footer">
                                <tr class="ord-sub-total">
                                    <td class="left-align-2">Tạm tính</td>
                                    <td class="right-align-2">{{number_format($total, 0)}}<span> VND</span></td>
                                </tr>
                                <tr>
                                    <td class="left-align-2">VAT</td>
                                    <td class="right-align-2">{{number_format($vat, 0)}}<span> VND</span></td>
                                </tr>
                                <tr class="ord-total">
                                    <td class="left-align-2">Thành tiền</td>
                                    <td class="right-align-2">{{number_format($vat + $total, 0)}}<span> VND</span></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- End Content -->
@endsection

@section('scripts')

<script>
    function onFormSubmit(){
        var form = document.getElementById('form-customer');
        if(!form.checkValidity()){
           event.preventDefault();
        }
        if(document.getElementById('select-city').selectedIndex == 0){
            alert('Chọn tỉnh thành');
            return false;
        }
        if(document.getElementById('select-district').selectedIndex == 0){
           alert('Chọn Quận/Huyện');
           return false;
        }
        if(document.getElementById('select-wards').selectedIndex == 0){
              alert('Chọn Phường/Xã');
             return false;
        }

    return true;
    }

</script>

    <script>
    var bookItemArr = [];
    var json = <?php echo json_encode($orders) ?>;
    console.log(JSON.stringify(json));
    bookItemArr = json;
    </script>

    <script>
        function onProvinceSelectionChanged(element){
            bindDistrictSelectionData([]);
            bindWardSelectionData([]);
            var provinceId = element[element.selectedIndex].value;
            console.log(provinceId +"");
            if(provinceId == 'init'){
                console.log("onProvinceSelectionChanged -> return");
                return;
            }

            $.ajax({
                type: 'GET',
                url: '{{url('region/get-districts')}}/' + provinceId,
                dataType: 'json',
                success: function(result) {
                    console.log('onProvinceSelectionChanged:thanh cong ->' + result);
                    bindDistrictSelectionData(result);
                },
                error:function(e){
                    alert('Lỗi xảy ra');
                }
               }
            );
        }

        function bindDistrictSelectionData(districts){
            bindWardSelectionData([]);
            var districtEle = document.getElementById('select-district');
            var innerHtml = '<option value="init">Chọn</option>';
            for(var i = 0; i < districts.length; i++){
                innerHtml += '<option value="' + districts[i].id +'">' + districts[i].name + '</option>';
            }
            districtEle.innerHTML = innerHtml;
            console.log(innerHtml);
        }

        function onDistrictSelectionChanged(element){
            var wardId = element[element.selectedIndex].value;
            console.log(wardId +"");
            if(wardId == 'init'){
                console.log("onDistrictSelectionChanged -> return");
                return;
            }

            $.ajax({
                type: 'GET',
                url: '{{url('region/get-wards')}}/' + wardId,
                dataType: 'json',
                success: function(result) {
                    console.log('onDistrictSelectionChanged:thanh cong ->' + result);
                    bindWardSelectionData(result);
                },
                error:function(e){
                    alert('Lỗi sảy ra');
                }
               }
            );

        }

        function bindWardSelectionData(wards){
            var wardEle = document.getElementById('select-wards');
            var innerHtml = '<option value="init">Chọn</option>';
            for(var i = 0; i < wards.length; i++){
                innerHtml += '<option value="' + wards[i].id +'">' + wards[i].name + '</option>';
            }
            wardEle.innerHTML = innerHtml;
            console.log(innerHtml);
        }

    </script>

@endsection

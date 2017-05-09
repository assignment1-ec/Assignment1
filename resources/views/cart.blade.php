@extends('layouts.master')

@section('title')
    {{'Giỏ hàng'}}
@endsection

@section('content')
<div class="container-fluid main-page">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li>Giỏ hàng</li>
    </ul>
    <div class="content-page">
        <div class="row">

            <div class="col-md-9 col-xs-12 list-book">

                @foreach($items as $item)
                <!-- ITEM -->
                <div class="row item-book">
                    <div class="col-md-2 col-xs-12">
                        <img id="image-item" src="{{asset($item -> icon)}}" name="item-conan">
                    </div>
                    <div class="col-md-7 col-xs-12 info-item">
                        <table>
                            <tr>
                                <a href="{{url('books/'. ($item -> book_id))}}">
                                    <h4>{{$item->name}}</h4>
                                </a>
                            </tr>
                            <tr>
                                <td>
                                    <label>Tác giả: </label>
                                </td>
                                <td>
                                    <label id="auth">{{$item->author}}</label>
                                </td>
                            </tr>
{{--                            <tr>
                                <td>
                                    <label>Số lượng còn lại: </label>
                                </td>
                                <td>
                                    <label id="rem">15</label>
                                </td>
                            </tr>--}}
                            <tr>
                                <td>
                                    <label>Giá: </label>
                                </td>
                                <td>
                                    <label id="pr">{{$item-> price}}</label>
                                    <label>VND</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-3 col-xs-12 other">
                        <table>
                            <tr>
                                <td>
                                    <label>Số lượng: </label>
                                </td>
                                <td>
                                    <input id="num" max="100" onblur="changeCount({{$item -> book_id}}, this)" onchange="changeCount({{$item -> book_id}}, this)"   type="number" name="number" class="form-control" min="1" value="{{$item -> number}}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form method="post" action="{{url('carts/'. $item -> book_id)}}">
                                       {{csrf_field()}}
                                    <input type="hidden" name="_method" value="DELETE" >
                                    <input type="submit" id="cancel" class="btn btn-danger btn-nhat" value="Hủy"/>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                @endforeach
                <!-- END ITEM -->

            </div>
            <div class="col-md-3 col-xs-12">
                <div class="total-price">
                    <table>
                        <tr>
                            <td>
                                <label>Tổng tiền: </label>
                            </td>
                            <td>
                                <label id="total">0.000</label>
                                <label> VND</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Phí VAT: </label>
                            </td>
                            <td>
                                <label id="vat">0.000</label>
                                <label> VND</label>
                            </td>
                        </tr>
                        <tr id="other-2">
                            <td>
                                <label>Tổng cộng: </label>
                            </td>
                            <td>
                                <label id="sum">0.000</label>
                                <label> VND</label>
                            </td>
                        </tr>
                    </table>
                    <a {{--href="{{url('order')}}"--}}
                     onclick="onSubmitOrderForm()"
                     style="color: #FFF;"><button id="buy-now-2" class="btn btn-success btn-nhat">Đặt hàng ngay</button>
                    </a>
                </div>
            </div>

            {{--FORM--}}
            <form style="background: transparent" action="{{url('order')}}" method="post" id="form-order">
                    {{ csrf_field() }}
                <input type="hidden" name="json" id="order-form_json">
            </form>
        </div>
    </div>
</div>
@endsection

@section('scripts')

<script>

    var bookItemArr = [];

    var eleTotal = document.getElementById('total');
    var eleVat = document.getElementById('vat');
    var eleSum = document.getElementById('sum');

    //SETUP
    init();
    updateUi();

    function init(){
        var book_item;
        @foreach($items as $item)
            book_item = newBookItem({{$item -> book_id}}, "{{$item->name}}", {{$item -> price}},
             {{$item -> vat}}, {{$item -> number}});
            bookItemArr.push(book_item);
        @endforeach
    }

    function getBookCount(bookId){
        for(var i = 0; i < bookItemArr.length; i++){
            if(bookItemArr[i].book_id == bookId){
                return bookItemArr[i].count;
            }
        }
    }

    function changeCount(book_id, element){
        if(element.value <= 0){
            document.getElementById(element.id).value = 1;
            element = document.getElementById(element.id);
        }
        if(element.value >= 100){
            document.getElementById(element.id).value = 100;
            element = document.getElementById(element.id);
        }
        for(var i = 0; i < bookItemArr.length; i++){
            if(bookItemArr[i].book_id == book_id){
                bookItemArr[i].count = element.value;
                break;
            }
        }
        updateUi();
    }

    function updateUi(){
           var vat = 0;
           var total = 0;
           for(var i = 0; i < bookItemArr.length; i++){
                vat += bookItemArr[i].vat * bookItemArr[i].price * bookItemArr[i].count;
                total += bookItemArr[i].price * bookItemArr[i].count;
           }

        eleTotal.innerHTML = (total).formatMoney(0);
        eleVat.innerHTML = (vat).formatMoney(0);
        eleSum.innerHTML = (total + vat).formatMoney(0);
    }

    function onSubmitOrderForm(){
        var json = JSON.stringify(bookItemArr);
        document.getElementById('order-form_json').value = json;
        document.getElementById('form-order').submit();
        //console.log("JSON:" + json);
     }


    function newBookItem(book_id, name, price, vat, count){
        var book_item = {
            book_id: book_id,
            name: name,
            price: price,
            vat: vat,
            count: count

        };
        return book_item;
    }

</script>

@endsection

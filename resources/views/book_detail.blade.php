@extends('layouts.master')
@section('title')
    {{$book->name}}
@endsection

@section('content')
    <!-- Begin Conttent -->
    <div class="container-fluid main-page">
        <ul class="breadcrumb">
            <li><a href="{{url('/')}}">Trang chủ</a></li>
            <li>Chi tiết ({{$book->name}})</li>
        </ul>
        <div class="content-page">
            <div class="row view-detail">
                <div class="col-md-5 col-xs-12">
                    <div class="image-book">
                        <div class="logo">
                            <img src="{{asset($book -> icon)}}" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
                        </div>
                        <div class="row icon-small">
                        <?php $i = 1;?>
                            @foreach($book_images as $book_image)
                             @if($i > 4) {{--4 hinh toi da--}}
                                @break;
                             @endif
                            <div class="col-md-3">
                                <img src="{{asset($book_image -> image_url)}}" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
                            </div>
                              <?php $i++; ?>
                            @endforeach

                        </div>
                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="info-book">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <h2 id="book-name">{{$book->name}}</h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Tác giả: </label>
                                </td>
                                <td>
                                    <p>{{$book->author}}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Nhà xuất bản: </label>
                                </td>
                                <td>
                                    <p>{{$book->publisher}}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Năm xuất bản: </label>
                                </td>
                                <td>
                                    <p>{{$book->published_date}}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Tái bản: </label>
                                </td>
                                <td>
                                    <p>{{$book->republished_date}}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Giá: </label>
                                </td>
                                <td>
                                    <p>{{$book->price}}<sup>đồng</sup></p>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Trọng lượng: </label>
                                </td>
                                <td>
                                    <p>{{$book->weight}}<sup>gam</sup></p>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Số hiệu: </label>
                                </td>
                                <td>
                                    <p>{{$book->isbn}}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Số lượng: </label>
                                </td>
                                <td class="change-number form-inline">
                                   {{-- <button><i class="fa fa-minus" aria-hidden="true "></i></button>--}}<input id="number" onblur="changeCount({{$book -> id}}, this)" onchange="changeCount({{$book -> id}}, this)" class="form-control" type="number" name="number" value="1" min="1" />{{--<button><i class="fa fa-plus " aria-hidden="true "></i></button>--}}
                                </td>
                            </tr>
                            <tr>
                               <form id="form-add-to-cart" action="{{url('add2cart')}}" method="post">
                                   {{ csrf_field() }}
                                    <input type="hidden" id="item-count" name="item_count">
                                    <input type="hidden" name="book_id" value="{{$book -> id}}">
                                    <td>
                                        <button id="add-cart" class="btn btn-primary" onclick="addToCart()">Thêm vào giỏ hàng</button>
                                    </td>
                                </form>
                                <td>
                                    <button id="buy-now" class="btn btn-primary" onclick="onSubmitOrderForm()">Mua ngay</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row description ">
                <div class="container-hot ">
                    <h1>
                        <span>
		                        Giới thiệu sách
		                    </span>
                    </h1>
                    <div id="description-book ">
                        <a id="name-book " href="{{url('books/'.$book->id)}}">
                            <h4>{{$book->name}}</h4>
                        </a>
                        <label id="content-des ">
                				<p>
                				{{$book->long_description}}
                				</p>
                			</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Content -->

    {{--FORM--}}
    <form style="background: transparent" action="{{url('order')}}" method="post" id="form-order">
            {{ csrf_field() }}
        <input type="hidden" name="json" id="order-form_json">
    </form>

@endsection

@section('scripts')
<script>
    function addToCart(){
        var ip = document.getElementById('number');
        document.getElementById('item-count').value = ip.value;
        document.getElementById('form-add-to-cart').submit();
    }
</script>
<script>

    var bookItemArr = [];

     //SETUP
    init();
    //updateUi();

    function init(){
        var book_item;
        book_item = newBookItem({{$book -> id}}, "{{$book->name}}", {{$book -> price}},
         {{$book -> vat}}, 1);
        bookItemArr.push(book_item);
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
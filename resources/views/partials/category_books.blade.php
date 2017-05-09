 <div class="container-hot">
    <h1>
        <a href="{{url('book-explore?category='.$category_name)}}" style="text-decoration: none; color: #FFF;">
            <span>
                {{$category_name}}
            </span>
        </a>
    </h1>
    <div class="row">
        @foreach($category_books as $book)
        <div class="col-xs-6 col-md-3 col-booksize ">
            <a href="{{url('books/'.$book->id)}}">
                <div class="thumbnail thumbnail-book">

                    <div class="image-logo">
                        <img src="{{url($book->icon)}}" alt="img1">
                    </div>
                    <div class="caption">
                        <h1>{{$book->name}}</h1>
                        <p>Giá: {{$book->price}}<sup>đồng</sup>
                            <span>12%</span>
                        </p>
                        <p>{{$book->price * 0.88}}</p>
                    </div>
                    <div class="buy-now">
                        <ul class="list-inline">
                            <li>
                                <a href="{{url('books/'.$book -> id)}}"><i class="fa fa-search-plus" aria-hidden="true"></i></a>
                            </li>
                            <li>
                            <form action="{{url('add2cart')}}" method="post" style="background: transparent">
                                {{ csrf_field() }}
                                <input type="hidden" name="book_id" value="{{$book -> id}}">
                                <input type="hidden" id="item-count" name="item_count" value="1">
                                <a onclick="this.parentElement.submit();"><i class="fa fa-cart-plus" aria-hidden="true"></i></a>
                              </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </a>
        </div>
        @endforeach
    </div>
 </div>
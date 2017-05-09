@extends('layouts.master')
@section('title')
    {{'Khám phá sách'}}
@endsection
@section('content')

    <div class="container-fluid main-page">
        <div class="content-page">
            @foreach($data as $dt)
                @include('partials.category_books', ['category_books' => $dt['books'], 'category_name' => $dt['category_name']])

            @endforeach
            {{--@include('partials.category_books', ['category_books' => $sold_hot_years_category_books, 'category_name' => 'Bán chạy nhất năm nay'])
            @include('partials.category_books', ['category_books' => $new_hot_category_books, 'category_name' => 'Mới cập nhật'])--}}
        </div>
     </div>
@endsection

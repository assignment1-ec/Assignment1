@extends('layouts.master')

@section('content')

    <div class="container-fluid main-page">
        <div class="content-page">
            @include('partials.category_books', ['category_books' => $hot_week_category_books, 'category_name' => 'Hot trong tuần'])
            @include('partials.category_books', ['category_books' => $sold_hot_years_category_books, 'category_name' => 'Bán chạy nhất năm nay'])
            @include('partials.category_books', ['category_books' => $new_hot_category_books, 'category_name' => 'Mới cập nhật'])
        </div>
     </div>
@endsection

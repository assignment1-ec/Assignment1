@extends('layouts.master')
@section('title')
    {{'Kết quả cho '. $search_keyword}}
@endsection
@section('content')

    <div class="container-fluid main-page">
        <div class="content-page">

            <div class="alert alert-success">
                <strong>Kết quả tìm kiếm cho "{{ $search_keyword}}" trong  danh mục "{{$search_categories}}" ({{count($search_results)}} kết quả)</strong>
            </div>
            @if(count($search_results) > 0)
            {{--SEARCH_CATEGORY, SEARCH_KEYWORD, SEARCH_RESULTS--}}
                @include('partials.category_books', ['category_books' => $search_results, 'category_name' => $search_categories])
                {{--@include('partials.category_books', ['category_books' => $sold_hot_years_category_books, 'category_name' => 'Truyện'])
                @include('partials.category_books', ['category_books' => $new_hot_category_books, 'category_name' => 'SGK-Toán 12'])
            --}}

            @endif
            </div>
     </div>
@endsection

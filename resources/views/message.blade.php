@extends('layouts.master')
@section('title')
    {{$title}}
@endsection
@section('content')
<div class="container-fluid main-page">
    <div class="col-md-4 col-md-offset-4">
        <div class="title-page text-center">
            <a href="{{url('/')}}"><img src="{{asset('images/logo2.png')}}" alt="logo"></a>
        </div>
        @foreach($messages as $msg)
        <div class="alert alert-success">
            <strong>{{$msg['title']}}</strong>{{" ".$msg['body']}}
        </div>
        @endforeach
    </div>
</div>
@endsection
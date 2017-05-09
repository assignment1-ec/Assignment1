@extends('......layouts.master')
@section('title')
    {{'Khôi phục mật khẩu'}}
@endsection
@section('content')
 <div class="container-fluid main-page">
    <div class="col-md-4 col-md-offset-4">
       <div class="title-page text-center">
           <a href="index.html"><img src="{{asset('images/logo2.png')}}" alt="logo"></a>
       </div>
       <div class="panel panel-default forget-pass">
           <div class="panel-heading">Khôi phục mật khẩu</div>
           <div class="panel-body">
               <input type="email" class="form-control" placeholder="abc@email.com" id="user-email">
               <input type="button" class="btn btn-primary" style="width: 100%" value="Khôi phục ngay">
           </div>
       </div>
    </div>
 </div>
@endsection

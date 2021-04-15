@extends('welcome')

@section('content')

<h1>Hello - Version 5 - Dynamic ENV</h1>

<h3>{{ env('APP_NAME') }}</h3>
<h3>{{ env('APP_ENV') }}</h3>

@endsection
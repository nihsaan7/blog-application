@extends('front-layout')

@section('content')

    <div class="main-body">   
        <div class="login-container">
            <h1>Login</h1>
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="{{ old('email') }}" required>                
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>                
                </div>

                @error('email') <p class="error">{{ $message }}</p> @enderror
                @error('password') <p class="error">{{ $message }}</p> @enderror
                
                <button type="submit">Login</button>
            </form>
            <p class="mt-3">Don't have an account? <a class="link" href="{{ route('register') }}">Register here</a></p>
        </div>
    </div>
    
@endsection

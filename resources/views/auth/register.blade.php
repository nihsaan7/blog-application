@extends('front-layout')

@section('content')

    <div class="main-body">   
        <div class="register-container">
            <h1>Register</h1>
            <form method="POST" action="{{ route('register') }}">
                @csrf
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="{{ old('name') }}" required>
                    @error('name') <p class="error">{{ $message }}</p> @enderror
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="{{ old('email') }}" required>
                    @error('email') <p class="error">{{ $message }}</p> @enderror
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>                
                </div>
                <div class="form-group">
                    <label for="password_confirmation">Confirm Password</label>
                    <input type="password" name="password_confirmation" id="password_confirmation" required>
                </div>
                @error('password') <p class="error">{{ $message }}</p> @enderror
                <button type="submit">Register</button>
            </form>
            <p class="mt-3">Already have an account? <a class="link" href="{{ route('login') }}">Login here</a></p>
        </div>
    </div>
    
@endsection


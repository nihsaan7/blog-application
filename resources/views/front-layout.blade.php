<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <style>
        .post-card {
            margin: 10px;
        }
        .post-card img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .login-btn {
            margin-left: auto;
        }
        .post-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        .comment-form {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Navbar with Login Button -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('/')}}">Home</a>
                    </li>
                </ul>
                <!-- Login Button -->
                <a href="{{ route('login') }}" class="btn btn-outline-primary login-btn">Login</a>
            </div>
        </div>
    </nav>

    @yield('content')    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

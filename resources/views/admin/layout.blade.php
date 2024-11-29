<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" crossorigin="anonymous">
  
    @vite(['resources/js/app.js','resources/css/app.css'])
    
</head>
<body>
    <div id="app">
        <!-- Add the logout button here -->
        <div class="logout-btn-container">
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
            <button onclick="confirmLogout()" class="btn btn-danger btn-sm logout-btn">
                <i class="fa fa-sign-out"></i> Logout
            </button>
        </div>

        @yield('content')
    </div>


    <script>
        // JavaScript function to confirm logout before submitting the form
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                // Submit the logout form if confirmed
                document.getElementById('logout-form').submit();
            }
        }
    </script>


    <style>
        /* styling for the logout button */
        .logout-btn-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 999;
        }

        .logout-btn {
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #c9302c;
        }
    </style>

</body>
</html>

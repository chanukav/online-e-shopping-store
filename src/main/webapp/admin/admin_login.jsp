<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (optional for icons) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            height: 100vh;
        }
        .left-image {
           	background-image: url('${pageContext.request.contextPath}/admin/Adminassets/images/login_left_side.webp');
            background-size: cover;
            background-position: center;
            height: 100%;
        }
        .login-form {
            background-color: #fceaca; /* light gray */
            padding: 50px;
            height: 100%;
        }
        .form-control:focus {
            border-color: #e61616;
            box-shadow: 0 0 0 0.2rem rgba(230, 22, 22, 0.25);
        }
        .btn-login {
            background-color: #e61616;
            color: #fff;
        }
        .btn-login:hover {
            background-color: #f85506;
        }
    </style>
</head>
<body>
    <div class="container-fluid login-container">
        <div class="row h-100">
            <!-- Left Image Section -->
            <div class="col-md-8 d-none d-md-block left-image"></div>

            <!-- Right Login Form -->
            <div class="col-md-4 d-flex align-items-center justify-content-center login-form">
                <form method="post" action="Admin_Login" style="width: 100%; max-width: 300px;">
                    <h3 class="text-center mb-4 text-dark">Admin Login</h3>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" id="username" required>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-login">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

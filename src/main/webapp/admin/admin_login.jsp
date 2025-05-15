<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        .login-container {
            height: 100vh;
            display: flex;
        }
        .left-image {
            background-image: url('${pageContext.request.contextPath}/admin/Adminassets/images/login_left_side.webp');
            background-size: cover;
            background-position: center;
            flex: 0 0 60%;
        }
        .login-form {
            background: #fcffff;
            flex: 0 0 40%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            max-width: 360px;
            width: 100%;
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        .form-container:hover {
            transform: translateY(-5px);
        }
        .form-container h3 {
            color: #2c3e50;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
            margin-bottom: 2rem;
        }
        .form-floating .form-control {
            border-radius: 12px;
            border: 2px solid #e9ecef;
            padding: 1rem;
            height: calc(3.5rem + 2px);
            transition: border-color 0.3s ease;
        }
        .form-floating .form-control:focus {
            border-color: #fe980f;
            box-shadow: 0 0 8px rgba(254, 152, 15, 0.3);
        }
        .form-floating label {
            color: #6c757d;
            padding: 1rem;
        }
        .btn-login {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fcffff;
            border: none;
            padding: 12px;
            border-radius: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            width: 100%;
        }
        .btn-login:hover {
            background: linear-gradient(90deg, #e68a00, #e61616);
            transform: translateY(-2px);
        }
        .btn-login i {
            margin-right: 8px;
        }
        @media (max-width: 768px) {
            .left-image {
                display: none;
            }
            .login-form {
                flex: 1;
                padding: 1rem;
            }
            .form-container {
                padding: 1.5rem;
            }
            .form-container h3 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Left Image Section -->
        <div class="left-image"></div>

        <!-- Right Login Form -->
        <div class="login-form">
            <div class="form-container">
                <form method="post" action="Admin_Login">
                    <h3 class="text-center">Admin Login</h3>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" id="username" placeholder="Username" required>
                        <label for="username"><i class="fas fa-user me-2"></i>Username</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-login"><i class="fas fa-sign-in-alt"></i>Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
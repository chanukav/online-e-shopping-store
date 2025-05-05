<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <!-- Local Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background-color: #fceaca;
        }
        .register-container {
            margin-top: 50px;
            max-width: 700px;
            background-color: #fcffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 600;
        }
        .btn-register {
            background-color: #e61616;
            color: white;
        }
        .btn-register:hover {
            background-color: #f85506;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="register-container">
        <h3 class="text-center mb-4 text-dark">Admin Registration</h3>

        <!-- Form maps directly to AdminInfo fields -->
        <form method="post" action="Add_Admin">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label" for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label" for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>


            <div class="d-grid">
                <button type="submit" class="btn btn-register">Register</button>
            </div>
        </form>
    </div>
</div>

<!-- Local Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .container {
            max-width: 600px;
            padding: 1rem;
        }
        .profile-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .profile-header h1 {
            color: #2c3e50;
            font-weight: 700;
            font-size: 2rem;
        }
        .profile-pic-container {
            position: relative;
            width: 120px;
            height: 120px;
            margin: 0 auto 1.5rem;
        }
        .profile-pic {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fe980f;
        }
        .upload-icon {
            position: absolute;
            bottom: 5px;
            right: 5px;
            background: #fe980f;
            color: #fff;
            border-radius: 50%;
            padding: 10px;
            cursor: pointer;
        }
        .form-floating .form-control {
            border-radius: 12px;
            border: 2px solid #e9ecef;
            padding: 1rem;
            height: calc(3.5rem + 2px);
        }
        .form-control.is-valid {
            border-color: #28a745 !important;
        }
        .form-control.is-invalid {
            border-color: #dc3545 !important;
        }
        .error-message {
            color: #dc3545;
            font-size: 0.9rem;
            background-color: #f8d7da;
            padding: 8px 12px;
            border-radius: 8px;
            margin-top: 4px;
        }
        .btn-custom {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fff;
            border: none;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            width: 100%;
        }
        .btn-custom:hover {
            background: linear-gradient(90deg, #e68a00, #e61616);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-card">
        <form method="post" action="Add_Admin" enctype="multipart/form-data" novalidate>
            <div class="profile-header">
                <h1>Admin Registration</h1>
            </div>
            <div class="profile-pic-container">
                <img id="profilePicPreview" class="profile-pic" src="<%=request.getContextPath()%>/admin/Adminassets/images/default.webp" alt="Profile Picture">
                <label for="profilePicInput" class="upload-icon"><i class="fas fa-camera"></i></label>
                <input type="file" id="profilePicInput" name="image" accept="image/*" style="display: none;" required>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required>
                <label for="firstName">First Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required>
                <label for="lastName">Last Name</label>
            </div>

            <div class="form-floating mb-1">
                <input type="tel" class="form-control" id="PhoneNumber" name="PhoneNumber" placeholder="Phone Number" pattern="^0\d{9}$" maxlength="10" required>
                <label for="PhoneNumber">Phone Number</label>
            </div>
            <div id="phoneError" class="error-message d-none">Enter a valid Sri Lankan phone number (e.g., 0712345678)</div>

            <div class="form-floating mb-1 mt-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                <label for="email">Email Address</label>
            </div>
            <div id="emailError" class="error-message d-none">Enter a valid email address (e.g., example@mail.com)</div>

            <div class="form-floating position-relative mb-1 mt-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <label for="password">Password</label>
                <button type="button" id="togglePassword" class="btn position-absolute top-50 end-0 translate-middle-y me-2" style="background: none; border: none;">
                    <i class="fas fa-eye" id="toggleIcon"></i>
                </button>
            </div>
            <div id="passwordError" class="error-message d-none">
                Password must be at least 8 characters long and include at least one number, one uppercase, and one lowercase letter.
            </div>

            <div class="progress mb-4" style="height: 5px;">
                <div id="passwordStrength" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-custom">Register</button>
            </div>
        </form>
    </div>
</div>

<script>
    const profilePicInput = document.getElementById('profilePicInput');
    const profilePicPreview = document.getElementById('profilePicPreview');

    profilePicInput.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                profilePicPreview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    function validateInput(input, errorElement, message) {
        if (input.checkValidity()) {
            input.classList.add('is-valid');
            input.classList.remove('is-invalid');
            if (errorElement) errorElement.classList.add('d-none');
        } else {
            input.classList.add('is-invalid');
            input.classList.remove('is-valid');
            if (errorElement) {
                errorElement.textContent = message;
                errorElement.classList.remove('d-none');
            }
        }
    }

    const phoneNumber = document.getElementById('PhoneNumber');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const phoneError = document.getElementById('phoneError');
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');
    const passwordStrength = document.getElementById('passwordStrength');

    phoneNumber.addEventListener('input', () => {
        validateInput(phoneNumber, phoneError, "Enter a valid Sri Lankan phone number (e.g., 0712345678)");
    });

    email.addEventListener('input', () => {
        validateInput(email, emailError, "Enter a valid email address (e.g., example@mail.com)");
    });

    password.addEventListener('input', () => {
        validateInput(password, passwordError, "Password must be at least 8 characters, including a number, uppercase and lowercase letter.");

        const pwd = password.value;
        let strength = 0;
        if (pwd.length >= 8) strength += 25;
        if (/[A-Z]/.test(pwd)) strength += 25;
        if (/[a-z]/.test(pwd)) strength += 25;
        if (/[0-9]/.test(pwd)) strength += 25;

        passwordStrength.style.width = strength + '%';
        passwordStrength.className = 'progress-bar';
        if (strength <= 25) {
            passwordStrength.classList.add('bg-danger');
        } else if (strength <= 50) {
            passwordStrength.classList.add('bg-warning');
        } else if (strength <= 75) {
            passwordStrength.classList.add('bg-info');
        } else {
            passwordStrength.classList.add('bg-success');
        }
    });

    document.getElementById('togglePassword').addEventListener('click', () => {
        const type = password.type === 'password' ? 'text' : 'password';
        password.type = type;
        document.getElementById('toggleIcon').classList.toggle('fa-eye');
        document.getElementById('toggleIcon').classList.toggle('fa-eye-slash');
    });
</script>
</body>
</html>

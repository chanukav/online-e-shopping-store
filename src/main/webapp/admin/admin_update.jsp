<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<style>
body {
    background-color: #fceaca;
    transition: all 0.3s ease-in-out;
}
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.profile-card {
    background-color: #fcffff;
    border-radius: 15px;
    padding: 30px;
    max-width: 700px;
    width: 100%;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    transition: all 0.3s ease-in-out;
}
.profile-header {
    text-align: center;
    margin-bottom: 30px;
}
.profile-header h1 {
    color: #e61616;
    font-weight: bold;
}
.profile-pic-container {
    position: relative;
    width: 120px;
    height: 120px;
    margin: 0 auto 20px;
}
.profile-pic {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #fe980f;
}
.upload-icon {
    position: absolute;
    bottom: 0;
    right: 0;
    background-color: #f85506;
    color: #fcffff;
    border-radius: 50%;
    padding: 8px;
    cursor: pointer;
}
.form-control {
    border-radius: 10px;
    border: 2px solid #fe980f;
    transition: border-color 0.3s;
}
.form-control:focus {
    border-color: #f85506;
    box-shadow: 0 0 5px rgba(248, 85, 6, 0.5);
}
.form-control.valid {
    border-color: green !important;
}
.form-control.invalid {
    border-color: red !important;
}
.error-message {
    font-size: 0.85rem;
    color: red;
    margin-top: 5px;
    margin-left: 5px;
    transition: all 0.3s ease-in-out;
}
.btn-custom {
    background-color: #e61616;
    color: #fcffff;
    border: none;
    padding: 10px 25px;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s;
}
.btn-custom:hover {
    background-color: #c91212;
}
</style>
</head>
<body>
<div class="container">
    <div class="profile-card">
        <form method="post" action="Admin_update" enctype="multipart/form-data">
            <input type="hidden" name="adminId" value="${param.adminId}">
            <div class="profile-header">
                <h1>Update Your Profile</h1>
            </div>
            <div class="profile-pic-container">
                <img id="profilePicPreview" class="profile-pic" src="Admin_Image?adminId=${param.adminId}" alt="Profile Picture" onerror="this.src='<%=request.getContextPath()%>/admin/Adminassets/images/default.webp';">
                <label for="profilePicInput" class="upload-icon"><i class="fas fa-camera"></i></label>
                <input type="file" id="profilePicInput" name="image" accept="image/*" style="display: none;">
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="firstName" name="firstName" value="${param.firstName}" placeholder="First Name">
                <label for="firstName">First Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastName" name="lastName" value="${param.lastName}" placeholder="Last Name">
                <label for="lastName">Last Name</label>
            </div>

            <div class="form-floating mb-1">
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${param.PNumber}" placeholder="Phone Number"
                       maxlength="10" required>
                <label for="phoneNumber">Phone Number</label>
            </div>
            <div id="phoneError" class="error-message"></div>

            <div class="form-floating mb-1">
                <input type="email" class="form-control" id="email" name="email" value="${param.email}" placeholder="Email Address" required>
                <label for="email">Email Address</label>
            </div>
            <div id="emailError" class="error-message"></div>

            <div class="form-floating mb-1 position-relative">
                <input type="password" class="form-control" id="password" name="password" value="${param.password}" placeholder="Password" required>
                <label for="password">Password</label>
                <button type="button" id="togglePassword" class="btn position-absolute top-50 end-0 translate-middle-y me-2" style="background: none; border: none;">
                    <i class="fas fa-eye" id="toggleIcon"></i>
                </button>
            </div>
            <div id="passwordError" class="error-message"></div>

            <div class="progress mb-4" style="height: 5px;">
                <div id="passwordStrength" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-custom" onclick="return confirm('Do you want to update?')">Submit</button>
            </div>
        </form>
    </div>
</div>

<script>
document.getElementById('profilePicInput').addEventListener('change', function () {
    const file = this.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('profilePicPreview').src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});

function setValidation(input, isValid, messageElementId, messageText = '') {
    input.classList.remove('valid', 'invalid');
    if (isValid) {
        input.classList.add('valid');
        document.getElementById(messageElementId).innerText = '';
    } else {
        input.classList.add('invalid');
        document.getElementById(messageElementId).innerText = messageText;
    }
}

document.getElementById('phoneNumber').addEventListener('input', function () {
    const phone = this.value;
    const regex = /^0\d{9}$/;
    setValidation(this, regex.test(phone), 'phoneError', 'Enter a valid Sri Lankan phone number (e.g., 0771234567)');
});

document.getElementById('email').addEventListener('input', function () {
    const email = this.value;
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    setValidation(this, regex.test(email), 'emailError', 'Enter a valid email address (e.g., example@mail.com)');
});

document.getElementById('password').addEventListener('input', function () {
    const pwd = this.value;
    const strengthBar = document.getElementById('passwordStrength');
    const passwordError = document.getElementById('passwordError');
    let strength = 0;
    if (pwd.length >= 8) strength += 25;
    if (/[A-Z]/.test(pwd)) strength += 25;
    if (/[a-z]/.test(pwd)) strength += 25;
    if (/\d/.test(pwd)) strength += 25;

    strengthBar.style.width = strength + '%';
    strengthBar.className = 'progress-bar';
    if (strength <= 25) {
        strengthBar.classList.add('bg-danger');
    } else if (strength <= 50) {
        strengthBar.classList.add('bg-warning');
    } else if (strength <= 75) {
        strengthBar.classList.add('bg-info');
    } else {
        strengthBar.classList.add('bg-success');
    }

    const isValid = strength === 100;
    setValidation(this, isValid, 'passwordError', 'Must contain uppercase, lowercase, digit, and be 8+ characters long');
});

document.getElementById('togglePassword').addEventListener('click', function () {
    const pwdInput = document.getElementById('password');
    const toggleIcon = document.getElementById('toggleIcon');
    if (pwdInput.type === 'password') {
        pwdInput.type = 'text';
        toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        pwdInput.type = 'password';
        toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
    }
});
</script>
</body>
</html>

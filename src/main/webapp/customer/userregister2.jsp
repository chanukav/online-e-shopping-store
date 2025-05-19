<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usear Registation</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"> 
<style>
    body {
        background-color: #fcffff;
        font-family: 'Segoe UI', sans-serif;
    }

    h2 {
        color: #e61616;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-container {
        background-color: #fceaca;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }

    label.form-check-label {
        font-weight: 500;
        margin-left: 10px;
    }

    .form-check-input:checked {
        background-color: #fe980f;
        border-color: #fe980f;
    }

    .btn-custom {
        background-color: #f85506;
        border: none;
        color: white;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #e61616;
    }
    
    .password-hint {
        font-size: 0.8rem;
        color: #666;
        margin-top: 5px;
    }
    
    .error-message {
        color: red;
        font-size: 0.8rem;
        margin-top: 5px;
    }
</style>
</head>
<body>
    <%@ include file="/partial/newheader.jsp" %>

<div class="container mt-5">
    <div class="form-container">
        <h2>User Registation</h2>
        <form method="post" action="<%=request.getContextPath()%>/addCustomer" id="registrationForm">
        
        <input type="hidden" name="source" value="admin">

            <!-- Name -->
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="M.D John" required>
                <label for="name">Name</label>
            </div>

            <!-- Age -->
            <label class="form-label">Age Range</label>
            <div class="mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="age" id="age1" value="Under 18" required>
                    <label class="form-check-label" for="age1">Under 18</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="age" id="age2" value="18-25">
                    <label class="form-check-label" for="age2">18–25</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="age" id="age3" value="26-35">
                    <label class="form-check-label" for="age3">26–35</label>
                </div>
            </div>

            <!-- Gender -->
            <label class="form-label">Gender</label>
            <div class="mb-3">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                    <label class="form-check-label" for="male">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                    <label class="form-check-label" for="female">Female</label>
                </div>
            </div>

            <!-- Address -->
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="address" name="address" placeholder="123 Main St, Colombo 07" required>
                <label for="address">Address</label>
            </div>

            <!-- Email -->
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                <label for="email">Email address</label>
            </div>

            <!-- Password -->
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                <label for="password">Password</label>
                <div class="password-hint">
                    Password must contain: 6+ characters, uppercase, lowercase, number, and special character
                </div>
                <div id="passwordError" class="error-message"></div>
            </div>
            
            <!-- Confirm Password -->
            <div class="form-floating mb-4">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                <label for="confirmPassword">Confirm Password</label>
                <div id="confirmPasswordError" class="error-message"></div>
            </div>

            <input type="hidden" name="source" value="user">

            <button type="submit" class="btn btn-custom">Register</button>
        </form>
    </div>
</div>

<script>
document.getElementById("registrationForm").addEventListener("submit", function (e) {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const address = document.getElementById("address").value.trim();
    const ageSelected = document.querySelector("input[name='age']:checked");
    const genderSelected = document.querySelector("input[name='gender']:checked");

    let errors = [];
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById("confirmPasswordError");
    
    // Clear previous errors
    passwordError.textContent = "";
    confirmPasswordError.textContent = "";

    if (name === "") {
        errors.push("Name is required.");
    }

    // Password validation
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
    
    if (!passwordRegex.test(password)) {
        errors.push("Password must contain: 6+ characters, uppercase, lowercase, number, and special character");
        passwordError.textContent = "Password must contain: 6+ characters, uppercase, lowercase, number, and special character";
    }
    
    if (password !== confirmPassword) {
        errors.push("Passwords do not match");
        confirmPasswordError.textContent = "Passwords do not match";
    }

    if (address === "") {
        errors.push("Address is required.");
    }

    if (!ageSelected) {
        errors.push("Please select an age range.");
    }

    if (!genderSelected) {
        errors.push("Please select a gender.");
    }

    if (errors.length > 0) {
        e.preventDefault();
        if (errors.length > 3) { // Show only the most critical errors
            alert("Please fix the highlighted errors in the form.");
        } else {
            alert(errors.join("\n"));
        }
    }
});

// Real-time password validation
document.getElementById("password").addEventListener("input", function() {
    const password = this.value;
    const passwordError = document.getElementById("passwordError");
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
    
    if (password.length > 0 && !passwordRegex.test(password)) {
        passwordError.textContent = "Password must contain: 6+ characters, uppercase, lowercase, number, and special character";
    } else {
        passwordError.textContent = "";
    }
});

// Real-time password match check
document.getElementById("confirmPassword").addEventListener("input", function() {
    const password = document.getElementById("password").value;
    const confirmPassword = this.value;
    const confirmPasswordError = document.getElementById("confirmPasswordError");
    
    if (confirmPassword.length > 0 && password !== confirmPassword) {
        confirmPasswordError.textContent = "Passwords do not match";
    } else {
        confirmPasswordError.textContent = "";
    }
});
</script>

<%@ include file="/partial/newfooter.jsp" %>
</body>
</html>
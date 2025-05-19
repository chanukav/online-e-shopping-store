<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
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
</style>
</head>
<body>


<div class="container mt-5">
    <div class="form-container">
        <h2>Add Customer</h2>
        <form method="post" action="<%=request.getContextPath()%>/addCustomer">
        
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
            <div class="form-floating mb-4">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            
            <!-- Source: this tells the servlet this is a USER registration -->
            <input type="hidden" name="source" value="user">

            <!-- Submit -->
            <button type="submit" class="btn btn-custom">Register</button>
        </form>
    </div>
</div>

<script>
document.querySelector("form").addEventListener("submit", function (e) {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const address = document.getElementById("address").value.trim();
    const ageSelected = document.querySelector("input[name='age']:checked");
    const genderSelected = document.querySelector("input[name='gender']:checked");

    let errors = [];

    if (name === "") {
        errors.push("Name is required.");
    }

    
    }

    if (password.length < 6) {
        errors.push("Password must be at least 6 characters.");
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
        alert(errors.join("\\n"));
    }
});
</script>


</body>
</html>

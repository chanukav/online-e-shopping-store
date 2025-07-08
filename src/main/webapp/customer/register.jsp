<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"> 
    <title>User Registration</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            padding: 40px;
            margin: 20px auto;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-header h1 {
            color: #502c2c;
            font-size: 32px;
            margin-bottom: 8px;
        }
        
        .form-header p {
            color: #8d7f7f;
            font-size: 18px;
        }
        
        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border-left: 4px solid #ca372d;
        }
        
        .form-section-title {
            color: #502c2c;
            font-size: 22px;
            margin-bottom: 20px;
            font-weight: 600;
            position: relative;
            padding-left: 10px;
        }
        
        .form-section-title::after {
            content: " *";
            color: #e74c3c;
        }
        
        .form-section-title::before {
            content: "";
            position: absolute;
            left: 0;
            top: 5px;
            height: 18px;
            width: 4px;
            background-color: #ca372d;
            border-radius: 2px;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -10px 15px;
        }
        
        .form-group {
            flex: 1 0 100%;
            padding: 0 10px;
            margin-bottom: 15px;
        }
        
        .half-width {
            flex: 1 0 calc(50% - 20px);
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #5e3434;
            font-size: 16px;
            font-weight: 500;
        }
        
        .form-input {
            width: 100%;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .form-input:focus {
            border-color: #db344d;
            box-shadow: 0 0 0 3px rgba(219, 52, 77, 0.2);
            outline: none;
        }
        
        .form-input::placeholder {
            color: #95a5a6;
        }
        
        .submit-btn {
            background: linear-gradient(to right, #db3445, #8c1c27);
            color: white;
            border: none;
            padding: 16px 30px;
            font-size: 18px;
            border-radius: 6px;
            cursor: pointer;
            display: block;
            margin: 30px auto 0;
            width: 250px;
            transition: all 0.3s ease;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .required-note {
            text-align: center;
            color: #7f8c8d;
            font-size: 15px;
            margin-top: 20px;
            font-style: italic;
        }
        
        .radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 10px;
        }
        
        .radio-option {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .radio-option input {
            margin-right: 10px;
            width: 18px;
            height: 18px;
        }
        
        .radio-option label {
            font-size: 16px;
            color: #5e3434;
        }
        
        .password-hint {
            font-size: 0.9rem;
            color: #666;
            margin-top: 5px;
            padding-left: 5px;
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 0.9rem;
            margin-top: 5px;
            padding-left: 5px;
            display: block;
        }
        
        @media (max-width: 768px) {
            .half-width {
                flex: 1 0 100%;
            }
            
            .form-container {
                padding: 25px;
            }
            
            .submit-btn {
                width: 100%;
            }
            
            .radio-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
      <%@ include file="/partial/newheader.jsp" %>
    <div class="form-container">
        <div class="form-header">
            <h1>User Registration</h1>
            <p>Please fill in the form below</p>
        </div>
        
        <form method="post" action="<%=request.getContextPath()%>/addCustomer" id="registrationForm">
            <input type="hidden" name="source" value="user">

            <!-- Name Section -->
            <div class="form-section">
                <h2 class="form-section-title">Full Name</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-input" id="name" name="name" placeholder="M.D John" required>
                    </div>
                </div>
            </div>
            
            <!-- Age Section -->
            <div class="form-section">
                <h2 class="form-section-title">Age Range</h2>
                <div class="radio-group">
                    <div class="radio-option">
                        <input class="form-check-input" type="radio" name="age" id="age1" value="Under 18" required>
                        <label class="form-check-label" for="age1">Under 18</label>
                    </div>
                    <div class="radio-option">
                        <input class="form-check-input" type="radio" name="age" id="age2" value="18-25">
                        <label class="form-check-label" for="age2">18–25</label>
                    </div>
                    <div class="radio-option">
                        <input class="form-check-input" type="radio" name="age" id="age3" value="26-35">
                        <label class="form-check-label" for="age3">26–35</label>
                    </div>
                </div>
            </div>
            
            <!-- Gender Section -->
            <div class="form-section">
                <h2 class="form-section-title">Gender</h2>
                <div class="radio-group">
                    <div class="radio-option">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="radio-option">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                </div>
            </div>
            
            <!-- Address Section -->
            <div class="form-section">
                <h2 class="form-section-title">Address</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Full Address</label>
                        <input type="text" class="form-input" id="address" name="address" placeholder="123 Main St, Colombo 07" required>
                    </div>
                </div>
            </div>
            
            <!-- Email Section -->
            <div class="form-section">
                <h2 class="form-section-title">Email</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <input type="email" class="form-input" id="email" name="email" placeholder="name@example.com" required>
                    </div>
                </div>
            </div>
            
            <!-- Password Section -->
            <div class="form-section">
                <h2 class="form-section-title">Password</h2>
                <div class="form-row">
                    <div class="form-group half-width">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-input" id="password" name="password" placeholder="Password" required>
                        <div class="password-hint">
                            Password must contain: 6+ characters, uppercase, lowercase, number, and special character
                        </div>
                        <div id="passwordError" class="error-message"></div>
                    </div>
                    <div class="form-group half-width">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" class="form-input" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                        <div id="confirmPasswordError" class="error-message"></div>
                    </div>
                </div>
            </div>
            
            <button type="submit" class="submit-btn">Register</button>
            
            <p class="required-note">* indicates a required field</p>
        </form>
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
                if (errors.length > 3) {
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>User Registration</title>
    <style>
        :root {
            --primary: #f85506;
            --primary-dark: #c74404;
            --accent: #db3445;
            --border-soft: #e5e7eb;
            --bg-soft: #f9fafb;
            --text-main: #1f2933;
            --text-muted: #6b7280;
            --radius-lg: 12px;
            --shadow-lg: 0 18px 45px rgba(15, 23, 42, 0.18);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: radial-gradient(circle at top, #ffe4d3 0%, #f5f7fa 45%, #e5ecff 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 24px;
        }
        
        .form-container {
            background-color: #ffffff;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            width: 100%;
            max-width: 720px;
            padding: 40px 36px 32px;
            margin: 16px auto;
            border: 1px solid rgba(148, 163, 184, 0.35);
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 28px;
        }
        
        .form-header h1 {
            color: var(--text-main);
            font-size: 30px;
            margin-bottom: 6px;
        }
        
        .form-header p {
            color: var(--text-muted);
            font-size: 15px;
        }
        
        .form-section {
            margin-bottom: 26px;
            padding: 18px 18px 16px;
            background-color: var(--bg-soft);
            border-radius: 10px;
            border: 1px solid var(--border-soft);
        }
        
        .form-section-title {
            color: var(--text-main);
            font-size: 18px;
            margin-bottom: 18px;
            font-weight: 600;
            position: relative;
            padding-left: 12px;
        }
        
        .form-section-title::after {
            content: " *";
            color: #e74c3c;
        }
        
        .form-section-title::before {
            content: "";
            position: absolute;
            left: 0;
            top: 4px;
            height: 18px;
            width: 4px;
            background: linear-gradient(to bottom, var(--primary), var(--accent));
            border-radius: 999px;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -8px 8px;
            row-gap: 12px;
        }
        
        .form-group {
            flex: 1 0 100%;
            padding: 0 8px;
        }
        
        .half-width {
            flex: 1 0 calc(50% - 16px);
        }
        
        .form-label {
            display: block;
            margin-bottom: 6px;
            color: var(--text-main);
            font-size: 14px;
            font-weight: 500;
        }
        
        .form-input {
            width: 100%;
            padding: 11px 13px;
            border: 1px solid var(--border-soft);
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.18s ease, box-shadow 0.18s ease, transform 0.08s ease;
            background-color: #ffffff;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon .form-input.with-icon {
            padding-left: 36px;
        }

        .input-with-icon .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 14px;
            pointer-events: none;
        }
        
        .form-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(248, 85, 6, 0.18);
            outline: none;
            transform: translateY(-1px);
        }
        
        .form-input::placeholder {
            color: #9ca3af;
        }
        
        .submit-btn {
            background: linear-gradient(90deg, var(--primary), var(--primary-dark));
            color: #ffffff;
            border: none;
            padding: 14px 28px;
            font-size: 15px;
            border-radius: 999px;
            cursor: pointer;
            display: block;
            margin: 24px auto 0;
            width: 240px;
            max-width: 100%;
            transition: transform 0.12s ease, box-shadow 0.18s ease, filter 0.12s ease;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.6px;
        }
        
        .submit-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 14px 30px rgba(248, 85, 6, 0.26);
            filter: brightness(1.03);
        }
        
        .required-note {
            text-align: center;
            color: var(--text-muted);
            font-size: 13px;
            margin-top: 16px;
            font-style: italic;
        }
        
        .radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            margin-top: 4px;
        }
        
        .radio-option {
            display: inline-flex;
            align-items: center;
            padding: 6px 10px;
            border-radius: 999px;
            border: 1px solid transparent;
            background-color: #fff;
            cursor: pointer;
            transition: border-color 0.18s ease, background-color 0.18s ease;
        }
        
        .radio-option input {
            margin-right: 6px;
            width: 16px;
            height: 16px;
        }
        
        .radio-option label {
            font-size: 14px;
            color: var(--text-main);
            margin: 0;
        }

        .radio-option input:checked + label {
            font-weight: 600;
        }
        
        .password-hint {
            font-size: 0.78rem;
            color: var(--text-muted);
            margin-top: 4px;
            padding-left: 4px;
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 0.8rem;
            margin-top: 4px;
            padding-left: 4px;
            display: block;
        }
        
        @media (max-width: 768px) {
            body {
                padding: 12px;
            }
            .half-width {
                flex: 1 0 100%;
            }
            .form-container {
                padding: 26px 18px 22px;
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
            <h1>Create your account</h1>
            <p>It only takes a minute — we’ll use these details to keep your orders and rewards in sync.</p>
        </div>
        
        <form method="post" action="<%=request.getContextPath()%>/addCustomer" id="registrationForm" novalidate>
            <input type="hidden" name="source" value="user">

            <!-- Account Section -->
            <div class="form-section">
                <h2 class="form-section-title">Account details</h2>
                <div class="form-row">
                    <div class="form-group half-width">
                        <label class="form-label" for="name">Full name</label>
                        <div class="input-with-icon">
                            <i class="fas fa-user input-icon" aria-hidden="true"></i>
                            <input type="text" class="form-input with-icon" id="name" name="name" placeholder="M.D John" required>
                        </div>
                    </div>
                    <div class="form-group half-width">
                        <label class="form-label" for="email">Email address</label>
                        <div class="input-with-icon">
                            <i class="fas fa-envelope input-icon" aria-hidden="true"></i>
                            <input type="email" class="form-input with-icon" id="email" name="email" placeholder="name@example.com" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Personal Section -->
            <div class="form-section">
                <h2 class="form-section-title">Personal details</h2>
                <div class="form-row">
                    <div class="form-group half-width">
                        <label class="form-label">Age range</label>
                        <div class="radio-group">
                            <label class="radio-option" for="age1">
                                <input class="form-check-input" type="radio" name="age" id="age1" value="Under 18" required>
                                <label class="form-check-label" for="age1">Under 18</label>
                            </label>
                            <label class="radio-option" for="age2">
                                <input class="form-check-input" type="radio" name="age" id="age2" value="18-25">
                                <label class="form-check-label" for="age2">18–25</label>
                            </label>
                            <label class="radio-option" for="age3">
                                <input class="form-check-input" type="radio" name="age" id="age3" value="26-35">
                                <label class="form-check-label" for="age3">26–35</label>
                            </label>
                        </div>
                    </div>
                    <div class="form-group half-width">
                        <label class="form-label">Gender</label>
                        <div class="radio-group">
                            <label class="radio-option" for="male">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                                <label class="form-check-label" for="male">Male</label>
                            </label>
                            <label class="radio-option" for="female">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                                <label class="form-check-label" for="female">Female</label>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="address">Delivery address</label>
                        <div class="input-with-icon">
                            <i class="fas fa-location-dot input-icon" aria-hidden="true"></i>
                            <input type="text" class="form-input with-icon" id="address" name="address" placeholder="123 Main St, Colombo 07" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Password Section -->
            <div class="form-section">
                <h2 class="form-section-title">Password</h2>
                <div class="form-row">
                    <div class="form-group half-width">
                        <label class="form-label" for="password">Password</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock input-icon" aria-hidden="true"></i>
                            <input type="password" class="form-input with-icon" id="password" name="password" placeholder="Password" required>
                        </div>
                        <div class="password-hint">
                            Use at least 6 characters with a mix of uppercase, lowercase, number and symbol.
                        </div>
                        <div id="passwordError" class="error-message"></div>
                    </div>
                    <div class="form-group half-width">
                        <label class="form-label" for="confirmPassword">Confirm password</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock-check input-icon" aria-hidden="true"></i>
                            <input type="password" class="form-input with-icon" id="confirmPassword" name="confirmPassword" placeholder="Repeat password" required>
                        </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Profile</title>
  <style>
    body {
        background-color: #fcffff;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;dilan
    }

    .form-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 140px);
        padding-top: 60px;
        padding-bottom: 60px;
    }

    .form-container {
        background-color: #fceaca;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
    }

    h2 {
        text-align: center;
        color: #e61616;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        color: #f85506;
        margin-bottom: 8px;
    }

    .form-control {
        width: 100%;
        padding: 12px 14px;
        border: 2px solid #fe980f;
        border-radius: 10px;
        background-color: #fcffff;
        font-size: 15px;
        transition: border-color 0.3s ease;
        box-sizing: border-box;
    }

    .form-control:focus {
        outline: none;
        border-color: #f85506;
    }

    .radio-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .form-check {
        display: flex;
        align-items: center;
    }

    .form-check-input {
        margin-right: 10px;
    }

    .form-check-label {
        font-weight: normal;
    }

    button[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #fe980f;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
        margin-top: 20px;
    }

    button[type="submit"]:hover {
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

  <div class="form-wrapper">
    <div class="form-container">
        <h2>Update Profile</h2>

        <form method="post" action="<%=request.getContextPath()%>/updatecustomer" id="updateForm">
            <!-- Hidden ID field if needed -->
            <input type="hidden" name="id" value="${param.id}">
            
            <div class="form-group">
                <label for="floatingName">Name</label>
                <input type="text" class="form-control" id="floatingName" name="name" 
                       value="${param.name}" placeholder="Your Name" required>
            </div>
            
            <div class="form-group">
                <label>Age Range</label>
                <div class="radio-group">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="age" id="age1" 
                               value="Under 18" ${param.age == 'Under 18' ? 'checked' : ''} required>
                        <label class="form-check-label" for="age1">Under 18</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="age" id="age2" 
                               value="18-25" ${param.age == '18-25' ? 'checked' : ''}>
                        <label class="form-check-label" for="age2">18–25</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="age" id="age3" 
                               value="26-35" ${param.age == '26-35' ? 'checked' : ''}>
                        <label class="form-check-label" for="age3">26–35</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="floatingGender">Gender</label>
                <select class="form-control" id="floatingGender" name="gender" required>
                    <option value="" disabled ${param.gender == null ? "selected" : ""}>Select Gender</option>
                    <option value="Male" ${param.gender == 'Male' ? "selected" : ""}>Male</option>
                    <option value="Female" ${param.gender == 'Female' ? "selected" : ""}>Female</option>
                    <option value="Other" ${param.gender == 'Other' ? "selected" : ""}>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="floatingAddress">Address</label>
                <input type="text" class="form-control" id="floatingAddress" name="address" 
                       value="${param.address}" placeholder="No/114A" required>
            </div>

            <div class="form-group">
                <label for="floatingEmail">Email address</label>
                <input type="email" class="form-control" id="floatingEmail" name="email" 
                       value="${param.email}" placeholder="name@example.com" required>
            </div>

            <!-- Password Field with Validation -->
            <div class="form-group">
                <label for="floatingPassword">Password</label>
                <input type="password" class="form-control" id="floatingPassword" name="password" 
                       placeholder="Leave blank to keep current password">
                <div class="password-hint">
                    If changing password, it must contain: 6+ characters, uppercase, lowercase, number, and special character
                </div>
                <div id="passwordError" class="error-message"></div>
            </div>

            <!-- Confirm Password Field -->
            <div class="form-group">
                <label for="floatingConfirmPassword">Confirm Password</label>
                <input type="password" class="form-control" id="floatingConfirmPassword" 
                       name="confirmPassword" placeholder="Confirm new password">
                <div id="confirmPasswordError" class="error-message"></div>
            </div>

            <button type="submit">Update Profile</button>
        </form>
    </div>
  </div>

  <script>
  document.getElementById("updateForm").addEventListener("submit", function (e) {
      const name = document.getElementById("floatingName").value.trim();
      const email = document.getElementById("floatingEmail").value.trim();
      const password = document.getElementById("floatingPassword").value;
      const confirmPassword = document.getElementById("floatingConfirmPassword").value;
      const address = document.getElementById("floatingAddress").value.trim();
      const ageSelected = document.querySelector("input[name='age']:checked");
      const genderSelected = document.getElementById("floatingGender").value;

      let errors = [];
      const passwordError = document.getElementById("passwordError");
      const confirmPasswordError = document.getElementById("confirmPasswordError");
      
      // Clear previous errors
      passwordError.textContent = "";
      confirmPasswordError.textContent = "";

      if (name === "") {
          errors.push("Name is required.");
      }

      // Password validation (only if password field is not empty)
      if (password !== "") {
          const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
          
          if (!passwordRegex.test(password)) {
              errors.push("Password must contain: 6+ characters, uppercase, lowercase, number, and special character");
              passwordError.textContent = "Password must contain: 6+ characters, uppercase, lowercase, number, and special character";
          }
          
          if (password !== confirmPassword) {
              errors.push("Passwords do not match");
              confirmPasswordError.textContent = "Passwords do not match";
          }
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
  document.getElementById("floatingPassword").addEventListener("input", function() {
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
  document.getElementById("floatingConfirmPassword").addEventListener("input", function() {
      const password = document.getElementById("floatingPassword").value;
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

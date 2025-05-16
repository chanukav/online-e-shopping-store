<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            transition: transform 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-5px);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .profile-header h1 {
            color: #2c3e50;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: 1px;
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
            transition: transform 0.3s ease;
        }
        .profile-pic:hover {
            transform: scale(1.05);
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
            transition: background 0.3s ease;
        }
        .upload-icon:hover {
            background: #e68a00;
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
        .btn-custom {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fff;
            border: none;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            width: 100%;
        }
        .btn-custom:hover {
            background: linear-gradient(90deg, #e68a00, #e61616);
            transform: translateY(-2px);
        }
        @media (max-width: 576px) {
            .profile-card {
                padding: 1.5rem;
            }
            .profile-header h1 {
                font-size: 1.5rem;
            }
            .profile-pic-container {
                width: 100px;
                height: 100px;
            }
            .btn-custom {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-card">
        <form method="post" action="Add_Admin" enctype="multipart/form-data">
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
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                <label for="email">Email Address</label>
            </div>
			<div class="form-floating mb-4 position-relative">
			  <input type="password" class="form-control" id="password" name="password" placeholder="Password" required minlength="8"
			         pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
			         title="Must contain at least one number, one uppercase and lowercase letter, and at least 8 or more characters">
			  <label for="password">Password</label>
			  <button type="button" id="togglePassword" class="btn position-absolute top-50 end-0 translate-middle-y me-2" style="background: none; border: none;">
			    <i class="fas fa-eye" id="toggleIcon"></i>
			  </button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
    
    document.getElementById('password').addEventListener('input', function () {
    	  const pwd = this.value;
    	  const strengthBar = document.getElementById('passwordStrength');
    	  
    	  // Password strength evaluation
    	  let strength = 0;
    	  if (pwd.length >= 8) strength += 25;
    	  if (/[A-Z]/.test(pwd)) strength += 25;
    	  if (/[a-z]/.test(pwd)) strength += 25;
    	  if (/[0-9]/.test(pwd)) strength += 25;

    	  // Update progress bar
    	  strengthBar.style.width = strength + '%';
    	  if (strength <= 25) {
    	    strengthBar.className = 'progress-bar bg-danger';
    	  } else if (strength <= 50) {
    	    strengthBar.className = 'progress-bar bg-warning';
    	  } else if (strength <= 75) {
    	    strengthBar.className = 'progress-bar bg-info';
    	  } else {
    	    strengthBar.className = 'progress-bar bg-success';
    	  }

    	  // Existing validation
    	  if (pwd.length < 8) {
    	    this.setCustomValidity("Password must be at least 8 characters.");
    	  } else {
    	    this.setCustomValidity("");
    	  }
    	});

    	// Toggle password visibility
    	document.getElementById('togglePassword').addEventListener('click', function () {
    	  const passwordInput = document.getElementById('password');
    	  const toggleIcon = document.getElementById('toggleIcon');
    	  if (passwordInput.type === 'password') {
    	    passwordInput.type = 'text';
    	    toggleIcon.classList.remove('fa-eye');
    	    toggleIcon.classList.add('fa-eye-slash');
    	  } else {
    	    passwordInput.type = 'password';
    	    toggleIcon.classList.remove('fa-eye-slash');
    	    toggleIcon.classList.add('fa-eye');
    	  }
    	});
</script>
</body>
</html>
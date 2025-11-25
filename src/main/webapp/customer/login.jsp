<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  
  <title>Online E‑Shopping Store | Login</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="icon" href="image/favicon.png" type="image/png">
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

  /* login.css */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  
  font-family: 'Poppins', sans-serif;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-wrapper {
  background-color: white;
  width: 90%;
  max-width: 950px;
  display: flex;
  border-radius: 18px;
  overflow: hidden;
  box-shadow: 0 0 30px rgba(0,0,0,0.1);
  border: 8px solid #ff3c00;
}

.login-card {
  display: flex;
  width: 100%;
  flex-direction: row;
}

.left-section {
  flex: 1;
  background: #f7f7f7;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 30px;
}

.left-section img {
  width: 100%;
  max-width: 300px;
}

.right-section {
  flex: 1;
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  background-color: white;
}

.right-section h2 {
  font-weight: 600;
  margin-bottom: 25px;
  color: #1a1a1a;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.login-form input {
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-size: 14px;
  outline: none;
}

.form-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
  margin-top: 5px;
}

.form-options span {
  margin-left: 5px;
}

.form-options a {
  color: #ff3c00;
  text-decoration: none;
  font-weight: 500;
}

.form-buttons {
  display: flex;
  gap: 15px;
  margin-top: 20px;
}

.login-btn,
.create-btn {
  flex: 1;
  padding: 12px;
  font-weight: 600;
  border-radius: 10px;
  border: none;
  cursor: pointer;
  font-size: 15px;
}

.login-btn {
  background-color: #ff3c00;
  color: white;
}

.create-btn {
  background-color: #f3f3f3;
  color: #333;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.login-btn:hover {
  background-color: #e93800;
}

.create-btn:hover {
  background-color: #e6e6e6;
}

/* Toggle Switch */
.custom-toggle {
  position: relative;
  display: inline-block;
  width: 38px;
  height: 20px;
}

.custom-toggle input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0; left: 0; right: 0; bottom: 0;
  background-color: #ccc;
  transition: .4s;
  border-radius: 20px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 14px;
  width: 14px;
  left: 3px;
  bottom: 3px;
  background-color: white;
  transition: .4s;
  border-radius: 50%;
}

.custom-toggle input:checked + .slider {
  background-color: #ff3c00;
}

.custom-toggle input:checked + .slider:before {
  transform: translateX(18px);
}

</style>
<body>
  <div class="login-wrapper">
    <div class="login-card">
      <div class="left-section">
        <img src="<%=request.getContextPath()%>/image/login-illustration.jpg" alt="Shopping Illustration">
      </div>
      <div class="right-section">
        <h2>Welcome Back. Please Log In<br>To Your Account.</h2>
        <form class="login-form" action="<%=request.getContextPath()%>/login" method="POST">
          <input type="email" placeholder="abcemail@gmail.com" required />
          <input type="password" placeholder="********" required />

          <div class="form-options">
            <label class="custom-toggle">
              <input type="checkbox" checked>
              <span class="slider"></span>
            </label>
            <span>Remember Password</span>
            <a href="#">Forget Password ?</a>
          </div>

          <div class="form-buttons">
            <button type="submit" class="login-btn">Login</button>
            <a href="<%=request.getContextPath()%>/customer/register.jsp"><button type="button" class="create-btn">Create Account</button></a>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>

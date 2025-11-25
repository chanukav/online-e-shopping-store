<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online E‑Shopping Store | Login</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="icon" href="image/favicon.png" type="image/png">
  <script src="https://unpkg.com/lottie-web@5.12.0/build/player/lottie.min.js"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      background: linear-gradient(135deg, #fff5ef 0%, #ffe1d4 45%, #fff5ef 100%);
    }

    .login-wrapper {
      background-color: #ffffff;
      width: 100%;
      max-width: 1100px;
      display: flex;
      border-radius: 24px;
      overflow: hidden;
      box-shadow: 0 30px 80px rgba(255, 60, 0, 0.15);
      border: 6px solid #ff3c00;
    }

    .login-card {
      display: flex;
      width: 100%;
      flex-direction: row;
      position: relative;
      isolation: isolate;
    }

    .login-card::after {
      content: '';
      position: absolute;
      top: -40%;
      left: -10%;
      width: 60%;
      height: 180%;
      background: radial-gradient(circle, rgba(255, 132, 73, 0.4), transparent 70%);
      z-index: -1;
    }

    .left-section {
      flex: 1;
      background: #fff8f4;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px;
    }

    #login-illustration {
      width: 100%;
      max-width: 360px;
      aspect-ratio: 1;
    }

    .right-section {
      flex: 1;
      padding: 50px 60px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      background-color: #ffffff;
    }

    .right-section h2 {
      font-weight: 600;
      margin-bottom: 12px;
      color: #1a1a1a;
      font-size: 2rem;
    }

    .right-section p {
      color: #666;
      margin-bottom: 32px;
      font-size: 0.95rem;
    }

    .login-form {
      display: flex;
      flex-direction: column;
      gap: 18px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    .form-group label {
      font-size: 0.9rem;
      color: #4a4a4a;
      font-weight: 500;
    }

    .form-group input {
      padding: 14px;
      border: 1.5px solid #ffe1d4;
      border-radius: 12px;
      font-size: 0.95rem;
      transition: border-color 0.2s ease, box-shadow 0.2s ease;
    }

    .form-group input:focus {
      outline: none;
      border-color: #ff3c00;
      box-shadow: 0 0 0 3px rgba(255, 60, 0, 0.15);
    }

    .form-options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 0.9rem;
      color: #4a4a4a;
      flex-wrap: wrap;
      gap: 10px;
    }

    .form-options a {
      color: #ff3c00;
      text-decoration: none;
      font-weight: 500;
    }

    .form-options a:hover {
      text-decoration: underline;
    }

    .custom-toggle {
      position: relative;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-size: 0.9rem;
    }

    .custom-toggle input {
      appearance: none;
      width: 44px;
      height: 24px;
      background-color: #ddd;
      border-radius: 24px;
      position: relative;
      transition: background 0.3s ease;
      cursor: pointer;
    }

    .custom-toggle input::after {
      content: '';
      position: absolute;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      left: 3px;
      top: 3px;
      background: #fff;
      transition: transform 0.3s ease;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }

    .custom-toggle input:checked {
      background-color: #ff3c00;
    }

    .custom-toggle input:checked::after {
      transform: translateX(20px);
    }

    .form-buttons {
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin-top: 10px;
    }

    .primary-btn,
    .secondary-btn,
    .admin-btn {
      padding: 14px 16px;
      font-weight: 600;
      border-radius: 12px;
      border: none;
      cursor: pointer;
      font-size: 1rem;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .primary-btn {
      background: linear-gradient(90deg, #ff3c00, #ff7100);
      color: #fff;
      box-shadow: 0 10px 30px rgba(255, 60, 0, 0.3);
    }

    .secondary-btn {
      background-color: #fff5ef;
      color: #ff3c00;
      border: 1.5px solid #ffd0bc;
    }

    .admin-btn {
      background: transparent;
      color: #ff3c00;
      border: 1.5px dashed #ff3c00;
    }

    .primary-btn:hover,
    .secondary-btn:hover,
    .admin-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 26px rgba(255, 60, 0, 0.2);
    }

    .bottom-note {
      text-align: center;
      margin-top: 18px;
      font-size: 0.9rem;
      color: #777;
    }

    @media (max-width: 992px) {
      .login-card {
        flex-direction: column;
      }

      .right-section {
        padding: 40px 30px;
      }

      .left-section {
        padding: 30px 20px;
      }
    }

    @media (max-width: 576px) {
      body {
        padding: 12px;
      }

      .right-section h2 {
        font-size: 1.6rem;
      }

      .form-options {
        flex-direction: column;
        align-items: flex-start;
      }
    }
  </style>
</head>
<body>
  <div class="login-wrapper">
    <div class="login-card">
      <div class="left-section">
        <div id="login-illustration" aria-hidden="true"></div>
      </div>
      <div class="right-section">
        <h2>Welcome Back</h2>
        <p>Log in to keep track of your latest orders, wishlist, and rewards.</p>
        <form class="login-form" action="<%=request.getContextPath()%>/login" method="POST" autocomplete="on" novalidate>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="you@example.com" autocomplete="email" required>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="current-password" required>
          </div>
          <div class="form-options">
            <label class="custom-toggle">
              <input type="checkbox" name="remember" value="true" checked>
              Remember me
            </label>
            <a href="#">Forgot password?</a>
          </div>
          <div class="form-buttons">
            <button type="submit" class="primary-btn">Login</button>
            <button type="button" class="secondary-btn" onclick="location.href='<%=request.getContextPath()%>/customer/register.jsp'">Create Account</button>
            <button type="button" class="admin-btn" onclick="location.href='<%=request.getContextPath()%>/admin/admin_login.jsp'">Admin Login</button>
          </div>
        </form>
        <div class="bottom-note">
          Secured by Online E‑Shopping Store · 256-bit encryption
        </div>
      </div>
    </div>
  </div>
  <script>
    lottie.loadAnimation({
      container: document.getElementById('login-illustration'),
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: '<%=request.getContextPath()%>/image/Online Shopping.json'
    });
  </script>
</body>
</html>

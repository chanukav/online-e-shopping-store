
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Online E‑Shopping Store | Login</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="icon" href="image/favicon.png" type="image/png">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

    :root {
      --brand-yellow: #fe980f;
      --brand-white: #fffaf5;
      --brand-gray: #fceaca;
      --brand-orange: #f85506;
      --brand-red: #e61616;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #fef9f5, #ffe0c1); /* Light, attractive background */
    }

    .card {
      background-color: var(--brand-white);
      width: 360px;
      padding: 2.5rem 2rem;
      border-radius: 1.5rem;
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-direction: column;
      gap: 1.25rem;
      animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .card h1 {
      color: var(--brand-orange);
      font-size: 1.75rem;
      text-align: center;
      margin-bottom: 0.5rem;
    }

    .card p {
      color: #333;
      font-size: 0.9rem;
      text-align: center;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }

    label {
      font-weight: 500;
      color: #555;
    }

    input[type="email"],
    input[type="password"] {
      padding: 0.75rem 1rem;
      border: 2px solid var(--brand-gray);
      border-radius: 0.5rem;
      background: var(--brand-gray);
      font-size: 0.95rem;
      transition: border-color 0.2s;
    }

    input:focus {
      border-color: var(--brand-orange);
      outline: none;
    }

    .actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 0.5rem;
      font-size: 0.85rem;
    }

    .actions a {
      color: var(--brand-red);
      text-decoration: none;
      transition: color 0.2s;
    }

    .actions a:hover {
      color: var(--brand-orange);
    }

    .btn-login {
      width: 100%;
      background-color: var(--brand-red);
      color: var(--brand-white);
      border: none;
      padding: 0.85rem 0;
      border-radius: 0.75rem;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.2s, transform 0.1s;
    }

    .btn-login:hover {
      background-color: var(--brand-orange);
    }

    .btn-login:active {
      transform: scale(0.97);
    }

    .admin-link {
      text-align: center;
      margin-top: 1rem;
    }

    .admin-link a {
      color: var(--brand-yellow);
      font-weight: 600;
      text-decoration: none;
      transition: color 0.2s;
    }

    .admin-link a:hover {
      color: var(--brand-orange);
    }
  </style>
</head>
<body>
  <main class="card" role="main">
    <h1>Sign In</h1>
    <p>Welcome back to Online E‑Shopping Store</p>
    <form action="<%=request.getContextPath()%>/login" method="POST">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="" required />
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="" required />
      </div>
      <div class="actions">
        <a href="/forgot-password">Forgot password?</a>
      </div>
      <button class="btn-login" type="submit">Log In</button>
    </form>
    <div class="admin-link">
      <a href="${pageContext.request.contextPath}/admin/admin_index.jsp">Log in as Admin</a>
    </div>
    <p style="text-align:center; font-size:0.85rem">
      Don't have an account? 
      <a href="<%=request.getContextPath()%>/customer/register.jsp" style="color:var(--brand-red); font-weight:600;">Create Account</a>
    </p>
  </main>
</body>
</html>

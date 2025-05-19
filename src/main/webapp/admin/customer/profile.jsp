<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
   
  <meta charset="UTF-8">


  <title>My Profile</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #fcffff;
      margin: 0;
      padding: 0;
    }

    .main-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: calc(100vh - 80px); /* adjust based on your header height */
      padding-top: 60px;
    }

    .profile-container {
      background: #fceaca;
      padding: 30px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      width: 400px;
    }

    h1 {
      text-align: center;
      color: #e61616;
      margin-bottom: 25px;
    }

    .form-floating {
      margin-bottom: 16px;
    }

    label {
      display: block;
      color: #f85506;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"] {
      width: 100%;
      padding: 10px;
      border: 1.5px solid #fe980f;
      border-radius: 8px;
      background: #fcffff;
      font-size: 14px;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #fe980f;
      color: white;
      font-weight: bold;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #f85506;
    }

    fieldset {
      border: none;
      padding: 0;
      margin: 0;
    }
    .logo-full, .logo-icon {
  font-weight: 700;
  background: linear-gradient(90deg, #fe980f, #f85506);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  display: inline-block;
  transition: transform 0.3s ease;
}
.logo-full:hover, .logo-icon:hover {
  transform: scale(1.05);
}
.logo-icon {
  display: none;
}
.logo-full {
  font-size: 28px;
  font-weight: 800;
  font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(90deg, #fe980f, #f85506);
  background-size: 200% auto;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: shine 2.5s linear infinite;
  letter-spacing: 1px;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
  display: inline-block;
  cursor: pointer;
}

.logo-full:hover {
  transform: scale(1.1);
}

@keyframes shine {
  0% {
    background-position: 0% center;
  }
  100% {
    background-position: 200% center;
  }
}

    
  </style>
</head>
<body>
  

<div class="main-wrapper">
  <div class="profile-container">
    <h1>My Profile</h1>

    

    

    <c:set var="cus" value="${customer}" />

    <fieldset disabled>
      <div class="form-floating">
        <label for="floatingInputName">Name</label>
        <input type="text" id="floatingInputName" value="${cus.name}" name="name" placeholder="M.D John">
      </div>

      <div class="form-floating">
        <label for="floatingInputAge">Age</label>
        <input type="text" id="floatingInputAge" value="${cus.age}" name="age" placeholder="22">
      </div>

      <div class="form-floating">
        <label for="floatingInputGender">Gender</label>
        <input type="text" id="floatingInputGender" value="${cus.gender}" name="gender" placeholder="Male/Female">
      </div>

      <div class="form-floating">
        <label for="floatingInputAddress">Address</label>
        <input type="text" id="floatingInputAddress" value="${cus.address}" name="address" placeholder="No/114">
      </div>

      <div class="form-floating">
        <label for="floatingInputEmail">Email address</label>
        <input type="email" id="floatingInputEmail" value="${cus.email}" name="email" placeholder="name@example.com">
      </div>

      <div class="form-floating">
        <label for="floatingPassword">Password</label>
        <input type="text" id="floatingPassword" value="${cus.password}" name="password" placeholder="Password">
      </div>
    </fieldset>

    <form action="Update.jsp" method="post">
      <input type="hidden" name="name" value="${cus.name}">
      <input type="hidden" name="age" value="${cus.age}">
      <input type="hidden" name="gender" value="${cus.gender}">
      <input type="hidden" name="address" value="${cus.address}">
      <input type="hidden" name="email" value="${cus.email}">
      <input type="hidden" name="password" value="${cus.password}">
      <input type="submit" value="Update">
    </form>
  </div>
</div>



</body>
</html>

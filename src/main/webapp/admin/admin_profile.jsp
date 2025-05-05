<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        body {
            background-color: #fceaca;
        }
        .profile-card {
            background-color: #fcffff;
            border-radius: 10px;
            padding: 30px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .profile-card h3 {
            color: #e61616;
        }
        .profile-info label {
            font-weight: bold;
            color: #f85506;
        }
        .profile-info p {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <h1>My profile</h1>
	
	<c:set var ="admin" value="${Admin}"/>
	<fieldset disabled>
	<div class="form-floating mb-3">
		<label for="floatingInput">Admin ID</label>
	  <input type="text" class="form-control" id="floatingInput" name="admin_id" value="${admin.adminid}">
	</div>
	<div class="form-floating mb-3">
		<label for="floatingInput">Fist Name</label>
	  <input type="text" class="form-control" id="floatingInput" name="firstName" value="${admin.fname}">

	</div>
	<div class="form-floating mb-3">
		<label for="floatingInput">Last Name</label>
	  <input type="text" class="form-control" id="floatingInput" name="lastName" value="${admin.lname}" >
	  
	</div>
	
	<div class="form-floating mb-3">
	<label for="floatingInput">Email address</label>
	  <input type="email" class="form-control" id="floatingInput" name="email" value="${admin.email}">
	  
	</div>
	<div class="form-floating">
		<label for="floatingPassword">Password</label>
	  <input type="password" class="form-control" id="floatingPassword" name="password" value="${admin.password}">
	</div>
	
	</fieldset>
	<form action="admin_update.jsp" method="post">

	<input type="hidden" name="admin_id" value="${admin.adminid}">
	<input type="hidden" name="firstName" value="${admin.fname}">
	<input type="hidden" name="lastName" value="${admin.lname}">
	<input type="hidden" name="email" value="${admin.email}">
	<input type="hidden" name="password" value="${admin.password}">

	<input type="submit" value = "update">
	</form>
	
	
	
</body>
</html>

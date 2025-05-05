<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Update your profile</h1>
	<form method="post" action="updateCustomer">
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
	
	<button type="submit" class="btn btn-secondary">Submit</button>
	
	</form>

</body>
</html>
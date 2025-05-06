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
	<form method="post" action="Admin_update">
	<div class="form-floating mb-3">
		<label for="floatingInput">Fist Name</label>
	  <input type="text" class="form-control" id="floatingInput" name="firstName" value="${param.firstName}">

	</div>
	<div class="form-floating mb-3">
		<label for="floatingInput">Last Name</label>
	  <input type="text" class="form-control" id="floatingInput" name="lastName" value="${param.lastName}" >
	  
	</div>
	
	<div class="form-floating mb-3">
	<label for="floatingInput">Email address</label>
	  <input type="email" class="form-control" id="floatingInput" name="email" value="${param.email}">
	  
	</div>
	<div class="form-floating">
		<label for="floatingPassword">Password</label>
	  <input type="password" class="form-control" id="floatingPassword" name="password" value="${param.password}">
	</div>
	
	<button type="submit" class="btn btn-secondary">Submit</button>
	
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Admin Management</title>
</head>
<body>
<a href="admin_register.jsp"><button type="button" class="btn btn-secondary">Add New Admin</button></a>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Admin Id</th>
      <th scope="col">First name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="admin" items="${adminList}">
  		<tr>
  			<td>${admin.adminid}</td>
  			<td>${admin.fname}</td>
  			<td>${admin.lname}</td>
  			<td>${admin.email}</td>
  			<td>
  			<form action="Single_admin_details" method="post">
  				<input type="hidden" name="email" value="${admin.email}">
  				<button type="submit">data</button>
  			</form>
  			</td>
  			
  			<td>
  				<form action="Admin_delete" method="post">
  					<input type="hidden" name="email" value="${admin.email}">
  					<button type="submit">Delete</button>
  					
  				</form>
  			
  			</td>
  		</tr>
  </c:forEach>  
  </tbody>
</table>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
    body {
        background-color: #fcffff;
        font-family: 'Segoe UI', sans-serif;
        padding: 30px;
    }

    h2 {
        color: #e61616;
        margin: 0;
    }

    .table {
        background-color: #fceaca;
        border-radius: 12px;
        overflow: hidden;
    }

    th {
        background-color: #fe980f;
        color: #fff;
        text-align: center;
    }

    td {
        text-align: center;
        vertical-align: middle;
    }

    .btn-custom {
        background-color: #f85506;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 6px 12px;
        font-weight: bold;
        transition: background-color 0.3s ease;
        text-decoration: none;
    }

    .btn-custom:hover {
        background-color: #e61616;
        color: white;
    }

    .btn-delete {
        background-color: #e61616;
    }

    .btn-delete:hover {
        background-color: #a80c0c;
    }

    .table th, .table td {
        border: 1px solid #fe980f;
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
</style>
</head>
<body>

<div class="header-container">
    <h2>Customer Profile List</h2>
    <a href="<%=request.getContextPath()%>/admin/customer/userregister2.jsp" class="btn btn-custom">Add User</a>
</div>

<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th>Name</th>
      <th>Age</th>
      <th>Gender</th>
      <th>Address</th>
      <th>Email</th>
      <th>Password</th>
      <th>View</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="cus" items="${customer}">
  		<tr>
  			<td>${cus.name}</td>
            <td>${cus.age}</td>
            <td>${cus.gender}</td>
            <td>${cus.address}</td>
            <td>${cus.email}</td>
            <td>${cus.password}</td>
            <td>
              <form action="singleDataButton" method="post">
                  <input type="hidden" name="email" value="${cus.email}">
                  <button type="submit" class="btn btn-custom">View</button>
              </form>
            </td>
            <td>
              <form action="deleteCustomer" method="post" onsubmit="return  confirm('Are you sure delete that product?');">
                  <input type="hidden" name="email" value="${cus.email}">
                  <button type="submit" class="btn btn-custom btn-delete">Delete</button>
              </form>
            </td>
  		</tr>
  	</c:forEach>
  	
  	<c:if test="${param.update == 'success'}">
    <script>
        alert("Customer profile updated successfully!");
    </script>
</c:if>
  	
  </tbody>
</table>

</body>
</html>

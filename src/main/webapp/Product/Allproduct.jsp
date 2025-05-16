<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Products - GAMUDA.LK</title>
    <style>
         <style>
        :root {
            --primary: #ff6b00;
            --secondary: #333;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: var(--dark);
            background-color: #f5f5f5;
        }
        
        header {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }
        
        .container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary);
        }
        
        .btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9rem;
            text-decoration: none;
        }
        
        .btn-secondary {
            background-color: var(--gray);
        }
        
        .data-grid {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .product-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }
        
        .action-btn {
            background: none;
            border: none;
            cursor: pointer;
            color: var(--primary);
            margin-right: 0.5rem;
        }
        
        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            border-top: 1px solid #eee;
        }
        
        .page-info {
            color: var(--gray);
        }
        
        .page-nav {
            display: flex;
            gap: 0.5rem;
        }
        
        .page-link {
            padding: 0.5rem 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: var(--dark);
        }
        
        .page-link.active {
            background-color: var(--primary);
            color: white;
            border-color: var(--primary);
        }
    </style>
    </style>
</head>
<body>
    <header>
        <div class="navbar">
            <div class="logo">GAMUDA.LK</div>
            <div class="user-actions">
                <a href="#" style="color: white; text-decoration: none;">Logout</a>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="admin-header">
            <h1 class="page-title">Product Management</h1>
            <a href="add-product.html" class="btn">Add New Product</a>
        </div>
        
        <div class="data-grid">
           <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Product Price (Rs)</th>
                    <th>Product Stock</th>
                    <th>Product Brand</th>
                    <th>Item Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
    <c:forEach var="product" items="${allProduct}">
        <tr>
            <td>${product.pid}</td>
            <td>${product.prodName}</td>
            <td>${product.category}</td>
            <td>${product.descrip}</td>
            <td>Rs. ${product.pprice}</td>
            <td>${product.pstock}</td>
            <td>${product.pbrand}</td>
            <td>
                <img src="WebContent/${product.pimg}" width="100" alt="Product Image">
            </td>
            
                <td>
					    <div class="action-buttons">
					        <form action="updatProduct.jsp" method="POST">
					            <input type="hidden" name="pid" value="${product.pid}">
					            <input type="hidden" name="prodName" value="${product.prodName}">
					            <input type="hidden" name="category" value="${product.category}">
					            <input type="hidden" name="descrip" value="${product.descrip}">
					            <input type="hidden" name="pprice" value="${product.pprice}">
					            <input type="hidden" name="pstock" value="${product.pstock}">
					            <input type="hidden" name="pbrand" value="${product.pbrand}">
					            <input type="hidden" name="pimg" value="WebContent/${product.pimg}">

					            <button type="submit" class="action-button update-button">Update</button>
					        </form>
					
					        <form action="DeleteAuction" method="POST">
					            <input type="hidden" name="aucid" value="${auction.aucid}">
					            <button type="submit" class="action-button delete-button">Delete</button>
					        </form>
					    </div>
					</td>
            
        </tr>
    </c:forEach>
</tbody>

        </table>
            
        </div>
    </div>
</body>
</html>
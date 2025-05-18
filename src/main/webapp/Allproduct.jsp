<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Products - GAMUDA.LK</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #212529;
            background-color: #f5f5f5;
        }

        header {
            background-color: #ff6b00;
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
            color: #333;
        }

        .btn {
            display: inline-block;
            background-color: #ff6b00;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9rem;
            text-decoration: none;
            text-align: center;
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
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #f85506;
            font-weight: 600;
            position: sticky;
            top: 0;
        }

        tr:hover {
            background-color: #fceaca;
        }

        .product-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            white-space: nowrap;
        }

        .update-button {
            background-color: #28a745;
            padding: 0.375rem 0.75rem;
            border-radius: 4px;
            font-size: 0.875rem;
            cursor: pointer;
            border: none;
            color: white;
            text-decoration: none;
            transition: background-color 0.2s ease;
        }

        .update-button:hover {
            background-color: #218838;
        }

        .delete-button {
            background-color: #dc3545;
            padding: 0.375rem 0.75rem;
            border-radius: 4px;
            font-size: 0.875rem;
            cursor: pointer;
            border: none;
            color: white;
            text-decoration: none;
            transition: background-color 0.2s ease;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 0.5rem;
            }

            th, td {
                padding: 0.5rem;
            }

            .action-buttons {
                flex-direction: column;
                gap: 0.25rem;
            }
        }
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
            <a href="AddProduct.jsp" class="btn">Add New Product</a>
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
                                        <button type="submit" class="update-button">Update</button>
                                    </form>

                                    <form action="DeleteProduct" method="POST" onsubmit="return confirm('Are you sure delete that product?');">
                                        <input type="hidden" name="pid" value="${product.pid}" >
                                        <button type="submit" class="delete-button">Delete</button>
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

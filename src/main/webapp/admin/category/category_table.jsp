<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <title>Category Management</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
        }
        .container {
            max-width: 1400px;
            margin-top: 2rem;
        }
        .table {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
        .table thead {
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: #fff;
        }
        .table thead th {
            font-weight: 600;
            padding: 1.25rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .table tbody tr {
            transition: background 0.2s ease;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .table tbody td {
            vertical-align: middle;
            padding: 1rem;
        }
        .btn-modern {
            padding: 8px 20px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.9rem;
            border: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .btn-primary-custom {
            background: #fe980f;
            color: #fff;
        }
        .btn-primary-custom:hover {
            background: #e68a00;
            color: #fff;
            transform: translateY(-1px);
        }
        .btn-danger-custom {
            background: #e61616;
            color: #fff;
        }
        .btn-danger-custom:hover {
            background: #c41212;
            color: #fff;
            transform: translateY(-1px);
        }
        .btn-add-category {
            background: #28a745;
            color: #fff;
            border-radius: 50px;
            padding: 10px 24px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-add-category:hover {
            background: #218838;
            transform: translateY(-1px);
        }
        @media (max-width: 768px) {
            .table thead {
                font-size: 0.85rem;
            }
            .btn-modern {
                padding: 6px 14px;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-end mb-4">
            <a href="<%=request.getContextPath()%>/admin/category/category_add.jsp">
                <button type="button" class="btn btn-add-category">
                    <i class="fas fa-plus me-2"></i>Add New Category
                </button>
            </a>
        </div>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="col">Category ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td>${category.categoryId}</td>
                        <td>${category.name}</td>
                        <td>${category.description}</td>
                        <td>
                            <div class="d-flex gap-2">
                                <form action="update_Category" method="Get">
                                    <input type="hidden" name="categoryId" value="${category.categoryId}">
                                    <button type="submit" class="btn-modern btn-primary-custom">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </button>
                                </form>
								<form action="delete_Category" method="Get" onsubmit="return confirmDelete()">
								    <input type="hidden" name="categoryId" value="${category.categoryId}">
								    <button type="submit" class="btn-modern btn-danger-custom">
								        <i class="fas fa-trash-alt me-1"></i> Delete
								    </button>
								</form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this category?");
        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        .profile-card {
            background-color: #fcffff;
            border-radius: 20px;
            padding: 40px 30px;
            max-width: 900px;
            margin: 60px auto;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .profile-header h3 {
            color: #e61616;
            font-weight: 700;
            font-size: 2rem;
        }
        .profile-photo {
            width: 130px;
            height: 130px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 4px solid #fe980f;
            transition: transform 0.3s ease;
        }
        .profile-photo:hover {
            transform: scale(1.05);
        }
        .form-floating > label {
            color: #f85506;
            font-weight: 500;
        }
        .form-control {
            border-radius: 12px;
            border-color: #fe980f;
            background-color: #fdfdfd;
        }
        .form-control:disabled {
            background-color: #f1f1f1;
            opacity: 0.9;
        }
        .update-btn {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #ffffff;
            border: none;
            padding: 12px 30px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }
        .update-btn:hover {
            background: linear-gradient(90deg, #e68a00, #e61616);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<div class="profile-card">
    <c:set var="admin" value="${Admin}" />
    <fieldset disabled>
        <div class="profile-header">
            <img 
                src="Admin_Image?adminId=${admin.adminid}"
                onerror="this.src='<%=request.getContextPath()%>/admin/Adminassets/images/default.webp';"
                alt="Profile Picture"
                class="profile-photo">
            <h3><i class="fas fa-user-circle me-2"></i>${admin.fname} ${admin.lname}</h3>
        </div>

        <div class="row g-4 mb-3">
            <div class="col-md-6">
                <div class="form-floating">
                    <input type="text" class="form-control" id="admin_id" value="${admin.adminid}">
                    <label for="admin_id"><i class="fas fa-id-badge me-2"></i>Admin ID</label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-floating">
                    <input type="text" class="form-control" id="firstName" value="${admin.fname}">
                    <label for="firstName"><i class="fas fa-user me-2"></i>First Name</label>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-3">
            <div class="col-md-6">
                <div class="form-floating">
                    <input type="text" class="form-control" id="lastName" value="${admin.lname}">
                    <label for="lastName"><i class="fas fa-user me-2"></i>Last Name</label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-floating">
                    <input type="email" class="form-control" id="email" value="${admin.email}">
                    <label for="email"><i class="fas fa-envelope me-2"></i>Email address</label>
                </div>
            </div>
        </div>

        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="password" value="${admin.password}">
            <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
        </div>
    </fieldset>

    <form action="admin_update.jsp" method="post" class="text-center mt-4">
        <input type="hidden" name="adminId" value="${admin.adminid}">
        <input type="hidden" name="firstName" value="${admin.fname}">
        <input type="hidden" name="lastName" value="${admin.lname}">
        <input type="hidden" name="email" value="${admin.email}">
        <input type="hidden" name="password" value="${admin.password}">
        <button type="submit" class="update-btn"><i class="fas fa-edit me-2"></i>Update</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
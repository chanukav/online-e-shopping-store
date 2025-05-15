<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<style>
body {
    background-color: #fceaca;
}
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.profile-card {
    background-color: #fcffff;
    border-radius: 15px;
    padding: 30px;
    max-width: 700px;
    width: 100%;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}
.profile-header {
    text-align: center;
    margin-bottom: 30px;
}
.profile-header h1 {
    color: #e61616;
    font-weight: bold;
}
.profile-pic-container {
    position: relative;
    width: 120px;
    height: 120px;
    margin: 0 auto 20px;
}
.profile-pic {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #fe980f;
}
.upload-icon {
    position: absolute;
    bottom: 0;
    right: 0;
    background-color: #f85506;
    color: #fcffff;
    border-radius: 50%;
    padding: 8px;
    cursor: pointer;
}
.form-control {
    border-radius: 10px;
    border-color: #fe980f;
}
.form-control:focus {
    border-color: #f85506;
    box-shadow: 0 0 5px rgba(248, 85, 6, 0.5);
}
.btn-custom {
    background-color: #e61616;
    color: #fcffff;
    border: none;
    padding: 10px 25px;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s;
}
.btn-custom:hover {
    background-color: #c91212;
}
</style>
</head>
<body>
<div class="container">
    <div class="profile-card">
        <form method="post" action="Admin_update" enctype="multipart/form-data">
            <input type="hidden" name="adminId" value="${param.adminId}">

            <div class="profile-header">
                <h1>Update Your Profile</h1>
            </div>
            <div class="profile-pic-container">
                <img id="profilePicPreview" class="profile-pic" src="Admin_Image?adminId=${param.adminId}" alt="Profile Picture" onerror="this.src='<%=request.getContextPath()%>/admin/Adminassets/images/default.webp';">
                <label for="profilePicInput" class="upload-icon"><i class="fas fa-camera"></i></label>
                <input type="file" id="profilePicInput" name="image" accept="image/*" style="display: none;">
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="firstName" name="firstName" value="${param.firstName}" placeholder="First Name">
                <label for="firstName">First Name</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastName" name="lastName" value="${param.lastName}" placeholder="Last Name">
                <label for="lastName">Last Name</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" value="${param.email}" placeholder="Email Address">
                <label for="email">Email Address</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" value="${param.password}" placeholder="Password">
                <label for="password">Password</label>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom">Submit</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
const profilePicInput = document.getElementById('profilePicInput');
const profilePicPreview = document.getElementById('profilePicPreview');
profilePicInput.addEventListener('change', function() {
    const file = this.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            profilePicPreview.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});
</script>
</body>
</html>
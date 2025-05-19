<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Profile</title>
  <style>
    body {
        background-color: #fcffff;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
    }

    .form-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 140px); /* Adjust based on header/footer height */
        padding-top: 60px;
        padding-bottom: 60px;
    }

    .form-container {
        background-color: #fceaca;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #e61616;
        margin-bottom: 30px;
    }

    .form-floating {
        margin-bottom: 20px;
    }

    .form-floating input,
    .form-floating select {
        width: 100%;
        padding: 12px 14px;
        border: 2px solid #fe980f;
        border-radius: 10px;
        background-color: #fcffff;
        font-size: 15px;
        transition: border-color 0.3s ease;
    }

    .form-floating label {
        display: block;
        font-weight: bold;
        color: #f85506;
        margin-top: 6px;
    }

    .form-floating input:focus,
    .form-floating select:focus {
        outline: none;
        border-color: #f85506;
    }

    button[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #fe980f;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    button[type="submit"]:hover {
        background-color: #e61616;
    }
  </style>
</head>

<body>

  <!-- ✅ Include the header -->


  <!-- Page content -->
  <div class="form-wrapper">
    <div class="form-container">
        <h2>Update Profile</h2>
        
        

        <form method="post" action="updatecustomer">
        
         <input type="hidden" name="source" value="admin">
            <div class="form-floating">
                <input type="text" id="floatingName" name="name" value="${param.name}" placeholder="Your Name" required>
                <label for="floatingName">Name</label>
            </div>

            <div class="form-floating">
                <input type="text" id="floatingAge" name="age" value="${param.age}" placeholder="Your Age or Range" required>
                <label for="floatingAge">Age</label>
            </div>

            <div class="form-floating">
                <select id="floatingGender" name="gender" required>
                    <option value="" disabled ${param.gender == null ? "selected" : ""}>Select Gender</option>
                    <option value="Male" ${param.gender == 'Male' ? "selected" : ""}>Male</option>
                    <option value="Female" ${param.gender == 'Female' ? "selected" : ""}>Female</option>
                    <option value="Other" ${param.gender == 'Other' ? "selected" : ""}>Other</option>
                </select>
                <label for="floatingGender">Gender</label>
            </div>

            <div class="form-floating">
                <input type="text" id="floatingAddress" name="address" value="${param.address}" placeholder="No/114A" required>
                <label for="floatingAddress">Address</label>
            </div>

            <div class="form-floating">
                <input type="email" id="floatingEmail" name="email" value="${param.email}" placeholder="name@example.com" required>
                <label for="floatingEmail">Email address</label>
            </div>

            <div class="form-floating">
                <input type="text" id="floatingPassword" name="password" value="${param.password}" placeholder="Password" required>
                <label for="floatingPassword">Password</label>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
  </div>

  <!-- ✅ Include the footer -->


</body>
</html>

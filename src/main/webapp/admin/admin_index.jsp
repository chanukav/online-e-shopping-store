<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Admin" %>
<%
	model.Admin admin = (model.Admin) request.getAttribute("Admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp"); // Redirect if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - E-Shop</title>
    <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fcffff;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #e61616; /* red */
            color: #fff;
            position: fixed;
        }
        .sidebar .nav-link {
            color: #fcffff;
            padding: 15px 20px;
        }
        .sidebar .nav-link:hover {
            background-color: #f85506; /* orange */
            color: #fff;
        }
        .sidebar .nav-link i {
            margin-right: 10px;
        }
        .sidebar .logo {
            font-size: 1.5rem;
            font-weight: bold;
            background-color: #fe980f; /* yellow */
            padding: 15px;
            text-align: center;
            color: #2a1b3d;
        }
        .main-content {
            margin-left: 250px;
            padding: 30px;
            background-color: #fceaca; /* gray */
            min-height: 100vh;
        }
    </style>
</head>
<body>
   <!-- Sidebar -->
	<div class="sidebar">
	    <div class="logo">E-Shop Admin</div>
	    <nav class="nav flex-column mt-3">
	        <a class="nav-link" href="#" data-page="dashboard.jsp"><i class="fas fa-gauge"></i> Dashboard</a>
	        <a class="nav-link" href="#" data-page="orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a>
	        <a class="nav-link" href="#" data-page="products.jsp"><i class="fas fa-box"></i> Products</a>
	        <a class="nav-link" href="#" data-page="customers.jsp"><i class="fas fa-users"></i> Customers</a>
	        <a class="nav-link" href="#" data-page="Manage_all_admins"><i class="fas fa-users"></i> Admins</a>
	        <a class="nav-link" href="#" data-page="billing.jsp"><i class="fas fa-chart-line"></i> Billing Analytics</a>
	        <a class="nav-link" href="#" data-page="settings.jsp"><i class="fas fa-cog"></i> Settings</a>
	        <a class="nav-link" href="#" data-page="help.jsp"><i class="fas fa-question-circle"></i> Help</a>
	    </nav>
	</div>


		    <!-- Main Content Area -->
		<div class="main-content">
		    <iframe id="mainFrame" src="dashboard.jsp" frameborder="0" style="width: 100%; height: 100vh;"></iframe>
		</div>

	    <script>
	    const links = document.querySelectorAll('.sidebar .nav-link');
	    const iframe = document.getElementById('mainFrame');
	
	    links.forEach(link => {
	        link.addEventListener('click', function(e) {
	            e.preventDefault();
	            const page = this.getAttribute('data-page');
	            iframe.src = page;
	
	            // Optional: Highlight active tab
	            links.forEach(l => l.classList.remove('active'));
	            this.classList.add('active');
	        });
	    });
	</script>
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
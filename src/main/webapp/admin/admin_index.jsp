<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Admin" %>
<%
    model.Admin admin = (model.Admin) request.getAttribute("Admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - E-Shop</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #f8fafc 0%, #e0e7ef 100%);
            min-height: 100vh;
        }
        .sidebar {
            width: 240px;
            height: 100vh;
            background: #2E2E2E;
            border-radius: 24px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.06);
            position: fixed;
            left: 24px;
            top: 24px;
            padding: 24px 0;
            display: flex;
            flex-direction: column;
            z-index: 10;
        }
        .sidebar .logo {
            font-size: 1.7rem;
            font-weight: bold;
            color: #2a1b3d;
            margin-bottom: 32px;
            text-align: center;
            letter-spacing: 1px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            flex: 1;
        }
        .sidebar ul li {
            margin-bottom: 8px;
        }
        .sidebar ul li a {
            display: flex;
            align-items: center;
            padding: 12px 32px;
            color: #2a1b3d;
            border-radius: 12px;
            font-size: 1.05rem;
            text-decoration: none;
            transition: background 0.2s, color 0.2s;
        }
        .sidebar ul li a i {
            margin-right: 16px;
            font-size: 1.2rem;
        }
        .sidebar ul li a.active,
        .sidebar ul li a:hover {
            background: #f3f6fa;
            color: #2563eb;
            font-weight: 600;
        }
        .main-content {
            margin-left: 288px;
            padding: 40px 40px 40px 0;
        }
        .main-card {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.06);
            padding: 32px;
            min-height: 80vh;
        }
	.sidebar-toggle {
	    display: none;
	    position: fixed;
	    top: 24px;
	    right: 24px; /* Move to right */
	    z-index: 1001;
	    background: #2563eb;
	    color: #fff;
	    border: none;
	    border-radius: 50%;
	    width: 48px;
	    height: 48px;
	    font-size: 1.5rem;
	    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	    cursor: pointer;
	}
	
	.sidebar-backdrop {
	    display: none;
	    position: fixed;
	    top: 0; left: 0; right: 0; bottom: 0;
	    background: rgba(0,0,0,0.25);
	    z-index: 1000;
	}
	
	@media (max-width: 900px) {
	    .sidebar {
	        left: 0;
	        top: 0;
	        width: 80vw;
	        max-width: 320px;
	        height: 100vh;
	        border-radius: 0 24px 24px 0;
	        transform: translateX(-110%);
	        transition: transform 0.3s;
	        position: fixed;
	        box-shadow: 2px 0 16px rgba(0,0,0,0.08);
	        z-index: 1002;
	    }
	    .sidebar.open {
	        transform: translateX(0);
	    }
	    .sidebar-toggle {
	        display: block;
	    }
	    .sidebar-backdrop.active {
	        display: block;
	    }
	    .main-content {
	        margin-left: 0;
	        padding: 24px 8px;
	    }
	    .main-card {
	        padding: 16px;
	        min-height: 60vh;
	    }
	    body.sidebar-open {
	        overflow: hidden;
	    }
	}
 </style>
</head>
<body>
	<div class="sidebar-backdrop" id="sidebarBackdrop"></div>
	<button class="sidebar-toggle" id="sidebarToggle" aria-label="Open sidebar">
	    <i class="fas fa-bars"></i>
	</button>
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="logo">E-Shop Admin</div>
        <ul>
            <li><a href="#" class="active" data-page="dashboard.jsp"><i class="fas fa-gauge"></i> Dashboard</a></li>
            <li><a href="#" data-page="orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></li>
            <li><a href="#" data-page="products.jsp"><i class="fas fa-box"></i> Products</a></li>
            <li><a href="#" data-page="customers.jsp"><i class="fas fa-users"></i> Customers</a></li>
            <li><a href="#" data-page="Manage_all_admins"><i class="fas fa-user-shield"></i> Admins</a></li>
            <li><a href="#" data-page="billing.jsp"><i class="fas fa-chart-line"></i> Billing Analytics</a></li>
            <li><a href="#" data-page="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
            <li><a href="#" data-page="help.jsp"><i class="fas fa-question-circle"></i> Help</a></li>
        </ul>
    </nav>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="main-card">
            <iframe id="mainFrame" src="dashboard.jsp" frameborder="0" style="width: 100%; height: 70vh; border: none; border-radius: 16px;"></iframe>
        </div>
    </div>

<script>
    const links = document.querySelectorAll('.sidebar ul li a');
    const iframe = document.getElementById('mainFrame');
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.querySelector('.sidebar');
    const sidebarBackdrop = document.getElementById('sidebarBackdrop');

    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const page = this.getAttribute('data-page');
            iframe.src = page;
            links.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
            // Close sidebar on mobile after click
            sidebar.classList.remove('open');
            sidebarBackdrop.classList.remove('active');
            document.body.classList.remove('sidebar-open');
        });
    });

    // Sidebar toggle for mobile
    sidebarToggle.addEventListener('click', function(e) {
        e.stopPropagation();
        sidebar.classList.toggle('open');
        sidebarBackdrop.classList.toggle('active');
        document.body.classList.toggle('sidebar-open');
    });

    // Close sidebar when clicking backdrop
    sidebarBackdrop.addEventListener('click', function() {
        sidebar.classList.remove('open');
        sidebarBackdrop.classList.remove('active');
        document.body.classList.remove('sidebar-open');
    });

    // Optional: close sidebar when resizing to desktop
    window.addEventListener('resize', function() {
        if (window.innerWidth > 900) {
            sidebar.classList.remove('open');
            sidebarBackdrop.classList.remove('active');
            document.body.classList.remove('sidebar-open');
        }
    });
</script>
</body>
</html>
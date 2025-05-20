<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Draws - Gamuda.lk</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="payment.css">
</head>
<body>

<!-- Sidebar Navigation -->
<div class="sidebar">
    <div class="logo">
        <h1>Gamuda.lk</h1>
        <p>buy your daily goods</p>
    </div>

    <div class="nav-menu">
        <div><h2>Account</h2></div>
	    <a href="<%=request.getContextPath()%>/Profile" class="nav-item"><i class="fas fa-chart-bar"></i><span>Account details</span></div></a>
        <a href="draws.jsp" class="nav-item active"><i class="fas fa-ticket-alt"></i><span>Draws</span></a>
        <a href="readCard"><div class="nav-item"><i class="fas fa-credit-card"></i><span>Payments</span></div></a>
        <a href="userHistory.jsp" class="nav-item"><i class="fas fa-history"></i><span>History</span></a>
        <a href="important.jsp" class="nav-item"><i class="fas fa-exclamation-circle"></i><span>Imp</span></a>
        <a href="cards.jsp" class="nav-item"><i class="far fa-credit-card"></i><span>Cards</span></a>
        <div class="nav-item"><i class="fas fa-plus-circle"></i><span>Add new address</span></div>
             <a href="<%=request.getContextPath()%>/index.jsp">
            <div class="nav-item">
                <i class="fas fa-chevron-left"></i>
                <span>Previous</span>
            </div></a>    
            </div>

<!-- Main Content Area -->
<div class="main-content">
    <div class="header">
        <div class="page-title">
            <h2>Draws</h2>
            <p>View ongoing and past draws</p>
        </div>
        <div class="user-profile">
            <img src="https://via.placeholder.com/40" alt="User" style="border-radius: 50%; margin-right: 10px;">
            <span>John Doe</span>
        </div>
    </div>

    <!-- Draw Listings -->
    <div class="section">
        <div class="section-header">
            <h3 class="section-title">Available Draws</h3>
        </div>

        <div class="draws-list">
            <div class="draw-item">
                <h4>Monthly Mega Draw</h4>
                <p>Prize: LKR 1,000,000</p>
                <p>Draw Date: 30th May 2025</p>
                <button class="btn btn-primary">Enter Now</button>
            </div>

            <div class="draw-item">
                <h4>Weekly Lucky Shopper</h4>
                <p>Prize: Free groceries for a week</p>
                <p>Draw Date: Every Friday</p>
                <button class="btn btn-primary">Enter Now</button>
            </div>

            <div class="draw-item">
                <h4>Gamuda Anniversary Special</h4>
                <p>Prize: Brand new iPhone</p>
                <p>Draw Date: 15th June 2025</p>
                <button class="btn btn-primary">Enter Now</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>

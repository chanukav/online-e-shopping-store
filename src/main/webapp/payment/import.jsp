<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Important Info</title>
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
	    <a href="<%=request.getContextPath()%>/Profile" class="nav-item"><i class="fas fa-chart-bar"></i><span>Account details</span></div></a>        <a href="draws.jsp" class="nav-item"><i class="fas fa-ticket-alt"></i><span>Draws</span></a>
        <a href="readCard" class="nav-item"><i class="fas fa-credit-card"></i><span>Payments</span></a>
        <a href="userHistory.jsp" class="nav-item"><i class="fas fa-history"></i><span>History</span></a>
        <a href="important.jsp" class="nav-item active"><i class="fas fa-exclamation-circle"></i><span>Important</span></a>
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
            <h2>Important Info</h2>
            <p>Things you need to know about using Gamuda.lk</p>
        </div>
        <div class="user-profile">
            <img src="https://via.placeholder.com/40" alt="User" style="border-radius: 50%; margin-right: 10px;">
            <span>John Doe</span>
        </div>
    </div>

    <!-- Important Content -->
    <div class="section">
        <div class="section-header">
            <h3 class="section-title">Security & Guidelines</h3>
        </div>

        <div class="info-box">
            <h4>🔐 Secure Transactions</h4>
            <p>All your payment data is encrypted and handled securely using Gamu.pay’s certified payment gateway.</p>
        </div>

        <div class="info-box">
            <h4>💳 Card Management</h4>
            <p>Remember to keep your card details up to date and remove any expired or unused cards from your account.</p>
        </div>

        <div class="info-box">
            <h4>📅 Expiry Reminders</h4>
            <p>We will notify you when any of your saved cards are about to expire so you can update them in advance.</p>
        </div>

        <div class="info-box">
            <h4>📞 Need Help?</h4>
            <p>Contact our 24/7 support via live chat or email support@gamuda.lk for any questions or security concerns.</p>
        </div>
    </div>
</div>

</body>
</html>

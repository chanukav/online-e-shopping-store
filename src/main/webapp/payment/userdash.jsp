<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="payment.css">
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="logo">
            <h1>Gamuda.lk</h1>
            <p>buy your daily goods</p>
        </div>
        
        <div class="nav-menu">
            <div>
               <h2>Account</h2>
                
            </div>
            <a href="<%=request.getContextPath()%>/Profile">
			    <div class="nav-item">
			        <i class="fas fa-chart-bar"></i>
			        <span>Account details</span>
			    </div>
			</a>
	        <a href="draws.jsp" class="nav-item">
	        <i class="fas fa-ticket-alt">
	        </i><span>Draws</span>
	        </a>
            <a href="readCard" class="nav-item">
                <i class="fas fa-credit-card"></i>
                <span>Payment</span>
            </a>
            <a href="userHistory.jsp" class="nav-item">
                <i class="fas fa-history"></i>
                <span>History</span>
            </a>
            <a href="import.jsp" class="nav-item">
                <i class="fas fa-exclamation-circle"></i>
                <span>Important</span>
            </a> 
                    <a href="cards.jsp" class="nav-item"><i class="far fa-credit-card"></i><span>Cards</span></a>
                  
            <div class="nav-item">
                <i class="fas fa-plus-circle"></i>
                <span>Add new address</span>
            </div>
            <a href="<%=request.getContextPath()%>/index.jsp">
            <div class="nav-item">
                <i class="fas fa-chevron-left"></i>
                <span>Previous</span>
            </div></a>
        </div>
    </div>

 <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <div class="page-title">
                <h2>Payments</h2>
                <p>Manage your payment methods and history</p>
            </div>
            <div class="user-profile">
                <img src="https://via.placeholder.com/40" alt="User" style="border-radius: 50%; margin-right: 10px;">
                <span>John Doe</span>
            </div>
        </div>
        
        <!-- image area -->
        
     <div style="text-align: center; margin-top: 40px;">
    <img src="../images/paybg.png" alt="Online Store" style="max-width: 100%; height: auto;">
</div>
        
        
        
  </div>
  </body>
  </html>      
        
        
        
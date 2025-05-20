<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cards</title>
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
        <a href="draws.jsp" class="nav-item"><i class="fas fa-ticket-alt"></i><span>Draws</span></a>
        <a href="readCard"><div class="nav-item"><i class="fas fa-credit-card"></i><span>Payments</span></div></a>
        <a href="userHistory.jsp" class="nav-item"><i class="fas fa-history"></i><span>History</span></a>
        <a href="important.jsp" class="nav-item"><i class="fas fa-exclamation-circle"></i><span>Imp</span></a>
        <a href="cards.jsp" class="nav-item active"><i class="far fa-credit-card"></i><span>Cards</span></a>
        <div class="nav-item"><i class="fas fa-plus-circle"></i><span>Add new address</span></div>
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
            <h2>Your Cards</h2>
            <p>View and manage your saved cards here</p>
        </div>
        <div class="user-profile">
            <img src="https://via.placeholder.com/40" alt="User" style="border-radius: 50%; margin-right: 10px;">
            <span>John Doe</span>
        </div>
    </div>

    <!-- Cards Section -->
    <div class="section">
        <div class="section-header">
            <h3 class="section-title">Saved Cards</h3>
            <a href="paymentC.jsp">
                <button class="btn btn-primary">
                    <i class="fas fa-plus"></i>
                    Add New Card
                </button>
            </a>
        </div>

        <div class="cards-grid">
            <c:forEach var="pay" items="${cards}">
                <div class="card-item">
                    <img src="https://logo.clearbit.com/visa.com" alt="Card Type" class="card-type">
                    <div class="card-number">${pay.cardNumber}</div>
                    <div class="card-details">
                        <span>${pay.cardName}</span>
                        <span>${pay.expMonth}/${pay.expYear}</span>
                    </div>
                    <div class="card-actions">
                        <c:url value="paymentU.jsp" var="payU">
                            <c:param name="num" value="${pay.cardNumber}" />
                            <c:param name="name" value="${pay.cardName}" />
                            <c:param name="month" value="${pay.expMonth}" />
                            <c:param name="year" value="${pay.expYear}" />
                            <c:param name="cv" value="${pay.cvv}" />
                        </c:url>
                        <a href="${payU}" class="edit-link">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <form method="post" action="deleteCard" style="display:inline;">
                            <input type="hidden" name="cardNumber" value="${pay.cardNumber}" />
                            <button type="submit" class="delete-btn">
                                <i class="fas fa-trash"></i> Remove
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="payment.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gamada.lk - manage payment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
    <div class="container">
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
                <a href="<%=request.getContextPath()%>/Profile" class="nav-item"><i class="fas fa-chart-bar"></i><span>Account details</span></div></a>
		        <a href="draws.jsp" class="nav-item">
		        <i class="fas fa-ticket-alt"></i><span>Draws</span>
		        </a>
                <a href="paymentR.jsp" class="nav-item">
                    <i class="fas fa-credit-card"></i>
                    <span>Payments</span>
                </a>
                <a href="userHistory.jsp" class="nav-item active">
                    <i class="fas fa-history"></i>
                    <span>History</span>
                </a>
                <a href="import.jsp" class="nav-item">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>Important</span>
                </a>
                
             <a href="cards.jsp" class="nav-item"><i class="far fa-credit-card"></i><span>Cards</span></a>

                <div class="nav-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Add Address</span>
                </div>
                            <a href="<%=request.getContextPath()%>/index.jsp">
            <div class="nav-item">
                <i class="fas fa-chevron-left"></i>
                <span>Previous</span>
            </div></a>
            </div>
        </div>
        
        <!-- Main Content Area - Centered -->
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
            
            <!-- Payment History Section -->
            <div class="section">
                <div class="section-header">
                    <h3 class="section-title">Payment History</h3>
                    <div>
                        <select style="padding: 8px; border-radius: 6px; border: 1px solid var(--border);">
                            <option>Last 30 days</option>
                            <option>Last 3 months</option>
                            <option>Last year</option>
                        </select>
                    </div>
                </div>
                
                <table class="payment-table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>May 15, 2025</td>
                            <td>Premium Subscription</td>
                            <td>$9.99</td>
                            <td><span class="payment-status status-success">Completed</span></td>
                        </tr>
                        <tr>
                            <td>May 10, 2025</td>
                            <td>Online Purchase</td>
                            <td>$24.50</td>
                            <td><span class="payment-status status-success">Completed</span></td>
                        </tr>
                        <tr>
                            <td>May 5, 2025</td>
                            <td>Card Top-up</td>
                            <td>$50.00</td>
                            <td><span class="payment-status status-pending">Pending</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
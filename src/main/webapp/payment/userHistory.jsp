<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="payment.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gamada.lk - manage payment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #f85506;
            --secondary: #8C54FF;
            --text: #333333;
            --text-light: #666666;
            --bg: #f5f5f5;
            --card-bg: #ffffff;
            --border: #e0e0e0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--bg);
            color: var(--text);
        }
        
        .container {
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 220px;
            background-color: var(--primary);
            padding: 20px 0;
            height: 100vh;
            position: fixed;
        }
        
        .logo {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            margin-bottom: 20px;
        }
        
        .logo h1 {
            font-size: 22px;
            font-weight: 700;
            margin: 0;
            color: white;
        }
        
        .logo p {
            font-size: 12px;
            color: white;
            margin: 5px 0 0;
            opacity: 0.8;
        }
        
        .nav-menu {
            padding: 0 10px;
        }
        
        .nav-menu h2 {
            color: white;
            padding: 12px 15px;
            margin: 0 0 10px 0;
            font-size: 16px;
        }
        
        .nav-item {
            padding: 12px 15px;
            margin-bottom: 5px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            cursor: pointer;
            color: white;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.15);
        }
        
        .nav-item i {
            margin-right: 12px;
            font-size: 16px;
            width: 20px;
            text-align: center;
        }
        
        /* Main Content Styles - Centered */
        .main-content {
            flex: 1;
            margin-left: 220px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            padding-left: 240px; /* sidebar width + 20px */
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .page-title h2 {
            font-size: 24px;
            margin: 0;
        }
        
        .page-title p {
            color: var(--text-light);
            margin: 5px 0 0;
            font-size: 14px;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
        }
        
        /* Section Styles */
        .section {
            background-color: var(--card-bg);
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
        }
        
        /* Table Styles */
        .payment-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .payment-table th {
            text-align: left;
            padding: 12px 15px;
            color: var(--text-light);
            font-weight: 500;
            border-bottom: 1px solid var(--border);
        }
        
        .payment-table td {
            padding: 15px;
            border-bottom: 1px solid var(--border);
        }
        
        .payment-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status-success {
            background-color: rgba(0, 171, 85, 0.1);
            color: var(--success);
        }
        
        .status-pending {
            background-color: rgba(255, 171, 0, 0.1);
            color: #FFAB00;
        }
    </style>
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
                <div class="nav-item">
                    <i class="fas fa-chart-bar"></i>
                    <span>Overview</span>
                </div>
                <div class="nav-item">
                    <i class="fas fa-ticket-alt"></i>
                    <span>Draws</span>
                </div>
                <a href="paymentR.jsp" class="nav-item">
                    <i class="fas fa-credit-card"></i>
                    <span>Payments</span>
                </a>
                <a href="userHistory.jsp" class="nav-item">
                    <i class="fas fa-history"></i>
                    <span>History</span>
                </a>
                <div class="nav-item">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>Important</span>
                </div>
                <div class="nav-item">
                    <i class="far fa-credit-card"></i>
                    <span>Cards</span>
                </div>
                <div class="nav-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Add Address</span>
                </div>
                <div class="nav-item">
                    <i class="fas fa-chevron-left"></i>
                    <span>Previous</span>
                </div>
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
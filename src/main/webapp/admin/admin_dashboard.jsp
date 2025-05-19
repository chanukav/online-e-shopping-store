<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;
            margin: 10px;
            display: inline-block;
            width: 200px;
            text-align: center;
        }
        .card h3 {
            margin: 0 0 10px;
            color: #333;
        }
        .card p {
            font-size: 24px;
            color: #007bff;
            margin: 0;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            int userCount = 0, adminCount = 0, orderCount = 0, productCount = 0;
            
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "your_username", "your_password");
                stmt = conn.createStatement();
                
                // Count total users (excluding admins)
                rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE role = 'user'");
                if (rs.next()) {
                    userCount = rs.getInt(1);
                }
                
                // Count admins
                rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE role = 'admin'");
                if (rs.next()) {
                    adminCount = rs.getInt(1);
                }
                
                // Count orders
                rs = stmt.executeQuery("SELECT COUNT(*) FROM orders");
                if (rs.next()) {
                    orderCount = rs.getInt(1);
                }
                
                // Count products
                rs = stmt.executeQuery("SELECT COUNT(*) FROM products");
                if (rs.next()) {
                    productCount = rs.getInt(1);
                }
                
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        
        <div class="card">
            <h3>Total Users</h3>
            <p><%= userCount %></p>
        </div>
        <div class="card">
            <h3>Total Admins</h3>
            <p><%= adminCount %></p>
        </div>
        <div class="card">
            <h3>Total Orders</h3>
            <p><%= orderCount %></p>
        </div>
        <div class="card">
            <h3>Total Products</h3>
            <p><%= productCount %></p>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.CartItem, java.util.List" %>
<%@ page import="model.customer" %>
<%
    customer cus = (customer) session.getAttribute("customer");
    if (cus == null) {
        response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    
    <link rel="icon" type="image/svg+xml" href="<%= request.getContextPath() %>/image/favicon.svg">
	<link rel="shortcut icon" href="<%= request.getContextPath() %>/image/favicon.ico">
	<link rel="apple-touch-icon" sizes="180x180" href="<%= request.getContextPath() %>/image/apple-touch-icon.png">
	<link rel="manifest" href="<%= request.getContextPath() %>/image/site.webmanifest">
    
    <style>
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #e0e7ff 0%, #f5f7fa 100%);
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin-top: 3rem;
        }
        h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 2rem;
            text-align: center;
        }
        .cart-table {
            background: #fcffff; /* White background */
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .cart-table:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        }
        .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        .table th {
            color: #333;
            font-weight: 600;
            border-bottom: 2px solid #fe980f; /* Yellow border */
        }
        .table td {
            vertical-align: middle;
            padding: 1rem;
            border-bottom: 1px solid #fceaca; /* Gray border */
        }
        .btn-continue {
            background: linear-gradient(90deg, #fe980f, #f85506); /* Yellow to Orange */
            color: #fcffff; /* White text */
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-continue:hover {
            background: linear-gradient(90deg, #e61616, #f85506); /* Red to Orange */
            transform: translateY(-2px);
        }
        .btn-remove {
            background: linear-gradient(90deg, #e61616, #f85506); /* Red to Orange */
            color: #fcffff; /* White text */
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn-remove:hover {
            background: linear-gradient(90deg, #c82333, #e61616); /* Darker red shades */
            transform: translateY(-2px);
        }
        .btn-quantity {
            background: linear-gradient(90deg, #fe980f, #f85506); /* Yellow to Orange */
            color: #fcffff; /* White text */
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 1rem;
            transition: background 0.3s ease;
        }
        .btn-quantity:hover {
            background: linear-gradient(90deg, #e61616, #f85506); /* Red to Orange */
        }
        .btn-quantity:disabled {
            background: #fceaca; /* Gray */
            color: #999;
            cursor: not-allowed;
        }
        .quantity-input {
            width: 70px;
            text-align: center;
            border: 1px solid #fe980f; /* Yellow border */
            border-radius: 6px;
            background: #fcffff; /* White background */
            padding: 6px;
            font-size: 1rem;
            color: #333;
        }
        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: none;
            background: #fcffff; /* White background */
            color: #333;
            border: 1px solid #fe980f; /* Yellow border */
            border-radius: 8px;
            padding: 1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.5s ease forwards;
        }
        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        .alert.fade-out {
            animation: slideOut 0.5s ease forwards;
        }
        @keyframes slideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }
        @media (max-width: 768px) {
            .cart-table {
                padding: 1rem;
            }
            .table td, .table th {
                font-size: 0.9rem;
                padding: 0.75rem;
            }
            .quantity-input {
                width: 50px;
            }
            .btn-continue, .btn-remove, .btn-quantity {
                padding: 8px 12px;
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Your Cart</h2>
        <!-- Display success message -->
        <%
            String cartMessage = (String) session.getAttribute("cartMessage");
            if (cartMessage != null) {
        %>
        <div class="alert alert-success" id="cartMessage">
            <%= cartMessage %>
        </div>
        <%
            session.removeAttribute("cartMessage");
            }
        %>
        <div class="cart-table">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                        double cartTotal = 0.0;
                        if (cart != null && !cart.isEmpty()) {
                            for (CartItem item : cart) {
                                double itemTotal = item.getProduct().getPprice() * item.getQuantity();
                                cartTotal += itemTotal;
                    %>
                    <tr>
                        <td><%= item.getProduct().getProdName() %></td>
                        <td>LKR. <%= String.format("%.2f", item.getProduct().getPprice()) %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/UpdateCartQuantity" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                <input type="hidden" name="action" value="decrease">
                                <button type="submit" class="btn btn-quantity" <%= item.getQuantity() == 1 ? "disabled" : "" %>>−</button>
                            </form>
                            <input type="text" class="quantity-input" value="<%= item.getQuantity() %>" readonly>
                            <form action="<%= request.getContextPath() %>/UpdateCartQuantity" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                <input type="hidden" name="action" value="increase">
                                <button type="submit" class="btn btn-quantity">+</button>
                            </form>
                        </td>
                        <td>LKR. <%= String.format("%.2f", itemTotal) %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/RemoveFromCart" method="post">
                                <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                <button type="submit" class="btn btn-remove">
                                    <i class="fas fa-trash-alt me-2"></i>Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">Your cart is empty</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                if (cart != null && !cart.isEmpty()) {
            %>
            <div class="text-end mb-3">
                <h5>Cart Total: LKR. <%= String.format("%.2f", cartTotal) %></h5>
            </div>
            <%
                }
            %>
            <div class="text-end">
                <a href="<%= request.getContextPath() %>/ReadAllProduct?source=user" class="btn btn-continue">
                    <i class="fas fa-shopping-bag me-2"></i>Continue Shopping
                </a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show and auto-hide success message
        const message = document.getElementById('cartMessage');
        if (message) {
            message.style.display = 'block';
            setTimeout(() => {
                message.classList.add('fade-out');
                setTimeout(() => message.style.display = 'none', 500);
            }, 3000);
        }
    </script>
</body>
</html>
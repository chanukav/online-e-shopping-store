<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.CartItem, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fa;
        }
        .cart-table {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-continue {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fcffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
        }
        .btn-continue:hover {
            background: linear-gradient(90deg, #e61616, #f85506);
        }
        .btn-remove {
            background: linear-gradient(90deg, #dc3545, #c82333);
            color: #fcffff;
            border: none;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 0.9rem;
        }
        .btn-remove:hover {
            background: linear-gradient(90deg, #c82333, #b21f2d);
            transform: translateY(-2px);
        }
        .btn-quantity {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fcffff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 1rem;
        }
        .btn-quantity:hover {
            background: linear-gradient(90deg, #e61616, #f85506);
        }
        .quantity-input {
            width: 60px;
            text-align: center;
            border: 1px solid #fe980f;
            border-radius: 5px;
            margin: 0 5px;
        }
        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: none;
            transition: opacity 0.5s ease;
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
                        <td>$<%= String.format("%.2f", item.getProduct().getPprice()) %></td>
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
                        <td>$<%= String.format("%.2f", itemTotal) %></td>
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
                <h5>Cart Total: $<%= String.format("%.2f", cartTotal) %></h5>
            </div>
            <%
                }
            %>
            <div class="text-end">
                <a href="<%= request.getContextPath() %>/products.jsp" class="btn btn-continue">
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
                message.style.opacity = '0';
                setTimeout(() => message.style.display = 'none', 500);
            }, 3000);
        }
    </script>
</body>
</html>
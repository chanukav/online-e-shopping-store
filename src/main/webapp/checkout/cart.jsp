<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.CartItem, java.util.List" %>
<%@ page import="model.customer" %>
<%
    customer cus = (customer) session.getAttribute("customer");
    if (cus == null) {
        response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        return;
    }
    
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double cartTotal = 0.0;
    int itemCount = 0;
    if (cart != null) {
        for (CartItem item : cart) {
            cartTotal += (item.getProduct().getPprice() * item.getQuantity());
            itemCount += item.getQuantity();
        }
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
    
    <style>
        :root {
            --brand-color: #f85506; /* Your specific orange */
            --brand-hover: #d64400; /* Darker orange for hover */
            --bg-tint: #fff8f5;     /* Very subtle orange tint for background */
            --text-dark: #1a1a1a;
            --text-muted: #737373;
            --card-radius: 16px;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-tint);
            color: var(--text-dark);
            padding-bottom: 60px;
        }

        .page-header {
            margin-top: 3rem;
            margin-bottom: 2rem;
        }
        .page-title {
            font-weight: 800;
            letter-spacing: -0.5px;
            color: var(--text-dark);
        }

        /* --- Cards with subtle accent --- */
        .cart-card, .summary-card {
            background: white;
            border-radius: var(--card-radius);
            border: none;
            /* Soft shadow */
            box-shadow: 0 10px 40px rgba(248, 85, 6, 0.05); 
            overflow: hidden;
            margin-bottom: 20px;
            /* Top accent line in your color */
            border-top: 4px solid var(--brand-color);
        }

        /* --- Table Styling --- */
        .table { margin-bottom: 0; }
        
        .table thead th {
            background-color: white;
            border-bottom: 2px solid #f0f0f0;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            padding: 1.5rem;
        }
        
        .table td {
            vertical-align: middle;
            padding: 1.5rem;
            border-bottom: 1px solid #f5f5f5;
        }

        /* --- Product Info --- */
        .product-wrapper {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .img-placeholder {
            width: 64px;
            height: 64px;
            background: var(--bg-tint);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--brand-color);
            font-size: 1.5rem;
        }
        .prod-title {
            font-weight: 700;
            margin-bottom: 4px;
            color: var(--text-dark);
        }
        .prod-price {
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        /* --- Embedded Quantity Pill --- */
        .qty-pill {
            display: inline-flex;
            align-items: center;
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 50px;
            padding: 2px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.03);
        }
        
        .btn-qty {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            border: none;
            background: transparent;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            font-size: 0.8rem;
        }
        
        .btn-qty:hover:not(:disabled) {
            background: var(--bg-tint);
            color: var(--brand-color);
        }
        
        .btn-qty:disabled {
            opacity: 0.3;
            cursor: not-allowed;
        }
        
        .qty-input {
            width: 36px;
            text-align: center;
            border: none;
            background: transparent;
            font-weight: 600;
            font-size: 0.95rem;
            color: var(--text-dark);
        }

        /* --- Action Buttons --- */
        .btn-trash {
            border: none;
            background: transparent;
            color: #d1d1d1;
            transition: all 0.2s;
            padding: 8px;
            border-radius: 8px;
        }
        .btn-trash:hover {
            background: #fff0f0;
            color: #ff4d4d;
        }

        /* --- Summary Section --- */
        .summary-card { padding: 2rem; }
        .summary-header {
            font-weight: 800;
            margin-bottom: 1.5rem;
            font-size: 1.25rem;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            color: var(--text-muted);
            font-size: 0.95rem;
        }
        
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 2px dashed #eee;
            font-weight: 800;
            font-size: 1.35rem;
            color: var(--brand-color); /* Total in Orange */
        }

        /* --- Main Orange Button --- */
        .btn-primary-orange {
            display: block;
            width: 100%;
            padding: 16px;
            background-color: var(--brand-color);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            margin-top: 1.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(248, 85, 6, 0.3); /* Glowing orange shadow */
        }
        .btn-primary-orange:hover {
            background-color: var(--brand-hover);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(248, 85, 6, 0.4);
            color: white;
        }

        /* --- Secondary Link --- */
        .btn-link-secondary {
            display: block;
            text-align: center;
            margin-top: 1rem;
            color: var(--text-muted);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        .btn-link-secondary:hover {
            color: var(--brand-color);
            text-decoration: underline;
        }

        /* --- Empty State --- */
        .empty-cart-box {
            text-align: center;
            padding: 5rem 2rem;
            background: white;
            border-radius: var(--card-radius);
            box-shadow: 0 10px 40px rgba(248, 85, 6, 0.05);
        }
        .empty-icon {
            font-size: 4rem;
            color: #ffe0d1; /* Very light orange icon */
            margin-bottom: 1.5rem;
        }

        /* --- Alert --- */
        .alert-float {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
            border-left: 5px solid var(--brand-color);
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            border-radius: 8px;
            display: none;
            animation: slideIn 0.4s ease-out;
        }
        @keyframes slideIn {
            from { transform: translateX(120%); }
            to { transform: translateX(0); }
        }
    </style>
</head>
<body>

    <div class="container page-header">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h2 class="page-title">Shopping Cart</h2>
            <% if (itemCount > 0) { %>
                <span class="text-muted"><%= itemCount %> items</span>
            <% } %>
        </div>

        <% String cartMessage = (String) session.getAttribute("cartMessage"); %>
        <div class="alert alert-float p-3" id="cartMessage">
            <div class="d-flex align-items-center">
                <i class="fas fa-check-circle me-3 fs-4" style="color: var(--brand-color);"></i>
                <div>
                    <h6 class="mb-0 fw-bold">Updated</h6>
                    <small class="text-muted"><%= cartMessage != null ? cartMessage : "" %></small>
                </div>
            </div>
        </div>
        <% if (cartMessage != null) session.removeAttribute("cartMessage"); %>


        <% if (cart != null && !cart.isEmpty()) { %>
        <div class="row g-4">
            
            <div class="col-lg-8">
                <div class="cart-card">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th width="45%">Product</th>
                                    <th width="20%" class="text-center">Qty</th>
                                    <th width="20%" class="text-end">Total</th>
                                    <th width="15%" class="text-center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (CartItem item : cart) { 
                                    double itemTotal = item.getProduct().getPprice() * item.getQuantity(); 
                                %>
                                <tr>
                                    <td>
                                        <div class="product-wrapper">
                                            <div class="img-placeholder">
                                                <i class="fas fa-shopping-bag"></i>
                                            </div>
                                            <div>
                                                <div class="prod-title"><%= item.getProduct().getProdName() %></div>
                                                <div class="prod-price">LKR. <%= String.format("%.2f", item.getProduct().getPprice()) %></div>
                                            </div>
                                        </div>
                                    </td>
                                    
                                    <td class="text-center">
                                        <div class="qty-pill">
                                            <form action="<%= request.getContextPath() %>/UpdateCartQuantity" method="post" class="d-inline">
                                                <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                                <input type="hidden" name="action" value="decrease">
                                                <button type="submit" class="btn-qty" <%= item.getQuantity() == 1 ? "disabled" : "" %>>
                                                    <i class="fas fa-minus small"></i>
                                                </button>
                                            </form>
                                            
                                            <input type="text" class="qty-input" value="<%= item.getQuantity() %>" readonly>
                                            
                                            <form action="<%= request.getContextPath() %>/UpdateCartQuantity" method="post" class="d-inline">
                                                <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                                <input type="hidden" name="action" value="increase">
                                                <button type="submit" class="btn-qty">
                                                    <i class="fas fa-plus small"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                    
                                    <td class="text-end fw-bold">
                                        LKR. <%= String.format("%.2f", itemTotal) %>
                                    </td>
                                    
                                    <td class="text-center">
                                        <form action="<%= request.getContextPath() %>/RemoveFromCart" method="post">
                                            <input type="hidden" name="productId" value="<%= item.getProduct().getPid() %>">
                                            <button type="submit" class="btn-trash" title="Remove Item">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="summary-card">
                    <h5 class="summary-header">Order Summary</h5>
                    
                    <div class="summary-item">
                        <span>Subtotal</span>
                        <span>LKR. <%= String.format("%.2f", cartTotal) %></span>
                    </div>
                    <div class="summary-item">
                        <span>Shipping Estimate</span>
                        <span style="color: var(--brand-color);">Calculated next step</span>
                    </div>
                    
                    <div class="total-row">
                        <span>Total</span>
                        <span>LKR. <%= String.format("%.2f", cartTotal) %></span>
                    </div>
                    
                    <a href="<%= request.getContextPath() %>/ReadAllProduct?source=user" class="btn btn-primary-orange">
                         Proceed to Checkout <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                    
                    <a href="<%= request.getContextPath() %>/ReadAllProduct?source=user" class="btn-link-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Continue Shopping
                    </a>
                </div>
            </div>
        </div>
        
        <% } else { %>
            
            <div class="empty-cart-box">
                <i class="fas fa-shopping-basket empty-icon"></i>
                <h3>Your cart is empty</h3>
                <p class="text-muted mb-4">Looks like you haven't added anything to your cart yet.</p>
                <a href="<%= request.getContextPath() %>/ReadAllProduct?source=user" class="btn btn-primary-orange" style="max-width: 250px; margin: 0 auto;">
                    Start Shopping
                </a>
            </div>
            
        <% } %>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // JS to handle the alert fading
        const messageDiv = document.getElementById('cartMessage');
        const hasMessage = "<%= cartMessage != null %>" === "true";
        
        if (hasMessage && messageDiv) {
            messageDiv.style.display = 'block';
            setTimeout(() => {
                messageDiv.style.opacity = '0';
                messageDiv.style.transition = 'opacity 0.5s ease';
                setTimeout(() => messageDiv.remove(), 500);
            }, 3000);
        }
    </script>
</body>
</html>
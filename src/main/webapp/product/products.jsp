<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fa;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background: #fff;
            transition: transform 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-add-to-cart {
            background: linear-gradient(90deg, #fe980f, #f85506);
            color: #fcffff;
            border: none;
            padding: 10px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-add-to-cart:hover {
            background: linear-gradient(90deg, #e61616, #f85506);
            transform: translateY(-2px);
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
        <h2 class="text-center mb-4">Our Products</h2>
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
        <div class="row">
            <!-- Sample Product -->
            <div class="col-md-4 mb-4">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/images/sample-product.jpg" class="card-img-top" alt="Product">
                    <div class="card-body">
                        <h5 class="card-title">Sample Product</h5>
                        <p class="card-text">Price: $29.99</p>
                        <p class="card-text">Brand: Sample Brand</p>
                        <form action="<%= request.getContextPath() %>/" method="post">
                            <input type="hidden" name="productId" value="1">
                            <input type="hidden" name="productName" value="Sample Product">
                            <input type="hidden" name="productPrice" value="29.99">
                            <input type="number" name="quantity" value="1" min="1" class="form-control mb-2" style="width: 100px;">
                            <button type="submit" class="btn btn-add-to-cart">
                                <i class="fas fa-cart-plus me-2"></i>Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Add more products dynamically -->
        </div>
        <div class="text-center">
            <a href="<%= request.getContextPath() %>/checkout/cart.jsp" class="btn btn-primary">View Cart</a>
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
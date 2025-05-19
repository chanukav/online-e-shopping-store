<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.prodName} - GAMUDA.LK</title>
    <style>
    
    /* General Styles */
:root {
    --primary: #ff6b00;
    --secondary: #333;
    --light: #f8f9fa;
    --dark: #212529;
    --gray: #6c757d;
    --success: #28a745;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f5f5f5;
    color: var(--dark);
    line-height: 1.6;
}

/* Container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Header */
header {
    background-color: var(--primary);
    color: white;
    padding: 1rem;
    text-align: center;
    font-size: 1.8rem;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

/* Product Details */
.product-details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    margin: 2rem auto;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    overflow: hidden;
    padding: 20px;
}

/* Product Image */
.product-gallery {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 1rem;
    width: 250px; 
    height: 500px; 
    object-fit: cover;
}

.product-image {
    width: 500px; 
    height: 500px; 
       object-fit: cover;
    border: 1px solid #eee;
    border-radius: 4px;
}

/* Product Info */
.product-info {
    padding: 20px;
}

.product-title {
    font-size: 1.8rem;
    color: var(--secondary);
    margin-bottom: 10px;
}

.product-price {
    font-size: 1.5rem;
    color: var(--primary);
    margin: 1rem 0;
}

.original-price {
    text-decoration: line-through;
    color: var(--gray);
    margin-right: 10px;
}

.discount {
    color: var(--success);
    font-weight: bold;
}

/* Product Meta Details */
.product-meta {
    margin: 1.5rem 0;
}

.meta-item {
    margin-bottom: 0.5rem;
}

.meta-label {
    font-weight: bold;
    display: inline-block;
    width: 120px;
}

/* Action Buttons */
.action-buttons {
    display: flex;
    gap: 1rem;
    margin-top: 2rem;
}

.btn {
    padding: 0.8rem 1.5rem;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.2s;
    flex: 1;
    text-align: center;
}

.btn-primary {
    background-color: var(--primary);
    color: white;
}

.btn-outline {
    background-color: white;
    color: var(--primary);
    border: 1px solid var(--primary);
}

.btn:hover {
    opacity: 0.9;
}

/* Not Found Section */
.not-found {
    text-align: center;
    padding: 2rem;
    background: white;
    border-radius: 8px;
    margin: 2rem auto;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* Responsive Design */
@media (max-width: 768px) {
    .product-details {
        grid-template-columns: 1fr;
        padding: 15px;
    }

    .product-image {
        max-width: 100%;
        height: auto;
    }
}

@media (max-width: 480px) {
    .product-title {
        font-size: 1.5rem;
    }

    .product-price {
        font-size: 1.2rem;
    }
}
    
    
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${not empty product}">
                <div class="product-details">
                    <div class="product-gallery">
                        <img src="WebContent/${product.pimg}" alt="${product.prodName}">
                    </div>
                    <div class="product-info">
                        <h1>${product.prodName}</h1>
                        <div class="product-price">
                            <span class="original-price">Rs. <fmt:formatNumber value="${product.pprice + 200}" type="currency" /></span>
                            <span>Rs. <fmt:formatNumber value="${product.pprice}" type="currency" /></span>
                        </div>
                        <div class="product-meta">
                            <div><strong>Category:</strong> <c:out value="${product.category}" /></div>
                            <div><strong>Brand:</strong> <c:out value="${product.pbrand}" default="No Brand" /></div>
                            <div><strong>Availability:</strong> 
                                <c:choose>
                                    <c:when test="${product.pstock > 4}">In Stock</c:when>
                                    <c:when test="${product.pstock <= 4}">Low Stock</c:when>
                                    <c:otherwise>Out of Stock</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <p>${product.descrip}</p>
                        <div class="action-buttons">
                            <button class="btn btn-primary">Buy Now</button>
                            <button class="btn btn-outline">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="not-found">
                    <h2>Product Not Found</h2>
                    <p>The requested product could not be found.</p>
                    <a href="index.jsp">Return to Home</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
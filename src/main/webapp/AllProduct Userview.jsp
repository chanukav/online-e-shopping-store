<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <style>
        :root {
            --primary: #ff6b00;
            --secondary: #333;
            --light: #f8f9fa;
            --dark: #212529;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            --card-hover-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: var(--dark);
            background-color: #f5f5f5;
            line-height: 1.6;
        }
        
        header {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .auction-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .Route-card {
            background: #fff;
            border-radius: 8px;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .Route-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-hover-shadow);
        }

        .Route-card img {
            width: 100%;
            height: 240px;
            object-fit: cover;
            border-bottom: 1px solid #eee;
        }

        .card-cont {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .card-cont p {
            margin: 0.5rem 0;
            font-size: 0.95rem;
            color: #666;
        }

        .card-cont p strong {
            color: var(--dark);
            font-weight: 600;
        }

        .card-btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-top: 1rem;
            text-align: center;
        }

        .card-btn:hover {
            background: #e05e00;
            transform: translateY(-2px);
        }

        h2 {
            text-align: center;
            margin: 2rem 0;
            font-weight: 600;
            color: var(--secondary);
        }

        @media (max-width: 768px) {
            .auction-container {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
                padding: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .auction-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="navbar">
            <div class="logo">GAMUDA.LK</div>
            <div class="user-actions">
                <a href="#" style="color: white; text-decoration: none;">Back to Store</a>
            </div>
        </div>
    </header>

    <h2>All Products</h2>

    <div class="auction-container">
        <c:forEach var="product" items="${allProduct}">
            <div class="Route-card">
                <img src="WebContent/${product.pimg}" alt="${product.prodName}">
                <div class="card-cont">
                    <p><strong>Product Name:</strong> ${product.prodName}</p>
                    <p><strong>Category:</strong> ${product.category}</p>
                    <p><strong>Description:</strong> ${product.descrip}</p>
                    <p><strong>Price:</strong> Rs. ${product.pprice}0/=</p>
                    <form action="ProductDetailsServlet" method="GET">
						    <input type="hidden" name="pid" value="${product.pid}">
						    <button type="submit" class="card-btn">View Details</button>
					</form>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
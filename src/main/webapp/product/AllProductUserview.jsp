<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/partial/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/image/favicon.svg">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/image/apple-touch-icon.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/image/site.webmanifest">

    <style>
        :root {
            --primary: #ff6b00;
            --dark: #212529;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            --card-hover-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--dark);
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            margin: 2rem 0 1rem;
            font-weight: 600;
            color: var(--dark);
        }

        .auction-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            padding: 2rem;
            max-width: 1400px;
            margin: auto;
        }

        .Route-card {
            position: relative;
            background: #fff;
            border-radius: 8px;
            box-shadow: var(--card-shadow);
            transition: 0.3s ease;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .Route-card:hover {
            box-shadow: var(--card-hover-shadow);
        }

        .Route-card img {
            width: 100%;
            height: 240px;
            object-fit: cover;
            cursor: pointer;
        }

        .card-cont {
            padding: 1rem 1.5rem;
            flex-grow: 1;
        }

        .card-cont p {
            margin: 0.5rem 0;
            font-size: 0.95rem;
        }

        .card-btn {
            margin-top: 1rem;
            background: var(--primary);
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .cart-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            background: white;
            border-radius: 50%;
            padding: 0.4rem;
            font-size: 1.2rem;
            color: var(--primary);
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.8);
            justify-content: center;
            align-items: center;
        }

        .modal-box {
            background: white;
            max-width: 900px;
            width: 90%;
            display: flex;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            position: relative;
            flex-direction: row;
        }

        .modal-image {
            flex: 1;
        }

        .modal-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .modal-details {
            flex: 1;
            padding: 2rem;
            font-size: 1rem;
        }

        .modal-details h3 {
            margin-top: 0;
            font-size: 1.8rem;
        }

        .modal-details p {
            margin: 0.5rem 0;
        }

        .modal-details .price {
            color: var(--primary);
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .modal-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn {
            padding: 0.6rem 1.5rem;
            font-size: 1rem;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-buy {
            background: var(--primary);
            color: white;
            border: none;
        }

        .btn-cart {
            background: white;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .modal-close {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 1.5rem;
            cursor: pointer;
            color: #999;
        }

        @media (max-width: 768px) {
            .auction-container {
                grid-template-columns: repeat(2, 1fr);
                padding: 1.5rem;
            }

            .modal-box {
                flex-direction: column;
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

<h2>All Products</h2>
<div class="auction-container">
    <c:forEach var="product" items="${allProduct}">
        <div class="Route-card">
            <div class="cart-icon cart-icon-product" data-pid="${product.pid}">
                <i class="fas fa-cart-plus"></i>
            </div>
            <img src="WebContent/${product.pimg}" 
                 alt="${fn:escapeXml(product.prodName)}"
                 class="open-modal"
                 data-name="${fn:escapeXml(product.prodName)}"
                 data-category="${fn:escapeXml(product.category)}"
                 data-description="${fn:escapeXml(product.descrip)}"
                 data-price="${product.pprice}"
                 data-img="WebContent/${product.pimg}"
                 data-availability="In Stock"
                 data-pid="${product.pid}"
                 loading="lazy">
            <div class="card-cont">
                <p><strong>${fn:escapeXml(product.prodName)}</strong></p>
                <p><strong>Price:</strong> <fmt:formatNumber value="${product.pprice}" type="currency" currencySymbol="Rs. "/></p>
                <button type="button" class="card-btn open-modal"
                        data-name="${fn:escapeXml(product.prodName)}"
                        data-category="${fn:escapeXml(product.category)}"
                        data-description="${fn:escapeXml(product.descrip)}"
                        data-price="${product.pprice}"
                        data-img="${pageContext.request.contextPath}/${product.pimg}"
                        data-availability="In Stock"
                        data-pid="${product.pid}">
                    View Details
                </button>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Modal -->
<div class="modal" id="productModal">
    <div class="modal-box">
        <div class="modal-image">
            <img id="modalImage" alt="Product Image" loading="lazy">
        </div>
        <div class="modal-details">
            <span class="modal-close" id="modalClose" aria-label="Close modal">×</span>
            <h3 id="modalName">Product Name</h3>
            <p id="modalCategory"><strong>Category:</strong></p>
            <p id="modalDescription"><strong>Description:</strong></p>
            <p id="modalAvailability"><strong>Availability:</strong></p>
            <p class="price" id="modalPrice">Price</p>
            <div class="modal-buttons">
                <form action="BuyNowServlet" method="POST">
                    <input type="hidden" id="modalBuyPid" name="pid">
                    <button type="submit" class="btn btn-buy">Buy Now</button>
                </form>
                <form action="${pageContext.request.contextPath}/AddToCart" method="POST" id="modalAddToCartForm">
                    <input type="hidden" id="modalCartProductId" name="productId">
                    <input type="hidden" id="modalCartProductName" name="productName">
                    <input type="hidden" id="modalCartProductPrice" name="productPrice">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit" class="btn btn-cart">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const modal = document.getElementById('productModal');
    const modalImage = document.getElementById('modalImage');
    const modalName = document.getElementById('modalName');
    const modalCategory = document.getElementById('modalCategory');
    const modalDescription = document.getElementById('modalDescription');
    const modalAvailability = document.getElementById('modalAvailability');
    const modalPrice = document.getElementById('modalPrice');
    const modalClose = document.getElementById('modalClose');
    const modalBuyPid = document.getElementById('modalBuyPid');
    const modalCartProductId = document.getElementById('modalCartProductId');
    const modalCartProductName = document.getElementById('modalCartProductName');
    const modalCartProductPrice = document.getElementById('modalCartProductPrice');

    document.querySelectorAll('.open-modal').forEach(btn => {
        btn.addEventListener('click', function () {
            modalImage.src = this.dataset.img;
            modalName.textContent = this.dataset.name;
            modalCategory.innerHTML = "<strong>Category:</strong> " + this.dataset.category;
            modalDescription.innerHTML = "<strong>Description:</strong> " + this.dataset.description;
            modalAvailability.innerHTML = "<strong>Availability:</strong> " + this.dataset.availability;
            modalPrice.textContent = "Rs. " + this.dataset.price + "/=";
            modalBuyPid.value = this.dataset.pid;
            modalCartProductId.value = this.dataset.pid;
            modalCartProductName.value = this.dataset.name;
            modalCartProductPrice.value = this.dataset.price;
            modal.style.display = 'flex';
        });
    });

    modalClose.onclick = () => modal.style.display = "none";
    window.onclick = e => { if (e.target === modal) modal.style.display = "none"; };

    document.querySelectorAll('.cart-icon-product').forEach(icon => {
        icon.addEventListener('click', function () {
            const pid = this.dataset.pid;
            fetch('${pageContext.request.contextPath}/AddToCart', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'pid=' + encodeURIComponent(pid)
            })
            .then(response => response.text())
            .then(data => alert('Product added to cart!'))
            .catch(error => {
                alert('Error adding to cart!');
                console.error('Error:', error);
            });
        });
    });
</script>

</body>
</html>

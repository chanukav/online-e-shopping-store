<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/partial/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body>

<h2>All Products</h2>
<div class="auction-container">
    <c:forEach var="product" items="${allProduct}">
        <div class="Route-card">
            <div class="cart-icon-product" data-pid="${product.pid}">
                <i class="fas fa-cart-plus"></i>
            </div>
            <img src="${pageContext.request.contextPath}/images/${product.pimg}"" 
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
                        data-img="${pageContext.request.contextPath}/images/${product.pimg}"
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

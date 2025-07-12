<%@ page language="java" %>
<%@ include file="/partial/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.Category" %>

<html>
<head>
    <title>Products By Category</title>
    <link rel="stylesheet" href=".../bootstrap.css">
    <link rel="stylesheet" href=".../font-awesome.css">
</head>
<body>
    <div class="container">
        <h2>Products</h2>
        <div class="row">
            <div class="col-md-3">
                <h4>Categories</h4>
                <ul class="list-group">
                    <c:forEach var="category" items="${categories}">
                        <li class="list-group-item">
                            <a href="productsByCategory?categoryId=${category.categoryId}">
                                ${category.name}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    
    <div>
	<h5 class="mb-4 text-start featured-heading">Featured Products</h5>
	<div class="auction-container">
	  <c:forEach var="product" items="${products}" varStatus="status">
	  	<c:if test="${status.index < 4}">
		    <div class="Route-card">
		      <div class="cart-icon-product" data-pid="${product.pid}">
		        <i class="fas fa-cart-plus"></i>
		      </div>
		      <img src="${pageContext.request.contextPath}/images/${product.pimg}" alt="${fn:escapeXml(product.prodName)}"
		           class="open-modal" 
		           data-name="${fn:escapeXml(product.prodName)}" 
		           data-category="${fn:escapeXml(product.category)}"
		           data-description="${fn:escapeXml(product.descrip)}"
		           data-price="Rs. ${product.pprice}/="
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
		                data-price="Rs. ${product.pprice}/="
		               data-img="${pageContext.request.contextPath}/images/${product.pimg}"
		                data-availability="In Stock"
		                data-pid="${product.pid}">
		          View Details
		        </button>
		      </div>
		    </div>
	    </c:if>
	  </c:forEach>
	</div>
	<div class="d-flex justify-content-center justify-content-md-end">
		  <a href="#" class="seemore-heading">See More...</a>
	</div>
</div>


<!-- Custom Modal -->
<div class="modal" id="productModal">
  <div class="modal-box">
    <div class="modal-image">
      <img id="modalImage"  alt="Product Image" loading="lazy">
    </div>
    <div class="modal-details">
      <span class="modal-close" id="modalClose" aria-label="Close modal">×</span>
      <h3 id="modalName">Product Name</h3>
      <p id="modalCategory"><strong>Category:</strong> </p>
      <p id="modalDescription"><strong>Description:</strong> </p>
      <p id="modalAvailability"><strong>Availability:</strong> </p>
      <p class="price" id="modalPrice">Price</p>
      <div class="modal-buttons">
        <form action="BuyNowServlet" method="POST">
          <input type="hidden" id="modalBuyPid" name="pid" value="">
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
      modalPrice.textContent = this.dataset.price;
      modalBuyPid.value = this.dataset.pid;
      modalCartProductId.value = this.dataset.pid;
      modalCartProductName.value = this.dataset.name;
      modalCartProductPrice.value = this.dataset.price.replace('Rs. ', '').replace('/=', '');
      modal.style.display = 'flex';

    });
  });

  modalClose.onclick = () => modal.style.display = "none";
  window.onclick = e => { if (e.target == modal) modal.style.display = "none"; };

  document.querySelectorAll('.cart-icon-product').forEach(icon => {
    icon.addEventListener('click', function () {
      const pid = this.dataset.pid;
      fetch('AddToCartServlet', {
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


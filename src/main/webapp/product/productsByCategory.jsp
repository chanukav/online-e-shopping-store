<%@ page language="java" %>
<%@ include file="/partial/header.jsp" %>

<!-- Main container -->
<div class="container-fluid mt-4">
  <div class="row">
    <!-- Sidebar: Categories -->
	<aside class="col-md-3 mb-4">
	  <div class="sidebar p-3 rounded shadow-sm" style="background:#fcffff;">
	    <ul class="list-unstyled">
	      <c:forEach var="category" items="${categories}">
	        <c:set var="isSelected" value="${category.categoryId == selectedCategoryId}" />
	        <li>
	          <a href="productsByCategory?categoryId=${category.categoryId}" 
	             class="d-block py-2 px-3 rounded text-decoration-none category-link"
	             data-category-name="${category.name}"
	             style="color:${isSelected ? '#fcffff' : '#f85506'}; background-color:${isSelected ? '#fe980f' : 'transparent'};"
	             onmouseover="this.style.background='#fe980f';this.style.color='#fcffff';"
	             onmouseout="this.style.background='${isSelected ? '#fe980f' : ''}';this.style.color='${isSelected ? '#fcffff' : '#f85506'}';">
	            <i class="fas fa-tag me-2"></i> ${category.name}
	          </a>
	        </li>
	      </c:forEach>
	    </ul>
	  </div>
	</aside>


    <!-- Main Content: Products -->
    <main class="col-md-9">
	<c:choose>
		  <c:when test="${not empty selectedCategoryName}">
		    <h5 class="mb-4 text-start featured-heading" style="color:#e61616;">
		      ${selectedCategoryName} Products
		    </h5>
		  </c:when>
		  <c:otherwise>
		    <h5 class="mb-4 text-start featured-heading" style="color:#e61616;">
		      Featured Products
		    </h5>
		  </c:otherwise>
	</c:choose>
      <div class="row g-4">
         <c:forEach var="product" items="${products}" varStatus="status">
			<c:if test="${status.index < 40}">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
              <!-- Product Card (do not change) -->
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
              <!-- End Product Card -->
             </div>
		    </c:if>
		  </c:forEach>
      </div>
      <div class="d-flex justify-content-center justify-content-md-end mt-4">
        <a href="#" class="seemore-heading" style="color:#fe980f;">Load More...</a>
      </div>
    </main>
  </div>
</div>

<!-- Product Modal (do not change) -->
<div class="modal" id="productModal">
  <div class="modal-box">
    <div class="modal-image">
      <img id="modalImage"  alt="Product Image" loading="lazy">
    </div>
    <div class="modal-details">
      <span class="modal-close" id="modalClose" aria-label="Close modal">�</span>
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

<script src="${pageContext.request.contextPath}/js/product-modal.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
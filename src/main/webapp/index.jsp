<%@ include file="/partial/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.Product" %>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="1000">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/image/Banner_GamudaLK.webp" class="d-block w-100" alt="Banner 1" loading="lazy">
    </div>
    <div class="carousel-item"> 
      <img src="${pageContext.request.contextPath}/image/Banner2_GamudaLK.webp" class="d-block w-100" alt="Banner 2" loading="lazy">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/Banner3_GamudaLK.webp" class="d-block w-100" alt="Banner 3" loading="lazy">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">

  </button>
</div>

<div class="container-fluid p-4 category-grid">
    <div class="row g-4 justify-content-center">
      
      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-laptop fa-2x"></i>
          <a href="productsByCategory?categoryId=19">Electronics</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-tshirt fa-2x"></i>
          <a href="productsByCategory?categoryId=20">Clothing</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-shoe-prints fa-2x"></i>
          <a href="productsByCategory?categoryId=21">Footwears</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-couch fa-2x"></i>
          <a href="productsByCategory?categoryId=22">Furniture</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-utensils fa-2x"></i>
          <a href="productsByCategory?categoryId=23">Kitchen</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-book fa-2x"></i>
          <a href="productsByCategory?categoryId=24">Books</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-heart fa-2x"></i>
          <a href="productsByCategory?categoryId=25">Beauty</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-baby fa-2x"></i>
          <a href="productsByCategory?categoryId=26">Baby</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-futbol fa-2x"></i>
          <a href="productsByCategory?categoryId=27">Sports</a>
        </div>
      </div>

      <div class="col-6 col-md-4 col-lg-2">
        <div class="category-card text-center">
          <i class="fas fa-gift fa-2x"></i>
          <a href="productsByCategory?categoryId=28">Gifts</a>
        </div>
      </div>
      
		<div class="col-6 col-md-4 col-lg-2">
		  <div class="category-card text-center">
		    <i class="fas fa-paw fa-2x"></i>
		    <a href="productsByCategory?categoryId=29">Pet Supplies</a>
		  </div>
		</div>

      
		<div class="col-6 col-md-4 col-lg-2">
		  <div class="category-card text-center">
		    <i class="fas fa-layer-group fa-2x"></i>
		    <a href="productsByCategory?categoryId=19">More..</a>
		  </div>
		</div>

    </div>
  </div>


<div>
	<h5 class="mb-4 text-start featured-heading">Featured Products</h5>
	<div class="auction-container">
	  <c:forEach var="product" items="${allProduct}" varStatus="status">
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


<div class="container text-center">
  <div class="row">
    <div class="col-sm-8">
      <img src="${pageContext.request.contextPath}/image/add2.webp" class="img-fluid" alt="Ad 2" />
    </div>
    <div class="col-sm-4">
      <img src="${pageContext.request.contextPath}/image/add1.webp" class="img-fluid" alt="Ad 1" />
    </div>
  </div>
</div>




<div>
	<h5 class="mb-4 text-start featured-heading">Newly Added</h5>
	<div class="auction-container">
	  <c:forEach var="product" items="${allProduct}" varStatus="status">
	  	<c:if test="${status.index < 8}">
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




<script src="${pageContext.request.contextPath}/js/product-modal.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<div class="container-fluid p-0">
  <img src="${pageContext.request.contextPath}/image/Banner4_GamudaLK.webp" class="w-100 d-block" />
</div>


  <div class="container my-5">
    <div class="row g-4"> 

      <div class="col-12 col-sm-6 col-md-3">
        <div class="feature-card">
          <i class="fas fa-truck-fast feature-icon icon-red"></i>
          <h6 class="feature-title">Faster Delivery</h6>
          <p class="feature-description">Delivery in 24/H</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-md-3">
        <div class="feature-card">
          <i class="fas fa-rotate-left feature-icon icon-yellow"></i>
          <h6 class="feature-title">24 Hours Return</h6>
          <p class="feature-description">100% money-back guarantee</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-md-3">
        <div class="feature-card">
          <i class="fas fa-lock feature-icon icon-orange"></i>
          <h6 class="feature-title">Secure Payment</h6>
          <p class="feature-description">Your Money is Safe</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-md-3">
        <div class="feature-card">
          <i class="fas fa-headset feature-icon icon-red"></i>
          <h6 class="feature-title">Support 24/7</h6>
          <p class="feature-description">Live contact / Message</p>
        </div>
      </div>

    </div>
  </div>


<%@ include file="/partial/footer.jsp" %>
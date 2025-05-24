<%@ include file="/partial/home_header.jsp" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="1000">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/image/Banner_GamudaLK.webp" class="d-block w-100" alt="Banner_1">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/Banner2_GamudaLK.webp" class="d-block w-100" alt="Banner_2">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/Banner3_GamudaLK.webp" class="d-block w-100" alt="Banner_3">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

    <h3 class="mb-4 text-center">Featured Products</h3>

    <div class="product-container">
        <c:choose>
            <c:when test="${not empty productList}">
                <c:forEach var="p" items="${productList}">
                    <div class="product-card">
                        <div class="cart-icon" data-pid="${p.pid}">
                            <i class="fas fa-cart-plus"></i>
                        </div>
                        <img src="WebContent/${product.pimg}" alt="${p.prodName}">
                        <div class="card-content">
                            <p><strong>${p.prodName}</strong></p>
                            <p><strong>Category:</strong> ${p.category}</p>
                            <p><strong>Price:</strong> Rs. ${p.pprice}0/=</p>
                            <p><strong>Stock:</strong> ${p.pstock}</p>
                            <p><strong>Brand:</strong> ${p.pbrand}</p>
                            <p><strong>Description:</strong> ${p.descrip}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-products">No products found.</p>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

 

<%@ include file="/partial/footer.jsp" %>

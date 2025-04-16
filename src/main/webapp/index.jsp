<%@ include file="/partial/header.jsp" %>
<%@ page import="java.lang.Math" %>



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



<!-- Feature Products Section -->
<div class="container my-5">
    <h3 class="mb-4 text-center" style="color: #e61616;">Featured Products</h3>
    <div class="row g-4" id="featured-products">
        <c:forEach var="product" items="${productList}">
            <div class="col-md-3 col-sm-6">
                <div class="card h-100 shadow-sm">
                    <img src="${product.image}" class="card-img-top" alt="${product.name}">
                    <div class="card-body text-center">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="mb-1">
                            <c:if test="${product.originalPrice != null}">
                                <span class="text-muted text-decoration-line-through">$${product.originalPrice}</span>
                            </c:if>
                            <span class="fw-bold text-danger">$${product.price}</span>
                        </p>
                        <div class="mb-2 text-warning">
                            <%
                                double rating = (Double) pageContext.getAttribute("product", PageContext.REQUEST_SCOPE).getClass().getMethod("getRating").invoke(pageContext.getAttribute("product"));
                                int fullStars = (int) rating;
                                boolean halfStar = rating % 1 != 0;
                                int emptyStars = 5 - fullStars - (halfStar ? 1 : 0);

                                for (int i = 0; i < fullStars; i++) { %>
                                    <i class="fas fa-star"></i>
                            <%  }
                                if (halfStar) { %>
                                    <i class="fas fa-star-half-alt"></i>
                            <%  }
                                for (int i = 0; i < emptyStars; i++) { %>
                                    <i class="far fa-star"></i>
                            <%  }
                            %>
                        </div>
                        <div class="d-flex justify-content-center gap-2">
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                            <button class="btn btn-sm btn-outline-danger" title="Add to Wishlist">
                                <i class="far fa-heart"></i>
                            </button>
                        </div>
                        <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


  <!-- New Listing Section -->
<div class="container my-5">
    <h3 class="mb-4 text-center" style="color: #e61616;">New Listings</h3>
    <div class="row g-4">
      <!-- New Listing Product Card 1 -->
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/newProduct1.jpg" class="card-img-top" alt="New Product 1">
          <div class="card-body text-center">
            <h5 class="card-title">New Product 1</h5>
            <!-- Price -->
            <p class="mb-1">
              <span class="text-muted text-decoration-line-through">$120</span>
              <span class="fw-bold text-danger">$99</span>
            </p>
            <!-- Ratings -->
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
              <i class="far fa-star"></i>
            </div>
            <!-- Buttons -->
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger" title="Add to Wishlist">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
  
      <!-- Repeat the card 3 more times for New Listings -->
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/newProduct2.jpg" class="card-img-top" alt="New Product 2">
          <div class="card-body text-center">
            <h5 class="card-title">New Product 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$59</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>

      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/newProduct2.jpg" class="card-img-top" alt="New Product 2">
          <div class="card-body text-center">
            <h5 class="card-title">New Product 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$59</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>

      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/newProduct2.jpg" class="card-img-top" alt="New Product 2">
          <div class="card-body text-center">
            <h5 class="card-title">New Product 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$59</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
  
      <!-- Add two more product cards (New Product 3, New Product 4) -->
      <!-- ...same structure... -->
    </div>
  </div>
  
    <!-- Hot Deals Section -->
<div class="container my-5">
    <h3 class="mb-4 text-center" style="color: #e61616;">Hot Deals</h3>
    <div class="row g-4">
      <!-- Hot Deal Product Card 1 -->
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal1.jpg" class="card-img-top" alt="Hot Deal 1">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 1</h5>
            <p class="mb-1">
              <span class="text-muted text-decoration-line-through">$150</span>
              <span class="fw-bold text-danger">$99</span>
            </p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger" title="Add to Wishlist">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
  
      <!-- Repeat the card for the remaining 7 products -->
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="card h-100 shadow-sm">
          <img src="img/hotDeal2.jpg" class="card-img-top" alt="Hot Deal 2">
          <div class="card-body text-center">
            <h5 class="card-title">Hot Deal 2</h5>
            <p class="mb-1"><span class="fw-bold text-dark">$79</span></p>
            <div class="mb-2 text-warning">
              <i class="fas fa-star"></i><i class="fas fa-star"></i>
              <i class="fas fa-star"></i><i class="far fa-star"></i>
              <i class="far fa-star"></i>
            </div>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-sm btn-outline-primary">
                <i class="fas fa-cart-plus"></i> Add to Cart
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="far fa-heart"></i>
              </button>
            </div>
            <button class="btn btn-sm btn-warning mt-2 w-100">Buy It Now</button>
          </div>
        </div>
      </div>
    </div>
  </div>


<%@ include file="/partial/footer.jsp" %>

<%@ include file="/partial/home_header.jsp" %>
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
<h3 class="mb-4 text-center" style="color: #e61616;">Featured Products</h3>

<div class="auction-container">
    <c:forEach var="product" items="${allProduct}">
        <div class="Route-card">
            <div class="cart-icon" data-pid="${product.pid}">
                <i class="fas fa-cart-plus"></i>
            </div>
            <img src="WebContent/${product.pimg}" alt="${product.prodName}" 
                 class="open-modal" 
                 data-name="${product.prodName}" 
                 data-category="${product.category}"
                 data-description="${product.descrip}"
                 data-price="Rs. ${product.pprice}0/="
                 data-img="WebContent/${product.pimg}"
                 data-availability="In Stock"
                 data-pid="${product.pid}">
            <div class="card-cont">
                <p><strong>Product Name:</strong> ${product.prodName}</p>
                <p><strong>Category:</strong> ${product.category}</p>
                <p><strong>Description:</strong> ${product.descrip}</p>
                <p><strong>Price:</strong> Rs. ${product.pprice}0/=</p>
                
   <a href="ViewProduct.jsp?pid=${product.pid}" class="btn btn-primary card-btn">
    View Details
</a>

            </div>
        </div>
    </c:forEach>
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
    const modalAddCart = document.getElementById('modalAddCart');

    let currentPid = null;

    document.querySelectorAll('.open-modal').forEach(btn => {
        btn.addEventListener('click', function () {
            modalImage.src = this.dataset.img;
            modalName.textContent = this.dataset.name;
            modalCategory.innerHTML = "<strong>Category:</strong> " + this.dataset.category;
            modalDescription.innerHTML = "<strong>Description:</strong> " + this.dataset.description;
            modalAvailability.innerHTML = "<strong>Availability:</strong> " + this.dataset.availability;
            modalPrice.textContent = this.dataset.price;
            modalBuyPid.value = this.dataset.pid;
            currentPid = this.dataset.pid;
            modal.style.display = 'flex';
        });
    });

    modalClose.onclick = () => modal.style.display = "none";
    window.onclick = e => { if (e.target == modal) modal.style.display = "none"; };

    modalAddCart.onclick = () => {
        if (!currentPid) return;
        fetch('AddToCartServlet', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'pid=' + encodeURIComponent(currentPid)
        })
        .then(response => response.text())
        .then(data => {
            alert('Product added to cart!');
        })
        .catch(error => {
            alert('Error adding to cart!');
            console.error(error);
        });
    };

    // Top-right cart icons
    document.querySelectorAll('.cart-icon').forEach(icon => {
        icon.addEventListener('click', function () {
            const pid = this.getAttribute('data-pid');
            fetch('AddToCartServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'pid=' + encodeURIComponent(pid)
            })
            .then(response => response.text())
            .then(data => {
                alert('Product added to cart!');
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
</script>

<%@ include file="/partial/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>GAMUDALK</title>
	<link rel="icon" type="image/svg+xml" href="<%= request.getContextPath() %>/image/favicon.svg">
	<link rel="shortcut icon" href="<%= request.getContextPath() %>/image/favicon.ico">
	<link rel="apple-touch-icon" sizes="180x180" href="<%= request.getContextPath() %>/image/apple-touch-icon.png">
	<link rel="manifest" href="<%= request.getContextPath() %>/image/site.webmanifest">
  
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
	
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <!-- Home page context CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/customCSS/custom2.css">

  <style>
     /* Top Header */
    .top-header {
      background-color: #f8f9fa;
      color: #e61616;
      font-size: 14px;
      padding: 0;
      margin: 0;
      
    }

    .top-header a {
      color: #e61616;
      margin-right: 15px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .top-header a:hover {
      color: #fe980f;
      text-decoration: none;
    }

    .top-header select {
      border: none;
      background-color: transparent;
      color: #e61616;
      font-weight: bold;
    }

    .top-header select:focus {
      outline: none;
    }

    /* Middle Header */
    .logo-img {
	      width: 90px;
	      height: auto;
		  height: auto;
		  transition: transform 0.3s ease;
	 }
	  .logo-img:hover {
	    transform: scale(1.05);
	  }

    .middle-header {
      background-color: #f85506;
      padding: 15px 0;
      border-bottom: 1px solid #eaeaea;
    }

    .middle-header .logo {
      font-weight: bold;
      font-size: 28px;
      color: #e61616;
      text-decoration: none;
    }

    .middle-header .category-btn {
      background-color: #fe980f;
      color: #fff;
      border: none;
      font-weight: bold;
    }

    .middle-header .category-btn:hover {
      color: #000000;
      background-color: #e61616;
    }

    .search-form input {
      border-radius: 0;
      border: 1px solid #ffffff;
    }

    .search-form button {
      background-color: #fceaca;
      color: white;
      border: none;
      border-radius: 0;
    }

    .search-form button:hover {
      background-color: #eaeaea;
    }
    
    .cart-icon {
      position: relative;
      color: #fceaca;
      font-weight: bold;
      text-decoration: none;
    }

    .cart-count {
      position: absolute;
      top: -5px;
      right: -10px;
      background-color: #fe980f;
      color: white;
      font-size: 12px;
      border-radius: 50%;
      padding: 2px 6px;
    }
    .btn_search{
      background-color: #fe980f;
      padding: 8px;
      color: #fff;
      border: none;
      font-weight: bold;
      border-radius: 5px;
    }

    /* Bottom Header */
    .bottom-header {
      background-color:#f8f9fb;
      padding: 10px 0;
    }

    .bottom-header a {
      color: #e61616;
      font-weight: bold;
      text-decoration: none;
      margin-right: 20px;
      transition: color 0.3s;
    }

    .bottom-header a:hover {
      color: #fe980f;
    }

    .dropdown-toggle::after {
      display: none;
    }

    .all-categories-btn {
      background-color: #fe980f;
      color: #fff;
      font-weight: bold;
      border: none;
    }

    .all-categories-btn:hover {
      background-color: #e61616;
    }

    /* Responsive Adjustments */
    @media (max-width: 768px) {
      .search-form {
        display: none;
      }

      .search-form.show {
        display: block;
        margin-top: 10px;
      }

      .search-icon {
        display: inline-block;
        background-color: #fe980f;
        border: none;
        font-size: 20px;
        color: #ffffff;
      }
      .logo-img {
          width: 90px;
        }
      }
    
  </style>
</head>
<body onload="submitFormOnce()">
  <!-- Top Header -->
<header>
    <div class="top-header">
      <div class="container d-flex justify-content-between align-items-center">
        <div>
          <select name="language" id="language">
            <option value="en">English</option>
            <option value="si">සිංහල</option>
            <option value="ta">தமிழ்</option>
          </select>
          <select name="currency" id="currency">
            <option value="LKR">LKR</option>
            <option value="USD">USD</option>
            <option value="EUR">EUR</option>
          </select>
        </div>
           <!-- Top header-->
           
           
           
           <!--  -->
    <div class="bottom-header">
      <div class="container">
        <div class="row align-items-center">
          <div class="col">
            <div class="d-flex align-items-center">
				<nav class="d-flex justify-content-end">
                <a href="#" class="me-3">Home</a>
                <a href="#" class="me-3">Features</a>
                <a href="#">Accessories</a>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
     <div class="header-icons">
         <a href="profile.jsp"><i class="fas fa-heart"></i> Wishlist</a>
         
       
         <a href="<%=request.getContextPath()%>/Profile"><i class="fas fa-user"></i> Profile</a><!--changes-->
         
        </div>
        <!---------------------------------button------------------------->
        
        
        


<div class="d-flex gap-2">    
  <!--  -<form action="login.jsp" method="post" class="m-0">
    <button type="submit" class="btn btn-primary">Login</button>
  </form>-->

  <form action="index.jsp" method="post" class="m-0">
    <button type="submit" class="btn btn-danger">Sign Out</button>
  </form>
</div>

      
      
    </div>

    <!-- Middle Header -->
    <div class="middle-header">
      <div class="container py-2">
        <div class="row align-items-center text-center text-md-start">
		<!-- Logo -->
		<div class="col-12 col-md-3 mb-2 mb-md-0 d-flex justify-content-center justify-content-md-start align-items-center">
		  <a href="<%= request.getContextPath() %>/index.jsp" class="logo">
		    <img src="<%= request.getContextPath() %>/image/glogo.webp" class="logo-img" alt="GamudaLk.logo">
		  </a>
		</div>
          <!-- Search Bar -->
          <div class="col-12 col-md-6 mb-2 mb-md-0 d-flex justify-content-center align-items-center">
            <div class="input-group w-100" style="max-width: 100%;">
              <button class="btn category-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                All Categories
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Electronics</a></li>
                <li><a class="dropdown-item" href="#">Clothing</a></li>
                <li><a class="dropdown-item" href="#">Accessories</a></li>
              </ul>
              <input type="text" id="searchInput" class="form-control" placeholder="Search products..." aria-label="Search">
              <button class="btn_search" type="button" onclick="searchProducts()">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>

          <!-- Cart -->
          <div class="col-12 col-md-3 d-flex justify-content-center justify-content-md-end align-items-center">
            <a href="<%= request.getContextPath() %>/checkout/cart.jsp" class="cart-icon text-decoration-none">
              <i class="fas fa-shopping-cart fa-lg"></i>
              <span class="ms-1">My Cart</span>
              <span id="cart-count" class="cart-count">0</span>
            </a>
          </div>
        </div>
        

		<!-- Add this form in the <header> or body section -->
		<form id="autoSubmitForm" action="<%= request.getContextPath() %>/ProductView" method="get" class="m-0">
		</form>
		
        <script>
          async function updateCartCount() {
            try {
              const response = await fetch('<%= request.getContextPath() %>/cart/items/count');
              if (response.ok) {
                const count = await response.json();
                document.getElementById('cart-count').textContent = count;
              } else {
                console.error('Failed to fetch cart count:', response.statusText);
              }
            } catch (error) {
              console.error('Error fetching cart count:', error);
            }
          }

          document.addEventListener('DOMContentLoaded', updateCartCount);
        </script>
      </div>
    </div>

    <script>
      async function searchProducts() {
        const keyword = document.getElementById("searchInput").value.toLowerCase();
        try {
          const response = await fetch('<%= request.getContextPath() %>/search?keyword=' + encodeURIComponent(keyword));
          if (response.ok) {
            const results = await response.json();
            console.log("Search Results:", results);
          } else {
            console.error("Error fetching search results:", response.statusText);
          }
        } catch (error) {
          console.error("Error:", error);
        }
      }
      

    </script>
    
    <script>
    
	    function submitFormOnce() {
		    // Check if form was already submitted
		    if (!sessionStorage.getItem("formSubmitted")) {
		        document.getElementById("autoSubmitForm").submit();
		        sessionStorage.setItem("formSubmitted", "true");
		    }
		}
    </script>


 
</header>



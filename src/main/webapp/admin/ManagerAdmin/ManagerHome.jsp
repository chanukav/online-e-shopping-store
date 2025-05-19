<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Orders - Gamuda</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap + Font Awesome + Animate -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>

  <style>
    body {
      background-color: #fcffff;
      font-family: 'Segoe UI', sans-serif;
    }

    .orders-wrapper {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      gap: 50px;
      padding: 60px 30px;
      flex-wrap: wrap;
      position: relative;
    }

    .orders-left {
      display: flex;
      flex-direction: column;
      gap: 20px;
      min-width: 260px;
      position: relative;
      z-index: 1;
    }

    .orders-left h2 {
      display: flex;
      align-items: center;
      gap: 12px;
      font-weight: bold;
      font-size: 30px;
      color: #f85506;
    }

    .btn-create {
      background-color: #f85506;
      color: #fcffff;
      font-weight: 600;
      padding: 14px 26px;
      font-size: 16px;
      border: none;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(248, 85, 6, 0.3);
      transition: all 0.3s ease;
    }

    .btn-create:hover {
      background-color: #e61616;
      transform: translateY(-2px);
    }

    .btn-all {
      background-color: #fcffff;
      color: #f85506;
      border: 2px solid #f85506;
      font-weight: 600;
      padding: 14px 26px;
      font-size: 16px;
      border-radius: 12px;
      transition: all 0.3s ease;
    }

    .btn-all:hover {
      background-color: #fceaca;
      transform: translateY(-2px);
    }

    .orders-image img {
      max-width: 520px;
      width: 100%;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
      animation: fadeIn 1.2s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* Background blur box behind buttons */
    .orders-background-box {
      position: absolute;
      top: 10px;
      left: 10px;
      width: 998px;
      height: 475px;
      background: linear-gradient(135deg, #ffe3d3, #ffd1b3);
      backdrop-filter: blur(18px);
      border-radius: 28px;
      z-index: 0;
      box-shadow: 0 12px 30px rgba(248, 85, 6, 0.12);
    }

    @media (max-width: 768px) {
      .orders-wrapper {
        flex-direction: column;
        align-items: center;
      }

      .orders-image img {
        max-width: 90%;
      }

      .orders-background-box {
        width: 95%;
        height: 260px;
        left: 0;
        top: 0;
        margin: 0 auto;
      }
    }
			  /* --- Clean Full Form Modal Style --- */
		.modal-content {
		  background: linear-gradient(135deg, #ffe3d3, #ffd1b3);
		  border-radius: 20px;
		  border: none;
		  padding: 30px;
		  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
		}
		
		.modal-header,
		.modal-footer {
		  display: none; /* remove default header and footer space */
		}
		
		.modal-body {
		  padding: 0;
		}
		
		.modal-body .form-label {
		  font-weight: 600;
		  font-size: 0.95rem;
		  color: #333;
		}
		
		.modal-body input,
		.modal-body textarea {
		  background-color: #fffdfb;
		  border: 2px solid #f85506;
		  border-radius: 12px;
		  padding: 10px 14px;
		  font-size: 0.95rem;
		  transition: all 0.2s ease;
		}
		
		.modal-body input:focus,
		.modal-body textarea:focus {
		  border-color: #e24905;
		  box-shadow: 0 0 0 2px rgba(248, 85, 6, 0.2);
		  outline: none;
		}
		
		.btn-submit {
		  background-color: #f85506;
		  color: white;
		  font-weight: bold;
		  padding: 12px 20px;
		  border: none;
		  border-radius: 12px;
		  margin-top: 20px;
		  width: 100%;
		  transition: all 0.3s ease;
		}
		
		.btn-submit:hover {
		  background-color: #e24905;
		  transform: translateY(-2px);
		}
			  
	
	
	/* ---- Buttons ---- */
	.btn-success {
	  background-color: #f85506;
	  border: none;
	  font-weight: 600;
	}
	
	.btn-success:hover {
	  background-color: #e24905;
	  transform: translateY(-2px);
	}
	
	.btn-secondary {
	  font-weight: 500;
	}
	
	    
  </style>
</head>

<body>

<div class="orders-wrapper animate__animated animate__fadeIn">
  <!-- Background Box for blur effect -->
  <div class="orders-background-box"></div>

  <!-- Left Side: Title + Buttons -->
  <div class="orders-left">
    <h2><i class="fa-solid fa-box-open"></i> Orders</h2>

    <!-- Create New Order Button -->
    <button class="btn btn-create" data-bs-toggle="modal" data-bs-target="#createOrderModal">
      <i class="fa-solid fa-cart-plus me-2"></i> Create New Order
    </button>

    <!-- All Orders Button -->
    <a href="ManagerReadServlet" class="btn btn-all">
      <i class="fa-solid fa-clipboard-list me-2"></i> All Orders
    </a>
  </div>

  <!-- Right Side: Image -->
  <div class="orders-image">
    <img src="https://cdn.pixabay.com/photo/2017/08/10/03/28/ecommerce-2616510_960_720.png" alt="E-commerce Illustration">
  </div>
</div>

<!-- Modal for Create New Order -->
<!-- Clean Full-Form Modal -->
<div class="modal fade" id="createOrderModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form action="ManagerCreateServlet" method="post" class="needs-validation" novalidate>

        <div class="modal-body">
          <h4 class="mb-4 text-center fw-bold text-danger">🛒 Create New Order</h4>

          <div class="mb-3">
            <label class="form-label">Customer Name</label>
            <input type="text" name="cusname" id="cusname" class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="cusemail"  id="cusemail"  class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Product ID(s)</label>
            <input type="text" name="pid"  id="pid"  class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Order Date</label>
            <input type="date" name="date"  id="date"  class="form-control" required>
          </div>

          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Quantity</label>
              <input type="number" name="quantity" id="quantity"  class="form-control" min="1" oninput="calculateTotal()" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Unit Price (Rs)</label>
              <input type="number" name="price"  id="price"  class="form-control" min="0" oninput="calculateTotal()" required>
            </div>
          </div>

          <div class="mb-3 mt-3">
            <label class="form-label">Total (Auto)</label>
            <input type="number" id="total" name="total" class="form-control" readonly>
          </div>

          <div class="mb-3">
            <label class="form-label">Delivery Address</label>
            <input type="text" class="form-control" id="cusadress" name="cusadress" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Contact Number</label>
            <input type="text" name="cuscontact" id="cuscontact"  class="form-control" required>
          </div>

          <button type="submit" class="btn btn-submit">➕ Submit Order</button>
        </div>

      </form>
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#createOrderModal form");

    const fields = [
      { id: "cusname", regex: /^[A-Za-z\s]{2,}$/ },
      { id: "cusemail", regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ },
      { id: "pid", regex: /.+/ },
      { id: "date", type: "date" },
      { id: "quantity", type: "number", min: 1 },
      { id: "price", type: "number", min: 0 },
      { id: "cusadress", regex: /.+/ },
      { id: "cuscontact", regex: /^0\d{9}$/ }
    ];

    fields.forEach(field => {
      const input = document.getElementById(field.id);
      if (input) {
        input.addEventListener("input", () => {
          validateInput(input, field);
          if (field.id === "quantity" || field.id === "price") calculateTotal();
        });
      }
    });

    form.addEventListener("submit", function (e) {
      let isValid = true;
      fields.forEach(field => {
        const input = document.getElementById(field.id);
        if (!validateInput(input, field)) {
          isValid = false;
        }
      });
      if (!isValid) {
        e.preventDefault(); // Prevent submission
        form.classList.add("was-validated");
      }
    });

    function validateInput(input, field) {
      let valid = false;
      const value = input.value.trim();

      if (field.regex) {
        valid = field.regex.test(value);
      } else if (field.type === "number") {
        const num = parseFloat(value);
        valid = !isNaN(num) && num >= field.min;
      } else if (field.type === "date") {
        const today = new Date();
        const selected = new Date(value);
        today.setHours(0, 0, 0, 0);
        selected.setHours(0, 0, 0, 0);
        valid = value && selected >= today;
      }

      input.classList.toggle("is-valid", valid);
      input.classList.toggle("is-invalid", !valid);
      return valid;
    }

    function calculateTotal() {
      const quantity = parseInt(document.getElementById('quantity').value) || 0;
      const price = parseFloat(document.getElementById('price').value) || 0;
      document.getElementById('total').value = (quantity * price).toFixed(2);
    }
  });
</script>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

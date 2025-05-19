<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Gamuda.lk Admin - Orders</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    :root {
      --brand-main: #f85506;
      --brand-dark: #e24905;
      --brand-grad-1: #ffe3d3;
      --brand-grad-2: #ffd1b3;
    }

    body {
      background: #fcffff;
      font-family: 'Segoe UI', sans-serif;
    }

    .sidebar {
      height: 100vh;
      width: 220px;
      position: fixed;
      top: 0;
      left: 0;
      background: linear-gradient(135deg, var(--brand-grad-1), var(--brand-grad-2));
      padding-top: 60px;
      transition: transform 0.3s ease-in-out;
    }

    .sidebar a {
      padding: 15px;
      display: block;
      color: #fff;
      font-weight: bold;
      text-decoration: none;
    }

    .sidebar a:hover {
      background-color: var(--brand-dark);
    }

    .sidebar.collapsed {
      transform: translateX(-100%);
    }

    .content {
      margin-left: 230px;
      padding: 20px;
      transition: margin-left 0.3s ease-in-out;
    }

    .content.collapsed {
      margin-left: 0;
    }

    .menu-toggle {
      position: fixed;
      top: 15px;
      left: 15px;
      font-size: 24px;
      cursor: pointer;
      color: var(--brand-main);
      z-index: 1000;
    }

    @media (max-width: 768px) {
      .sidebar {
        transform: translateX(-100%);
      }
      .sidebar.show {
        transform: translateX(0);
      }
      .content {
        margin-left: 0;
      }
    }

    input[type="text"], input[type="email"], input[type="number"], input[type="date"], textarea {
      border: 2px solid var(--brand-main);
      border-radius: 12px;
      font-size: 0.9rem;
    }

    .btn-primary {
      background-color: var(--brand-main);
      border: none;
    }

    .btn-primary:hover {
      background-color: var(--brand-dark);
    }

    .modal-content {
      border-radius: 16px;
      border: 2px solid var(--brand-main);
      background: #fffaf7;
    }

    .modal-header, .modal-footer {
      background: var(--brand-grad-1);
    }
  </style>
</head>
<body>


<div class="content" id="mainContent">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4>📦 Orders Management</h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createOrderModal">+ Create New Order</button>
  </div>
</div>

<!-- Create Order Modal -->
<div class="modal fade" id="createOrderModal" tabindex="-1" aria-labelledby="createOrderLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" action="ManagerCreateServlet" method="post">
      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>
      <div class="modal-header">
        <h5 class="modal-title">➕ Create New Order</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-2">
          <label class="form-label">Customer Name</label>
          <input type="text" id="customerName" name="cusname" class="form-control" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Email Address</label>
          <input type="email" class="form-control" id="email" name="cusemail" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Product(s)</label>
          <input type="text" id="products" class="form-control" name="pid" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Date</label>
          <input type="date" class="form-control" id="orderDate" name="date" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Quantity</label>
          <input type="number" id="quantity" class="form-control" name="quantity" min="1" required oninput="calculateTotal()">
        </div>
        <div class="mb-2">
          <label class="form-label">Unit Price (Rs)</label>
          <input type="number" id="unitPrice" class="form-control" name="price" min="0" required oninput="calculateTotal()">
        </div>
        <div class="mb-2">
          <label class="form-label">Total</label>
          <input type="text" id="total" class="form-control" name="total" readonly>
        </div>
        <div class="mb-2">
          <label class="form-label">Delivery Address</label>
          <input type="text" class="form-control" id="address" name="cusadress" required>
          
          
        </div>
        <div class="mb-2">
          <label class="form-label">Contact Info</label>
          <input type="text" id="contact" name="cuscontact" class="form-control" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">🛒 Create Order</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
      </div>
    </form>
  </div>
</div>

<script>
  function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('mainContent');
    sidebar.classList.toggle('collapsed');
    content.classList.toggle('collapsed');
    if (window.innerWidth <= 768) {
      sidebar.classList.toggle('show');
    }
  }

  function calculateTotal() {
    const quantity = parseInt(document.getElementById('quantity').value) || 0;
    const unitPrice = parseFloat(document.getElementById('unitPrice').value) || 0;
    document.getElementById('total').value = (quantity * unitPrice).toFixed(2);
  }

  document.addEventListener("DOMContentLoaded", () => {
    const fields = [
      { id: "customerName", regex: /^[A-Za-z\s]+$/ },
      { id: "email", regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ },
      { id: "products", regex: /.+/ },
      { id: "orderDate", type: "date" },
      { id: "quantity", type: "number", min: 1 },
      { id: "unitPrice", type: "number", min: 0.01 },
      { id: "address", regex: /.+/ },
      { id: "contact", regex: /^[0-9+\-()\s]+$/ }
    ];

    fields.forEach(field => {
      const input = document.getElementById(field.id);
      if (input) {
        input.addEventListener("input", () => {
          validateInput(input, field);
          if (field.id === "quantity" || field.id === "unitPrice") calculateTotal();
        });
      }
    });
  });

  function validateInput(input, field) {
    let valid = false;
    if (field.regex) {
      valid = field.regex.test(input.value.trim());
    } else if (field.type === "number") {
      const value = parseFloat(input.value);
      valid = !isNaN(value) && value >= field.min;
    } else if (field.type === "date") {
      const today = new Date();
      const selected = new Date(input.value);
      today.setHours(0, 0, 0, 0);
      selected.setHours(0, 0, 0, 0);
      valid = input.value && selected >= today;
    }

    input.classList.toggle("is-valid", valid);
    input.classList.toggle("is-invalid", !valid);
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

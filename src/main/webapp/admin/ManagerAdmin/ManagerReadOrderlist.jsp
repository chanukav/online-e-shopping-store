<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Gamuda.lk Admin – Orders</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap + Font‑Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

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
		  min-height: 100vh;
		  padding: 40px 20px;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		}


    /* ─────── Wrapper (glass + gradient) ─────── */
	.update-wrapper {
	  width: 100%;
	  max-width: 1200px; /* Increased from 600px */
	  position: relative;
	  padding: 40px 32px;
	  border-radius: 28px;
	  overflow: hidden;
	  backdrop-filter: blur(18px);
	  box-shadow: 0 12px 40px rgba(0, 0, 0, .08);
	  margin: auto;
	}
	
	.update-wrapper::before {
	  content: "";
	  position: absolute;
	  inset: 0;
	  background: linear-gradient(135deg, var(--brand-grad-1), var(--brand-grad-2));
	  z-index: -1;
	}

    /* ─────── Header & Controls ─────── */
    
		    label {
		  font-weight: 600;
		  font-size: .9rem;
		}
		
		input[type="text"],
		input[type="email"],
		input[type="number"],
		input[type="date"],
		textarea {
		  border: 2px solid var(--brand-main);
		  border-radius: 12px;
		  font-size: .9rem;
		}

    .orders-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 20px;
      margin-bottom: 35px;
    }
    .orders-header h3 {
      font-weight: 700;
      color: var(--brand-main);
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .orders-controls {
      display: flex;
      align-items: center;
      gap: 0.6rem;
      flex-wrap: wrap;
    }
    .orders-controls select,
    .orders-controls input[type="text"] {
      border: 2px solid var(--brand-main);
      border-radius: 10px;
      padding: 0.35rem 0.6rem;
      font-size: 0.85rem;
      min-width: 130px;
    }
    .orders-controls input[type="text"] {
      width: 160px;
    }
    .btn-brand {
      background: var(--brand-main);
      color: #fff;
      border: none;
      font-size: 0.85rem;
      font-weight: 600;
      padding: 0.4rem 0.8rem;
      border-radius: 10px;
      transition: background 0.2s ease, transform 0.2s ease;
    }
    .btn-brand:hover {
      background: var(--brand-dark);
      transform: translateY(-2px);
    }

    /* ─────── Table ─────── */
    .table thead {
      background: var(--brand-main);
      color: #fff;
    }
    .table th,
    .table td {
      white-space: nowrap; /* no wrap at all */
      vertical-align: middle;
    }
    .table tbody tr:hover {
      background: rgba(0, 0, 0, 0.03);
    }
    .badge {
      font-size: 0.8rem;
    }

    /* Action‑button row */
    .action-btns {
      display: flex;
      flex-wrap: nowrap; /* single row, never wrap */
      gap: 4px;
    }
    .action-btns .btn {
      width: 90px;
      min-width: 90px;
      font-size: 0.72rem;
      padding: 0.33rem 0;
      border-radius: 8px;
    }

    @media (max-width: 768px) {
      .orders-wrapper {
        padding: 30px 20px;
      }
      .orders-header h3 {
        font-size: 1.25rem;
      }
      .orders-controls select,
      .orders-controls input[type="text"] {
        min-width: 100px;
        font-size: 0.8rem;
      }
      .orders-controls input[type="text"] {
        width: 120px;
      }
      .action-btns .btn {
        width: 90px; /* keep width so row scrolls horizontally if needed */
        font-size: 0.65rem;
      }
      .table-responsive {
        overflow-x: auto; /* allow scroll if cells overflow */
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
      
    }
  </style>
</head>
<body>
  <div class="update-wrapper animate__animated animate__fadeIn">
    <!-- Header -->
    <div class="orders-header">
      <h3><i class="fa-solid fa-box-open"></i> Orders Management</h3>
      <div class="orders-controls">
        <button class="btn btn-brand" data-bs-toggle="modal" data-bs-target="#createOrderModal">+ Create New Order</button>
        <select id="statusFilter" onchange="filterStatus()">
          <option value="">All</option>
          <option>Pending</option>
          <option>Shipped</option>
          <option>Delivered</option>
        </select>
        <input type="text" id="searchInput" placeholder="Search 🔍" oninput="searchOrders()" />
      </div>
    </div>

    <!-- Orders Table -->
    <div class="table-responsive">
      <table class="table align-middle mb-0">
        <thead>
          <tr>
            <th>Order&nbsp;ID</th>
            <th>Customer</th>
            <th>Date</th>
            <th>Status</th>
            <th>Total&nbsp;(Rs)</th>
            <th class="text-center">Actions</th>
          </tr>
        </thead>
        <tbody id="orderTable">
          <c:forEach var="cus" items="${orderList}">
            <tr data-status="${cus.status}">
              <td>${cus.formattedOrderId}</td>
              <td>${cus.cusname}</td>
              <td>${cus.date}</td>
              <td>
                <c:choose>
                  <c:when test="${cus.status == 'Pending'}"><span class="badge bg-warning text-dark">Pending</span></c:when>
                  <c:when test="${cus.status == 'Shipped'}"><span class="badge bg-primary">Shipped</span></c:when>
                  <c:when test="${cus.status == 'Delivered'}"><span class="badge bg-success">Delivered</span></c:when>
                  <c:otherwise><span class="badge bg-secondary">${cus.status}</span></c:otherwise>
                </c:choose>
              </td>
              <td>${cus.total}</td>
              <td class="action-btns">
                <a class="btn btn-info" href="ManagerViewOrderServlet?orderid=${cus.orderid}">View</a>

                <form action="ManagerUpdateOrder.jsp" method="post">
					    <input type="hidden" name="orderid" value="${cus.orderid}">
					    <input type="hidden" name="cusname" value="${cus.cusname}">
					    <input type="hidden" name="cusemail" value="${cus.cusemail}">
					    <input type="hidden" name="pid" value="${cus.pid}">
					    <input type="hidden" name="date" value="${cus.date}">
					    <input type="hidden" name="quantity" value="${cus.quantity}">
					    <input type="hidden" name="price" value="${cus.price}">
					    <input type="hidden" name="total" value="${cus.total}">
					    <input type="hidden" name="cusadress" value="${cus.cusadress}">
					    <input type="hidden" name="cuscontact" value="${cus.cuscontact}">
					    
					    <input class="btn btn-warning" type="submit"  value="✏ Update">
					    
					    </form>

                <form action="ManagerDeleteOrderServlet" method="post">
                  <input type="hidden" name="orderid" value="${cus.orderid}" />
                  <button class="btn btn-danger" type="submit" onclick="return confirm('Are you sure you want to delete this order?');">Cancel</button>
                </form>
               
                

                <form action="updateStatus" method="post">
                  <input type="hidden" name="orderid" value="${cus.orderid}" />
                  <input type="hidden" name="status" value="Shipped" />
                  <button class="btn btn-outline-primary" type="submit">Shipped</button>
                </form>

                <form action="updateStatus" method="post">
                  <input type="hidden" name="orderid" value="${cus.orderid}" />
                  <input type="hidden" name="status" value="Delivered" />
                  <button class="btn btn-outline-success" type="submit">Delivered</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <a href="ManagerHome.jsp" class="btn btn-secondary mt-3">← Back</a>
  </div>

  <!-- Create Order Modal -->
<div class="modal fade" id="createOrderModal" tabindex="-1" aria-labelledby="createOrderLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content p-0 border-0">
      <div class="update-wrapper">
        <form class="needs-validation" action="ManagerCreateServlet" method="post" >
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>

          <h3 class="mb-3"><i class="fa-solid fa-cart-plus"></i> Create New Order</h3>

          <div class="mb-2">
            <label class="form-label">Customer Name</label>
            <input type="text" id="cusname" name="cusname" class="form-control" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Email Address</label>
            <input type="email" class="form-control" id="cusemail" name="cusemail" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Product(s)</label>
            <input type="text" id="pid" class="form-control" name="pid" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Date</label>
            <input type="date" class="form-control" id="date" name="date" required>
          </div>

          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Quantity</label>
              <input type="number" id="quantity" class="form-control" name="quantity" min="1" required oninput="calculateTotal()">
            </div>
            <div class="col-md-6">
              <label class="form-label">Unit Price (Rs)</label>
              <input type="number" id="price" class="form-control" name="price" min="0" required oninput="calculateTotal()">
            </div>
          </div>

          <div class="mb-2 mt-3">
            <label class="form-label">Total</label>
            <input type="text" id="total" class="form-control" name="total" readonly>
          </div>

          <div class="mb-2">
            <label class="form-label">Delivery Address</label>
            <input type="text" class="form-control" id="cusadress" name="cusadress" required>
          </div>

          <div class="mb-4">
            <label class="form-label">Contact Info</label>
            <input type="text" id="cuscontact" name="cuscontact" class="form-control" required>
          </div>

          <div class="d-flex gap-2 justify-content-end">
            <button type="submit" class="btn btn-brand">🛒 Create Order</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>

<!-- END: Create New Order Modal -->

<!-- END: Create New Order Wrapper -->


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  

  function calculateTotal() {
    const quantity = parseInt(document.getElementById('quantity').value) || 0;
    const unitPrice = parseFloat(document.getElementById('price').value) || 0;
    document.getElementById('total').value = (quantity * unitPrice).toFixed(2);
  }


  document.addEventListener("DOMContentLoaded", () => {
	  const fields = [
		  { id: "cusname", regex: /^[A-Za-z\s]+$/ },
		  { id: "cusemail", regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ },
		  { id: "pid", regex: /.+/ },
		  { id: "date", type: "date" },
		  { id: "quantity", type: "number", min: 1 },
		  { id: "price", type: "number", min: 0.01 },
		  { id: "cusadress", regex: /.+/ },
		  { id: "cuscontact", regex: /^0\d{9}$/ } // ✅ Starts with 0 and has exactly 10 digits
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
	  
	  function filterStatus() {
		    const selected = document.getElementById('statusFilter').value.toLowerCase();
		    const rows = document.querySelectorAll('#orderTable tr');
		    rows.forEach(row => {
		      const status = row.getAttribute('data-status').toLowerCase();
		      row.style.display = selected === "" || status === selected ? "" : "none";
		    });
		  }

		  function searchOrders() {
		    const query = document.getElementById('searchInput').value.toLowerCase();
		    const rows = document.querySelectorAll('#orderTable tr');
		    rows.forEach(row => {
		      row.style.display = row.innerText.toLowerCase().includes(query) ? "" : "none";
		    });
		  }
		  function viewOrder(orderId) {
		  window.location.href = "ManagerViewOrderServlet?orderid=" + orderId;
		}
		  function updateOrder(orderId) {
			  window.location.href = "ManagerUpdateOrderServlet?orderid=" + orderId;
			}
  </script>
</body>
</html>

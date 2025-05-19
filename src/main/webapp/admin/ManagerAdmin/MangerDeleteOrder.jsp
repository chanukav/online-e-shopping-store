<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Gamuda.lk Admin - Orders</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .sidebar {
      height: 100vh;
      width: 220px;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #343a40;
      padding-top: 60px;
      transition: transform 0.3s ease-in-out;
    }

    .sidebar a {
      padding: 15px;
      display: block;
      color: #fff;
      text-decoration: none;
    }

    .sidebar a:hover {
      background-color: #495057;
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
      color: #343a40;
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

    .action-btns button {
      margin-right: 5px;
    }
  </style>
</head>
<body>

<!-- Menu Toggle -->
<div class="menu-toggle" onclick="toggleSidebar()">☰</div>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
  <a href="#">🏠 Dashboard</a>
  <a href="#">📦 Orders</a>
  <a href="#">📄 Products</a>
  <a href="#">👥 Customers</a>
  <a href="#">⚙️ Settings</a>
  <a href="#">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="content" id="mainContent">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4>📦 Orders Management</h4>
    <div>
      <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#createOrderModal">+ Create New Order</button>
      <select class="form-select d-inline w-auto" id="statusFilter" onchange="filterStatus()">
        <option value="">All Status</option>
        <option>Pending</option>
        <option>Shipped</option>
        <option>Delivered</option>
      </select>
      <input type="text" id="searchInput" class="form-control d-inline w-auto ms-2" placeholder="Search 🔍" oninput="searchOrders()">
    </div>
  </div>

  <div class="table-responsive">
    <table class="table table-striped align-middle">
      <thead class="table-dark">
        <tr>
          <th>Order ID</th>
          <th>Customer</th>
          <th>Date</th>
          <th>Status</th>
          <th>Total (Rs)</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody id="orderTable">
        <tr data-status="Shipped">
          <td>#1023</td>
          <td>John Doe</td>
          <td>2025-05-09</td>
          <td>Shipped</td>
          <td>4500.00</td>
          <td class="action-btns">
            <button class="btn btn-sm btn-info">👁 View</button>
            <button class="btn btn-sm btn-outline-secondary" onclick="openCancelModal(this)">🛑 Cancel</button>
          </td>
        </tr>
        <tr data-status="Pending">
          <td>#1024</td>
          <td>Jane Doe</td>
          <td>2025-05-10</td>
          <td>Pending</td>
          <td>2200.00</td>
          <td class="action-btns">
            <button class="btn btn-sm btn-warning" onclick="openUpdateModal(this)">✏ Update</button>
            <button class="btn btn-sm btn-outline-secondary" onclick="openCancelModal(this)">🛑 Cancel</button>
          </td>
        </tr>
        <tr data-status="Delivered">
          <td>#1025</td>
          <td>Max Lee</td>
          <td>2025-05-08</td>
          <td>Delivered</td>
          <td>3200.00</td>
          <td class="action-btns">
            <button class="btn btn-sm btn-danger">↩ Refund</button>
            <button class="btn btn-sm btn-outline-secondary" onclick="openCancelModal(this)">🛑 Cancel</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<!-- Create Order Modal -->
<div class="modal fade" id="createOrderModal" tabindex="-1" aria-labelledby="createOrderLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" onsubmit="submitOrder(event)">
      <div class="modal-header">
        <h5 class="modal-title">➕ Create New Order</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-2">
          <label class="form-label">Customer Name</label>
          <input type="text" id="customerName" class="form-control" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Product(s)</label>
          <input type="text" id="products" class="form-control" placeholder="Add Products" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Quantity</label>
          <input type="number" id="quantity" class="form-control" value="1" min="1" required oninput="calculateTotal()">
        </div>
        <div class="mb-2">
          <label class="form-label">Unit Price (Rs)</label>
          <input type="number" id="unitPrice" class="form-control" value="0" min="0" required oninput="calculateTotal()">
        </div>
        <div class="mb-2">
          <label class="form-label">Total (Auto-calc)</label>
          <input type="text" id="total" class="form-control" readonly>
        </div>
        <div class="mb-2">
          <label class="form-label">Delivery Address</label>
          <textarea id="address" class="form-control" required></textarea>
        </div>
        <div class="mb-2">
          <label class="form-label">Contact Info</label>
          <input type="text" id="contact" class="form-control" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success">🛒 Create Order</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
      </div>
    </form>
  </div>
</div>


<!-- Update Order Modal -->
<div class="modal fade" id="updateOrderModal" tabindex="-1" aria-labelledby="updateOrderLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" onsubmit="saveOrderUpdate(event)">
      <div class="modal-header">
        <h5 class="modal-title">🔄 Update Order <span id="updateOrderId">#XXXX</span></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" id="hiddenOrderRowId">
        <div class="mb-2">
          <label class="form-label">Status</label>
          <select class="form-select" id="orderStatusSelect">
            <option>Pending</option>
            <option>Confirmed</option>
            <option>Shipped</option>
            <option>Delivered</option>
          </select>
        </div>
        <div class="mb-2">
          <label class="form-label">Tracking Info</label>
          <input type="text" id="trackingInfo" class="form-control" placeholder="Enter tracking number or note">
        </div>
        <div class="mb-2">
          <label class="form-label">Estimated Delivery</label>
          <input type="date" id="estimatedDelivery" class="form-control">
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success">✔ Save Changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">✖ Cancel</button>
      </div>
    </form>
  </div>
</div>


<!-- Cancel Order Modal -->
<div class="modal fade" id="cancelOrderModal" tabindex="-1" aria-labelledby="cancelOrderLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form class="modal-content" onsubmit="cancelOrder(event)">
      <div class="modal-header">
        <h5 class="modal-title">🛑 Cancel Order <span id="cancelOrderId">#XXXX</span></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" id="cancelOrderRowId">
        <div class="mb-3">
          <label for="cancelReason" class="form-label">Reason for Cancellation (optional)</label>
          <textarea id="cancelReason" class="form-control" rows="3" placeholder="E.g., customer request, stock issue..."></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger">🛑 Confirm Cancel</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">✖ Close</button>
      </div>
    </form>
  </div>
</div>


<!-- Scripts -->
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

  function submitOrder(event) {
    event.preventDefault();

    const name = document.getElementById('customerName').value;
    const date = new Date().toISOString().split('T')[0];
    const status = "Pending";
    const total = document.getElementById('total').value;

    const newRow = `
      <tr data-status="${status}">
        <td>#NEW</td>
        <td>${name}</td>
        <td>${date}</td>
        <td>${status}</td>
        <td>${total}</td>
        <td class="action-btns">
          <button class="btn btn-sm btn-info">👁 View</button>
          <button class="btn btn-sm btn-warning">✏ Update</button>
          <button class="btn btn-sm btn-danger">↩ Refund</button>
        </td>
      </tr>`;

    document.getElementById('orderTable').insertAdjacentHTML('beforeend', newRow);
    bootstrap.Modal.getInstance(document.getElementById('createOrderModal')).hide();
    event.target.reset();
    document.getElementById('total').value = "";
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
  function openUpdateModal(button) {
  const row = button.closest('tr');
  const orderId = row.cells[0].textContent;
  const currentStatus = row.cells[3].textContent;

  document.getElementById('updateOrderId').textContent = orderId;
  document.getElementById('orderStatusSelect').value = currentStatus;
  document.getElementById('hiddenOrderRowId').value = orderId;

  new bootstrap.Modal(document.getElementById('updateOrderModal')).show();
}

function saveOrderUpdate(event) {
  event.preventDefault();
  const orderId = document.getElementById('hiddenOrderRowId').value;
  const newStatus = document.getElementById('orderStatusSelect').value;

  const rows = document.querySelectorAll('#orderTable tr');
  rows.forEach(row => {
    if (row.cells[0].textContent === orderId) {
      row.cells[3].textContent = newStatus;
      row.setAttribute('data-status', newStatus);
    }
  });

  bootstrap.Modal.getInstance(document.getElementById('updateOrderModal')).hide();
}

function openCancelModal(button) {
	  const row = button.closest('tr');
	  const orderId = row.cells[0].textContent;

	  document.getElementById('cancelOrderId').textContent = orderId;
	  document.getElementById('cancelOrderRowId').value = orderId;
	  document.getElementById('cancelReason').value = "";

	  new bootstrap.Modal(document.getElementById('cancelOrderModal')).show();
	}

	function cancelOrder(event) {
	  event.preventDefault();
	  const orderId = document.getElementById('cancelOrderRowId').value;
	  const reason = document.getElementById('cancelReason').value;

	  const rows = document.querySelectorAll('#orderTable tr');
	  rows.forEach(row => {
	    if (row.cells[0].textContent === orderId) {
	      row.remove();
	    }
	  });

	  bootstrap.Modal.getInstance(document.getElementById('cancelOrderModal')).hide();

	  alert(`Order ${orderId} has been cancelled.` + (reason ? `\nReason: ${reason}` : ""));
	}

</script>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    
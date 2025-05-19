<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Manager" %>
<%
  Manager order = (Manager) request.getAttribute("order");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Order – Gamuda.lk Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap + Font‑Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

  <style>
    :root{
      --brand-main:#f85506;
      --brand-dark:#e24905;
      --brand-grad-1:#ffe3d3;
      --brand-grad-2:#ffd1b3;
    }

    body{
      background:#fcffff;
      font-family:'Segoe UI',sans-serif;
      min-height:100vh;
      display:flex;
      justify-content:center;
      align-items:center;
      padding:40px 20px;
    }

    /*──── Glassy card ────*/
    .view-wrapper{
      width:100%;
      max-width:600px;
      position:relative;
      padding:40px 32px;
      border-radius:28px;
      overflow:hidden;
      backdrop-filter:blur(18px);
      box-shadow:0 12px 40px rgba(0,0,0,.08);
    }
    .view-wrapper::before{content:"";position:absolute;inset:0;background:linear-gradient(135deg,var(--brand-grad-1),var(--brand-grad-2));z-index:-1;}

    h3{color:var(--brand-main);font-weight:700;margin-bottom:25px;display:flex;align-items:center;gap:10px;}

    label{font-weight:600;font-size:.9rem;}
    .form-control,textarea{
      border:2px solid var(--brand-main);
      border-radius:12px;
      font-size:.9rem;
      background:#ffffff90;
      pointer-events:none;
    }
    textarea{min-height:80px;resize:none;}

    .btn-brand{background:var(--brand-main);color:#fff;border:none;font-weight:600;padding:.45rem 1.1rem;border-radius:12px;transition:background .2s ease,transform .2s ease;font-size:.9rem;}
    .btn-brand:hover{background:var(--brand-dark);transform:translateY(-2px);}
  </style>
</head>
<body>
  <div class="view-wrapper animate__animated animate__fadeIn">
    <h3><i class="fa-solid fa-eye"></i> Order Details – ID: <%= order.getOrderid() %></h3>

    <div class="mb-3">
      <label class="form-label">Customer Name</label>
      <input class="form-control" value="<%= order.getCusname() %>" readonly />
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input class="form-control" value="<%= order.getCusemail() %>" readonly />
    </div>
    <div class="mb-3">
      <label class="form-label">Product ID(s)</label>
      <input class="form-control" value="<%= order.getPid() %>" readonly />
    </div>
    <div class="mb-3">
      <label class="form-label">Date</label>
      <input type="date" class="form-control" value="<%= order.getDate() %>" readonly />
    </div>
    <div class="row g-3">
      <div class="col-md-6">
        <label class="form-label">Quantity</label>
        <input type="number" class="form-control" value="<%= order.getQuantity() %>" readonly />
      </div>
      <div class="col-md-6">
        <label class="form-label">Unit Price (Rs)</label>
        <input type="number" class="form-control" value="<%= order.getPrice() %>" readonly />
      </div>
    </div>
    <div class="mb-3 mt-3">
      <label class="form-label">Total</label>
      <input type="number" class="form-control" value="<%= order.getTotal() %>" readonly />
    </div>
    <div class="mb-3">
      <label class="form-label">Delivery Address</label>
      
       <input type="text" class="form-control" value="<%= order.getCusadress() %>"  readonly />
    </div>
    <div class="mb-4">
      <label class="form-label">Contact Info</label>
      <input class="form-control" value="<%= order.getCuscontact() %>" readonly />
    </div>

    <a href="ManagerReadServlet" class="btn btn-brand">← Back to Orders</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

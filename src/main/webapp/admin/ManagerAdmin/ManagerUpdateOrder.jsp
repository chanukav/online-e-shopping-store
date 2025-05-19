<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Order – Gamuda.lk Admin</title>
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

    /*─── Glassy card ───*/
    .update-wrapper{
      width:100%;
      max-width:600px;
      position:relative;
      padding:40px 32px;
      border-radius:28px;
      overflow:hidden;
      backdrop-filter:blur(18px);
      box-shadow:0 12px 40px rgba(0,0,0,.08);
    }
    .update-wrapper::before{content:"";
    position:absolute;
    inset:0;
    background:linear-gradient(135deg,var(--brand-grad-1),var(--brand-grad-2));
    z-index:-1;}

    h3{
    color:var(--brand-main);
    font-weight:700;
    margin-bottom:25px;
    display:flex;
    align-items:center;
    gap:10px;}

    label{font-weight:600;font-size:.9rem;}
    input[type="text"],input[type="email"],input[type="number"],input[type="date"],textarea{
      border:2px solid var(--brand-main);
      border-radius:12px;
      font-size:.9rem;
    }

    textarea{min-height:80px;}

    .btn-brand{
      background:var(--brand-main);
      color:#fff;
      border:none;
      font-weight:600;
      padding:.45rem 1.1rem;
      border-radius:12px;
      transition:background .2s ease,transform .2s ease;
      font-size:.9rem;
    }
    .btn-brand:hover{
    background:var(--brand-dark);
    transform:translateY(-2px);
    }  
  </style>
</head>
<body>

  <div class="update-wrapper animate__animated animate__fadeIn">
    <h3><i class="fa-solid fa-pen-to-square"></i> Update Order</h3>
    <form action="ManagerUpdateOrderServlet" method="post" class="needs-validation" novalidate>
      <input type="hidden" name="orderid" value="${param.orderid}" />
		
      <div class="mb-3">
        <label class="form-label">Customer Name</label>
        <input type="text" class="form-control" id="cusname" name="cusname" value="${param.cusname}" required />
      </div>

      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" id="cusemail" name="cusemail" value="${param.cusemail}" required />
      </div>

      <div class="mb-3">
        <label class="form-label">Product ID(s)</label>
        <input type="text" class="form-control" name="pid" id="pid" value="${param.pid}" required readonly/>
      </div>

      <div class="mb-3">
        <label class="form-label">Date</label>
        <input type="date" class="form-control" name="date" id="date" value="${param.date}" required />
      </div>

      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Quantity</label>
          <input type="number" class="form-control" id="quantity" name="quantity" value="${param.quantity}" min="1" oninput="calcTotal()" required />
        </div>
        <div class="col-md-6">
          <label class="form-label">Unit Price (Rs)</label>
          <input type="number" class="form-control" id="price" name="price" value="${param.price}" min="0" oninput="calcTotal()" required />
        </div>
      </div>

      <div class="mb-3 mt-3">
        <label class="form-label">Total (Auto)</label>
        <input type="number" class="form-control" id="total" name="total" value="${param.total}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">Delivery Address</label>
        <input type="text" class="form-control" id="cusadress" name="cusadress" value="${param.cusadress}"  />
      </div>

      <div class="mb-4">
        <label class="form-label">Contact Info</label>
        <input type="text" class="form-control" id="cuscontact" name="cuscontact" value="${param.cuscontact}" required />
      </div>

      <div class="d-flex gap-2">
        <button type="submit" class="btn btn-brand">💾 Save</button>
        <a href="ManagerReadServlet" class="btn btn-secondary">← Back</a>
      </div>
    </form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
      const unitPrice = parseFloat(document.getElementById('price').value) || 0;
      document.getElementById('total').value = (quantity * unitPrice).toFixed(2);
    }
  });
</script>

</body>
</html>

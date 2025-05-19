


<style>
  .footer-container {
    background-color: #fff4e5;
    padding: 10px;
    text-align: center;
    font-family: 'Segoe UI', sans-serif;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.05);
    margin-top: 10px;
  }

  .footer-links {
    margin-bottom: 15px;
  }

  .footer-links a {
    margin: 0 12px;
    color: #f85506;
    text-decoration: none;
    font-weight: 600;
    transition: color 0.3s ease;
  }

  .footer-links a:hover {
    color: #fe980f;
  }

  .footer-contact {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
  }

  .footer-logo {
    font-size: 22px;
    font-weight: bold;
    color: #f85506;
    margin-bottom: 8px;
  }

  .footer-bottom {
    font-size: 12px;
    color: #999;
  }
</style>


<!-- Footer HTML -->
<div class="footer-container">
  <div class="footer-logo">Gamuda.LK</div>
  
  <div class="footer-links">
    <a href="<%=request.getContextPath()%>/homeindex.jsp">Home</a>
    <a href="<%=request.getContextPath()%>/shop.jsp">Shop</a>
    <a href="<%=request.getContextPath()%>/contact.jsp">Contact</a>
    <a href="<%=request.getContextPath()%>/faq.jsp">FAQ</a>
  </div>

  <div class="footer-contact">
    Customer Support: support@gamuda.lk | Hotline: +94 112 345 678
  </div>

  <div class="footer-bottom">
    &copy; <%= new java.util.Date().getYear() + 1900 %> Gamuda.LK. All rights reserved.
  </div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Header Style -->
<style>
  .header-container {
    background-color:  #fff4e5;
    padding: 20px 30px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .logo-full {
    font-size: 28px;
    font-weight: 800;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(90deg, #fe980f, #f85506);
    background-size: 200% auto;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: shine 2.5s linear infinite;
    letter-spacing: 1px;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
    text-decoration: none;
    display: inline-block;
  }

  .logo-full:hover {
    transform: scale(1.05);
  }

  @keyframes shine {
    0% { background-position: 0% center; }
    100% { background-position: 200% center; }
  }
</style>

<!-- Header HTML -->
<div class="header-container">
  <a href="<%=request.getContextPath()%>/homeindex.jsp" class="logo-full">
    Gamuda.LK
  </a>
</div>

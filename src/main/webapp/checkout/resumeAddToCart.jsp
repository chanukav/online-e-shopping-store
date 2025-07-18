<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resuming Add to Cart</title>
</head>
<body>
    <form id="resumeForm" action="${pageContext.request.contextPath}/AddToCart" method="post">
        <input type="hidden" name="productId" value="${productId}" />
        <input type="hidden" name="productName" value="${productName}" />
        <input type="hidden" name="productPrice" value="${productPrice}" />
        <input type="hidden" name="quantity" value="${quantity}" />
    </form>
    <script>
        document.getElementById("resumeForm").submit();
    </script>
</body>
</html>

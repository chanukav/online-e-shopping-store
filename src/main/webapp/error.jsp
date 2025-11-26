<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Something went wrong</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        .error-card {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 420px;
        }
        h1 {
            margin-bottom: 0.5rem;
            color: #e53935;
        }
        p {
            margin-bottom: 1.5rem;
        }
        a {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            border-radius: 4px;
            background-color: #ff6b00;
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="error-card">
        <h1>Oops!</h1>
        <p>We couldn’t figure out where to send you. Please go back and try again.</p>
        <a href="<%= request.getContextPath() %>/index.jsp">Return Home</a>
    </div>
</body>
</html>




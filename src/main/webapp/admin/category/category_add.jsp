<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f7;
        }
        .form-container {
            width: 400px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        textarea {
            resize: vertical;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: white;
            font-weight: bold;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Add New Category</h2>
        <form action="Add_Category" method="post">
            <label for="name">Category Name</label>
            <input type="text" name="name" id="name" required>

            <label for="description">Description</label>
            <textarea name="description" id="description" rows="4" required></textarea>

            <input type="submit" value="Add_Category">
        </form>
    </div>
</body>
</html>

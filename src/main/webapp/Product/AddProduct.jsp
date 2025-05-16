<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product - GAMUDA.LK</title>
    <style>
        :root {
            --primary: #ff6b00;
            --secondary: #333;
            --light: #f8f9fa;
            --dark: #212529;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: var(--dark);
            background-color: #f5f5f5;
        }
        
        header {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .form-container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        h1 {
            color: var(--primary);
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        
        input, select, textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .form-row {
            display: flex;
            gap: 1rem;
        }
        
        .form-col {
            flex: 1;
        }
        
        .image-upload {
            border: 2px dashed #ddd;
            padding: 2rem;
            text-align: center;
            border-radius: 4px;
        }
        
        .btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: 600;
        }
        
        .variants-container {
            margin-top: 1rem;
        }
        
        .variant {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            align-items: flex-end;
        }
        
        .remove-variant {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 0.5rem;
            border-radius: 4px;
        }
        
        .add-variant {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <header>
        <div class="navbar">
            <div class="logo">GAMUDA.LK</div>
            <div class="user-actions">
                <a href="index.html" style="color: white; text-decoration: none;">Back to Store</a>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="form-container">
            <h1>Add New Product</h1>
            
            <form id="productForm" action="SaveProduct" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name*</label>
                    <input type="text" id="productName" name="productName" required>
                </div>
                
                <div class="form-group">
                    <label for="productCategory">Category*</label>
                    <select id="productCategory" name="productCategory" required>
                        <option value="">Select a category</option>
                        <option value="electronics">Electronics</option>
                        <option value="fashion">Fashion</option>
                        <option value="home">Home & Garden</option>
                        <option value="beauty">Beauty</option>
                        <option value="sports">Sports</option>
                        <option value="toys">Toys & Games</option>
                        <option value="food">Food & Beverages</option>
                        <option value="health">Health & Wellness</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="productDescription">Description*</label>
                    <textarea id="productDescription" name="productDescription" required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="productImages">Product Images*</label>
                    <div class="image-upload">
                        <input type="file" id="productImages" name="productImages"  accept="image/*" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productPrice">Price*</label>
                            <input type="number" id="productPrice" name="productPrice" min="0" step="0.01" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productStock">Stock Quantity*</label>
                            <input type="number" id="productStock" name="productStock" min="0" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="productBrand">Brand</label>
                    <input type="text" id="productBrand" name="productBrand">
                </div>
                
                <button type="submit" class="btn">Submit Product</button>
            </form>
        </div>
    </div>
</body>
</html>
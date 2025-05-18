<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Product - GAMUDA.LK</title>
    <style>
        :root {
            --primary: #ff6b00;
            --secondary: #333;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
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
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            box-sizing: border-box;
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
            cursor: pointer;
        }

        .btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #e65a00;
        }
       input[readonly] {
   	  background-color: #f5f5f5;
      border: 1px dashed red;
      color: #666;
      cursor: not-allowed;
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
            <h1>Update Product</h1>

            <form id="productForm" action="UpdateProduct" method="POST" enctype="multipart/form-data">


                <div class="form-group">
                    <label for="productId">Product ID</label>
                    <input type="text" id="productId" name="pid" readonly value="${param.pid}">
                </div>


                <div class="form-group">
                    <label for="productName">Product Name*</label>
                    <input type="text" id="productName" name="prodName" required value="${param.prodName}">
                </div>


                <div class="form-group">
                    <label for="productCategory">Category*</label>
                    <select id="productCategory" name="category" required>
                        <option value="">Select Category</option>
                        <option value="electronics" ${param.category == 'electronics' ? 'selected' : ''}>Electronics</option>
                        <option value="fashion" ${param.category == 'fashion' ? 'selected' : ''}>Fashion</option>
                        <option value="home" ${param.category == 'home' ? 'selected' : ''}>Home & Garden</option>
                        <option value="beauty" ${param.category == 'beauty' ? 'selected' : ''}>Beauty</option>
                        <option value="sports" ${param.category == 'sports' ? 'selected' : ''}>Sports</option>
                        <option value="toys" ${param.category == 'toys' ? 'selected' : ''}>Toys & Games</option>
                        <option value="food" ${param.category == 'food' ? 'selected' : ''}>Food & Beverages</option>
                        <option value="health" ${param.category == 'health' ? 'selected' : ''}>Health & Wellness</option>
                    </select>
                </div>


                <div class="form-group">
                    <label for="productDescription">Description*</label>
                    <textarea id="productDescription" name="descrip" required>${param.descrip}</textarea>
                </div>


                <div class="form-group">
                    <label for="productImages">Product Image*</label>
                    <div class="image-upload">
                        <input type="file" id="productImages" name="pimg" accept="image/*">

                    </div>
                 </div>

                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productPrice">Price* (Rs.)</label>
                            <input type="number" id="productPrice" name="pprice" min="0" step="0.01" required value="${param.pprice}">
                        </div>
                    </div>

                    <div class="form-col">
                        <div class="form-group">
                            <label for="productStock">Stock Quantity*</label>
                            <input type="number" id="productStock" name="pstock" min="0" required value="${param.pstock}">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productBrand">Brand</label>
                    <input type="text" id="productBrand" name="pbrand" value="${param.pbrand}">
                </div>

                <button type="submit" class="btn">Update  Product</button>
            </form>
        </div>
    </div>
    <script>
function validateField(field) {
    const id = field.id;
    let isValid = true;

    if (id === "productName") {
        const regex = /^[A-Za-z\s]+$/;
        isValid = regex.test(field.value.trim());
    } else if (id === "productDescription" || id === "productBrand") {
        isValid = field.value.trim() !== "";
    } else if (id === "productCategory") {
        isValid = field.value !== "";
    } else if (id === "productPrice") {
        const price = parseFloat(field.value);
        isValid = !isNaN(price) && price >= 0;
    } else if (id === "productStock") {
        const stock = parseInt(field.value);
        isValid = !isNaN(stock) && stock >= 0;
    } else if (id === "productImages") {
        isValid = field.files && field.files.length > 0;
    }

    // Apply class for visual feedback
    field.classList.remove('valid', 'invalid');
    if (isValid) {
        field.classList.add('valid');
    } else {
        field.classList.add('invalid');
    }

    return isValid;
}

document.getElementById('productForm').addEventListener('submit', function(event) {
    let isValid = true;
    const fields = [
        "productName",
        "productCategory",
        "productDescription",
        "productImages",
        "productPrice",
        "productStock"
    ];

    fields.forEach(id => {
        const field = document.getElementById(id);
        const valid = validateField(field);
        if (!valid) isValid = false;
    });
});
</script>
</body>
</html>

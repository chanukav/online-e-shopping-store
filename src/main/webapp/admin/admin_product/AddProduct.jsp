<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
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

        .valid {
            border-color: green !important;
         }

        .invalid {
            border-color: red !important;
        }
    </style>
</head>
<body>
    

    <div class="container">
        <div class="form-container">
            <h1>Add New Product</h1>

            <form id="productForm" action="<%=request.getContextPath()%>/SaveProduct" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name*</label>
                    <input type="text" id="productName" name="productName" required onkeyup="validateField(this)">
                </div>

			    <div class="form-group">
			        <label for="productCategory">Category*</label>
			        <select id="productCategory" name="productCategory" required class="form-control">
			            <option value="">Select a category</option>
			            <c:forEach var="category" items="${categories}">
			                <option value="${category.categoryId}">${category.name}</option>
			            </c:forEach>
			        </select>
			    </div>

                <div class="form-group">
                    <label for="productDescription">Description*</label>
                    <textarea id="productDescription" name="productDescription" required onkeyup="validateField(this)"></textarea>
                </div>

                <div class="form-group">
                    <label for="productImages">Product Images*</label>
                    <div class="image-upload">
                        <input type="file" id="productImages" name="productImages" accept="image/*" required onchange="validateField(this)">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productPrice">Price*</label>
                            <input type="number" id="productPrice" name="productPrice" min="0" step="0.01" required onkeyup="validateField(this)">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productStock">Stock Quantity*</label>
                            <input type="number" id="productStock" name="productStock" min="0" required onkeyup="validateField(this)">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productBrand">Brand</label>
                    <input type="text" id="productBrand" name="productBrand" onkeyup="validateField(this)">
                </div>

                <button type="submit" class="btn">Submit Product</button>
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

    if (!isValid) {
        event.preventDefault();
        alert("Please correct the highlighted fields before submitting.");
    }
});
</script>
</body>
</html>

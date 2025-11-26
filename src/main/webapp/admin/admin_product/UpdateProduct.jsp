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

        .valid {
            border-color: green !important;
        }

        .invalid {
            border-color: red !important;
        }
    </style>
</head>
<body>

<%
    String rawImageParam = request.getParameter("pimg");
    String currentImageFile = rawImageParam;
    if (currentImageFile != null) {
        currentImageFile = currentImageFile.replace("\\", "/");
        int lastSlash = currentImageFile.lastIndexOf('/');
        if (lastSlash >= 0) {
            currentImageFile = currentImageFile.substring(lastSlash + 1);
        }
        if (currentImageFile.isEmpty()) {
            currentImageFile = null;
        }
    }

    String currentImageSrc = null;
    if (currentImageFile != null) {
        currentImageSrc = request.getContextPath() + "/images/" + currentImageFile;
    }
    request.setAttribute("currentImageFile", currentImageFile);
    request.setAttribute("currentImageSrc", currentImageSrc);
%>

    <div class="container">
        <div class="form-container">
            <h1>Update Product</h1>

            <form id="productForm"
                  action="<%=request.getContextPath()%>/UpdateProduct"
                  method="POST"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label for="productId">Product ID</label>
                    <input type="text" id="productId" name="pid"
                           readonly value="${param.pid}">
                </div>

                <div class="form-group">
                    <label for="productName">Product Name*</label>
                    <input type="text" id="productName" name="prodName"
                           required value="${param.prodName}">
                </div>

                <div class="form-group">
                    <label for="productCategory">Category*</label>
                    <select id="productCategory" name="category"
                            required class="form-control">
                        <option value="">Select Category</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.categoryId}"
                                ${category.categoryId == param.category ? 'selected' : ''}>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="productDescription">Description*</label>
                    <textarea id="productDescription" name="descrip"
                              required>${param.descrip}</textarea>
                </div>

                <!-- Show current image -->
                <c:if test="${not empty currentImageSrc}">
                    <div class="form-group">
                        <label>Current Image</label><br>
                        <img src="${currentImageSrc}"
                             width="120" alt="Current Image" />
                    </div>
                </c:if>

                <!-- Preserve old image path if no new file is chosen -->
                <input type="hidden" name="existingPimg" value="${currentImageFile}"/>

                <div class="form-group">
                    <label for="productImages">Upload New Image (optional)</label>
                    <div class="image-upload">
                        <input type="file" id="productImages" name="pimg"
                               accept="image/*">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="productPrice">Price* (Rs.)</label>
                            <input type="number" id="productPrice" name="pprice"
                                   min="0" step="0.01" required value="${param.pprice}">
                        </div>
                    </div>

                    <div class="form-col">
                        <div class="form-group">
                            <label for="productStock">Stock Quantity*</label>
                            <input type="number" id="productStock" name="pstock"
                                   min="0" required value="${param.pstock}">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productBrand">Brand</label>
                    <input type="text" id="productBrand" name="pbrand"
                           value="${param.pbrand}">
                </div>

                <button type="submit" class="btn">Update Product</button>
            </form>
        </div>
    </div>

<script>
function validateField(field) {
    const id = field.id;
    let isValid = true;

    if (id === "productName") {
        isValid = field.value.trim() !== "";
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
    }
    // productImages is OPTIONAL on update, so we don't validate it as required

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
        "productPrice",
        "productStock"
        // NOT including "productImages" here (optional)
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

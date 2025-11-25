package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.Product;
import services.CategoryService;
import services.ProductService;

/**
 * Servlet implementation class ProductByCategoryServlet
 */
@WebServlet("/productsByCategory")
public class ProductByCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    Category selectedCategory = null;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String catIdParam = request.getParameter("categoryId");
        if (catIdParam != null && !catIdParam.isEmpty()) {
            int categoryId = Integer.parseInt(catIdParam);
            List<Product> products = null;
            try {
                products = ProductService.getProductsByCategoryId(categoryId);
                selectedCategory = CategoryService.getCategoryById(categoryId);
                request.setAttribute("selectedCategoryId", categoryId); // ✅ Add this line
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.setAttribute("products", products);
        }


        if (selectedCategory != null) {
            request.setAttribute("selectedCategoryName", selectedCategory.getName());
        }

        // Optionally also load all categories for sidebar/filter
        List<Category> categories = CategoryService.getAllCategories();
        request.setAttribute("categories", categories);

        // Forward to JSP
        request.getRequestDispatcher("/product/productsByCategory.jsp").forward(request, response);
    }
}


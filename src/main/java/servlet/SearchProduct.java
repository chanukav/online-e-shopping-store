package servlet;

import model.Product;
import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        List<Product> products;

        try {
            if (keyword == null || keyword.trim().isEmpty()) {
                products = Collections.emptyList();
            } else {
                products = ProductService.searchProducts(keyword.trim());
            }
        } catch (ClassNotFoundException e) {
            throw new ServletException("Error searching products", e);
        }

        request.setAttribute("products", products);
        request.setAttribute("selectedCategoryName",
                (keyword == null || keyword.trim().isEmpty())
                        ? "All Products"
                        : "Search results for \"" + keyword + "\"");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/productsByCategory.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}





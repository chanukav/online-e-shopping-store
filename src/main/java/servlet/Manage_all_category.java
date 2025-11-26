package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Category;
import services.CategoryService;

@WebServlet("/Manage_all_category")
public class Manage_all_category extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load all categories
        CategoryService service = new CategoryService();
        ArrayList<Category> categoryList = service.getAllCategories();
        request.setAttribute("categories", categoryList);

        // Decide which JSP to forward to
        String view = request.getParameter("view");
        String jspPath;

        if ("addProduct".equals(view)) {
            jspPath = "/admin/admin_product/AddProduct.jsp"; // make sure this file exists
        } else if ("updateProduct".equals(view)) {
            jspPath = "/admin/admin_product/UpdateProduct.jsp"; // rename your update JSP to this
        } else {
            // default – category table
            jspPath = "/admin/category/category_table.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For forms that POST to this servlet (e.g. Update button)
        doGet(request, response);
    }
}

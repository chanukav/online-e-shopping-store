package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Category;
import services.CategoryService;

@WebServlet("/Add_Category")
public class Add_Category extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category cat = new Category();
        cat.setName(request.getParameter("name"));
        cat.setDescription(request.getParameter("description"));

        CategoryService service = new CategoryService();
        service.addCategory(cat);

        // Redirect to Manage_all_category instead of forwarding
        response.sendRedirect("Manage_all_category");
    }
}
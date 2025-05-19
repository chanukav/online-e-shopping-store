package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Category;
import services.CategoryService;

@WebServlet("/delete_Category")
public class Delete_Category extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category cat = new Category();
        cat.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));

        CategoryService service = new CategoryService();
        service.deleteCategory(cat);

        // Forward to the servlet or JSP that lists categories
        RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_all_category"); // Or "/Manage_all_category"
        dispatcher.forward(request, response);
        
    }

}

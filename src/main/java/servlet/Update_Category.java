package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Category;
import services.CategoryService;

@WebServlet("/update_Category")
public class Update_Category extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService service = new CategoryService();

    // Step 1: Load category data and show in form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Category category = service.getCategoryById(categoryId);
        
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/category/updateCategory.jsp");
        dispatcher.forward(request, response);
    }

    // Step 2: After submitting the form
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category cat = new Category();
        cat.setCategoryId(Integer.parseInt(request.getParameter("id")));
        cat.setName(request.getParameter("name"));
        cat.setDescription(request.getParameter("description"));

        service.updateCategory(cat);

        response.sendRedirect("Manage_all_category"); // Or wherever your list page is
        
    }
}

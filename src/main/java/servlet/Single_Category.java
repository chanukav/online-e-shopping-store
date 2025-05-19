package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Category;
import services.CategoryService;

@WebServlet("/singleCategory")
public class Single_Category extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        
        CategoryService service = new CategoryService();
        Category category = service.getCategoryById(categoryId);

        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCategory.jsp");
        dispatcher.forward(request, response);
    }
}

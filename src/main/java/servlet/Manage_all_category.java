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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService service = new CategoryService();
        ArrayList<Category> categoryList = service.getAllCategories();
        
        request.setAttribute("categories", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/category/category_table.jsp");
        dispatcher.forward(request, response);
    }
    
}

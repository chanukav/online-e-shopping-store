package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import services.ProductService;


@WebServlet("/ProductView")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductView() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Product>allProduct = ProductService.getAllProduct();
		request.setAttribute("allProduct", allProduct);
		RequestDispatcher dispatch = request.getRequestDispatcher("AllProduct Userview.jsp");
		dispatch.forward(request, response);
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

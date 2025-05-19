package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import services.ProductService;


@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteProduct() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Product pro = new Product();
		pro.setPid(Integer.parseInt(request.getParameter("pid")));
		
		ProductService service = new ProductService();
		service.deleteProduct(pro);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("ReadAllProduct");
		
		dispatch.forward(request, response);
	}

}

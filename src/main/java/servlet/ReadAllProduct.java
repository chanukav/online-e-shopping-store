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


@WebServlet("/ReadAllProduct")
public class ReadAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadAllProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Get the source parameter to identify where the request came from
		String source = request.getParameter("source");

		List<Product> allProduct = ProductService.getAllProduct();
		request.setAttribute("allProduct", allProduct);

		RequestDispatcher dispatch;

		// Redirect to different JSP pages based on 'source'
		if ("admin".equalsIgnoreCase(source)) {
			dispatch = request.getRequestDispatcher("/admin/admin_product/Allproduct.jsp");
		} else if ("user".equalsIgnoreCase(source)) {
			dispatch = request.getRequestDispatcher("/product/AllProductUserview.jsp");
		} else {
			// Default/fallback page if 'source' is missing or unrecognized
			dispatch = request.getRequestDispatcher("/error.jsp");
		}

		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

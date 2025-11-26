package servlet;

import java.io.File;
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

		int pid = Integer.parseInt(request.getParameter("pid"));

		// 1) Load existing product to know which image file to delete
		Product existing = null;
		try {
			java.util.List<Product> list = ProductService.getProductById(pid);
			if (list != null && !list.isEmpty()) {
				existing = list.get(0);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// 2) Delete DB record
		Product pro = new Product();
		pro.setPid(pid);
		ProductService service = new ProductService();
		service.deleteProduct(pro);

		// 3) Delete physical image file (if any)
		if (existing != null && existing.getPimg() != null) {
			String logicalPath = existing.getPimg();      // e.g. "images/xyz.png"
			String fileName = logicalPath;

			// Strip leading folder if present
			int lastSlash = fileName.lastIndexOf('/');
			if (lastSlash >= 0) {
				fileName = fileName.substring(lastSlash + 1);
			}

			if (!fileName.isEmpty()) {
				File imageFile = new File(productimages.BASE_IMAGE_PATH, fileName);
				if (imageFile.exists() && imageFile.isFile()) {
					imageFile.delete(); // ignore result; failure just leaves a stray file
				}
			}
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher("ReadAllProduct");
		dispatch.forward(request, response);
	}

}

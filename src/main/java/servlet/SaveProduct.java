package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Product;
import services.ProductService;


@WebServlet("/SaveProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10, // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)
public class SaveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SaveProduct() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Product pro = new Product();

	    // Get text fields
	    pro.setProdName(request.getParameter("productName"));

	    // Parse categoryId correctly
	    String categoryParam = request.getParameter("productCategory");
	    int categoryId = Integer.parseInt(categoryParam);
	    pro.setCategoryId(categoryId);

	    pro.setDescrip(request.getParameter("productDescription"));
	    pro.setPprice(Float.parseFloat(request.getParameter("productPrice")));
	    pro.setPstock(Integer.parseInt(request.getParameter("productStock")));
	    pro.setPbrand(request.getParameter("productBrand"));

	    // Handle file upload
	    Part filePart = request.getPart("productImages");
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	    String filePath = File.separator + fileName;

	    // Get path to webapp/images directory (adjust if needed)
	    String imagePath = getServletContext().getRealPath("/WebContent");
	    File imageDir = new File(imagePath);
	    if (!imageDir.exists()) imageDir.mkdirs();

	    String savePath = imagePath + File.separator + fileName;
	    filePart.write(savePath);

	    pro.setPimg(filePath);

	    // Save product
	    ProductService service = new ProductService();
	    service.regProduct(pro);

	    // Redirect or forward
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ReadAllProduct");
	    dispatcher.forward(request, response);
	}

}
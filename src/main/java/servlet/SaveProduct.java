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
	    String submittedName = getSubmittedFileName(filePart);
	    if (submittedName == null || submittedName.trim().isEmpty()) {
	        throw new ServletException("Product image is required.");
	    }
	    String fileName = Paths.get(submittedName).getFileName().toString();

	    File imageDir = new File(productimages.BASE_IMAGE_PATH);
	    if (!imageDir.exists()) imageDir.mkdirs();

	    File destination = new File(imageDir, fileName);
	    filePart.write(destination.getAbsolutePath());

	    pro.setPimg(buildImagePath(fileName));

	    // Save product
	    ProductService service = new ProductService();
	    service.regProduct(pro);

	    // Redirect or forward
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ReadAllProduct");
	    dispatcher.forward(request, response);
	}

    private String getSubmittedFileName(Part part) {
        if (part == null) {
            return null;
        }
        String header = part.getHeader("content-disposition");
        if (header == null) {
            return null;
        }
        for (String cd : header.split(";")) {
            String trimmed = cd.trim();
            if (trimmed.startsWith("filename")) {
                String fileName = trimmed.substring(trimmed.indexOf('=') + 1).trim().replace("\"", "");
                if (!fileName.isEmpty()) {
                    return fileName;
                }
            }
        }
        return null;
    }

    private String buildImagePath(String fileName) {
        if (fileName == null || fileName.trim().isEmpty()) {
            return null;
        }
        return "images/" + fileName;
    }
}
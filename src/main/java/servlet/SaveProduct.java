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
		
		pro.setProdName(request.getParameter("productName"));
		pro.setCategory(request.getParameter("productCategory"));
		pro.setDescrip(request.getParameter("productDescription"));
		
		
		// Handle file upload
        Part filePart = request.getPart("productImages");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = File.separator + fileName;

     // Get path to webapp/images directory
        String imagePath = getServletContext().getRealPath("/WebContent");
        File imageDir = new File(imagePath);
        if (!imageDir.exists()) imageDir.mkdirs();
        
        
        String savePath = imagePath + File.separator + fileName;
        filePart.write(savePath);
        
        // Save file to server
        
        pro.setPimg(filePath);
        
        pro.setPprice(Float.parseFloat(request.getParameter("productPrice")));
        pro.setPstock(Integer.parseInt(request.getParameter("productStock")));
        pro.setPbrand(request.getParameter("productBrand"));
        
        ProductService service = new ProductService();
        service.regProduct(pro);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("ReadAllProduct");
        dispatcher.forward(request, response);
	}

}

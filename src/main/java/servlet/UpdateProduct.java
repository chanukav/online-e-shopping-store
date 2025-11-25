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


@WebServlet("/UpdateProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10, // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateProduct() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Product pro = new Product();
		pro.setPid(Integer.parseInt(request.getParameter("pid")));
		pro.setProdName(request.getParameter("prodName"));
		pro.setCategoryId(Integer.parseInt("category"));
		pro.setDescrip(request.getParameter("descrip"));
		
		
		Part filePart = request.getPart("pimg");
		String imagePath="";
		if (filePart != null && filePart.getSize() > 0) {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = File.separator + fileName;

     // Get path to webapp/images directory
        imagePath = getServletContext().getRealPath("/WebContent");
        File imageDir = new File(imagePath);
        if (!imageDir.exists()) imageDir.mkdirs();
        
        
        String savePath = imagePath + File.separator + fileName;
        filePart.write(savePath);
        
        // Save file to server
        
        pro.setPimg(filePath);
		}
		else {
			imagePath = request.getParameter("WebContent/${product.pimg}");
			pro.setPimg(imagePath);
		}
		
		
		pro.setPprice(Float.parseFloat(request.getParameter("pprice")));
		pro.setPstock(Integer.parseInt(request.getParameter("pstock")));
		pro.setPbrand(request.getParameter("pbrand"));
		
		
		ProductService service = new ProductService();
		service.updateProduct(pro);
		RequestDispatcher dispatch = request.getRequestDispatcher("ReadAllProduct");
		
		dispatch.forward(request, response);
		
	}

}

package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Product;
import services.ProductService;

@WebServlet("/UpdateProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class UpdateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMAGE_UPLOAD_DIR = productimages.BASE_IMAGE_PATH;
    private static final String IMAGE_URL_PREFIX = "images/";

    public UpdateProduct() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Not used to show the form – forms come from Manage_all_category
        response.getWriter().append("UpdateProduct is POST-only for updating products.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Product pro = new Product();

        // Basic fields
        pro.setPid(Integer.parseInt(request.getParameter("pid")));
        pro.setProdName(request.getParameter("prodName"));
        pro.setCategoryId(Integer.parseInt(request.getParameter("category")));
        pro.setDescrip(request.getParameter("descrip"));

        // Handle image upload
        Part filePart = request.getPart("pimg");
        String existingFileName = sanitizeFileName(request.getParameter("existingPimg"));

        if (filePart != null && filePart.getSize() > 0) {
            String submittedFileName = getSubmittedFileName(filePart);
            String safeFileName = sanitizeFileName(submittedFileName);

            if (safeFileName != null) {
                File uploadDir = new File(IMAGE_UPLOAD_DIR);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                File destination = new File(uploadDir, safeFileName);
                filePart.write(destination.getAbsolutePath());

                pro.setPimg(buildImagePath(safeFileName));
            } else {
                pro.setPimg(buildImagePath(existingFileName));
            }

        } else {
            // No new file uploaded -> keep old image path (store filename only)
            pro.setPimg(buildImagePath(existingFileName));
        }

        // Other fields
        pro.setPprice(Float.parseFloat(request.getParameter("pprice")));
        pro.setPstock(Integer.parseInt(request.getParameter("pstock")));
        pro.setPbrand(request.getParameter("pbrand"));

        // Update in DB
        ProductService service = new ProductService();
        service.updateProduct(pro);

        // Redirect / forward back to product list
        RequestDispatcher dispatch = request.getRequestDispatcher("ReadAllProduct");
        dispatch.forward(request, response);
    }

    private String sanitizeFileName(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        if (trimmed.isEmpty()) {
            return null;
        }
        trimmed = trimmed.replace("\\", "/");
        int index = trimmed.lastIndexOf('/');
        return index >= 0 ? trimmed.substring(index + 1) : trimmed;
    }

    private String buildImagePath(String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }
        return IMAGE_URL_PREFIX + fileName;
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
}

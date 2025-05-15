package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Admin;
import services.admin_services;



@WebServlet("/Admin_update")
@MultipartConfig
public class Admin_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Admin_update() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Part imagePart = request.getPart("image");
		byte[] imageBytes = null;
		boolean isImageUpdated = false;

		if (imagePart != null && imagePart.getSize() > 0) {
		    InputStream inputStream = imagePart.getInputStream();
		    imageBytes = inputStream.readAllBytes();
		    isImageUpdated = true;
		}

		Admin admin = new Admin();
		admin.setAdminid(Integer.parseInt(request.getParameter("adminId")));
		admin.setFname(request.getParameter("firstName"));
		admin.setLname(request.getParameter("lastName"));
		admin.setEmail(request.getParameter("email"));
		admin.setPassword(request.getParameter("password"));
		if (isImageUpdated) {
		    admin.setImage(imageBytes);
		}

     // Call the service to update the admin in the database
        admin_services service = new admin_services();
        service.updateAdmin(admin, isImageUpdated);
		
		//request.setAttribute("email", admin.getEmail());
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("Single_admin_details");
        dispatcher.forward(request, response);
		
	}

}

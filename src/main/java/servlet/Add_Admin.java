package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.admin_services;

@WebServlet("/Add_Admin")
@MultipartConfig(maxFileSize = 16177215)  // 16MB max size
public class Add_Admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Add_Admin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Admin admin = new Admin();

        admin.setFname(request.getParameter("firstName"));
        admin.setLname(request.getParameter("lastName"));
        admin.setEmail(request.getParameter("email"));
        admin.setPassword(request.getParameter("password"));

        Part imagePart = request.getPart("image");
        if (imagePart != null && imagePart.getSize() > 0) {
            InputStream imageStream = imagePart.getInputStream();
            byte[] imageBytes = imageStream.readAllBytes();
            admin.setImage(imageBytes);
        }

        admin_services service = new admin_services();
        service.regAdmin(admin);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_all_admins");
        dispatcher.forward(request, response);
    }
}


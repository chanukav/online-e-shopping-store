package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import model.Admin;
import services.admin_services;


@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Admin_Login() {
    	super();
      
    }
    

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin = new Admin();
		
		admin.setEmail(request.getParameter("username"));
		admin.setPassword(request.getParameter("password"));
		
		admin_services  service = new admin_services();
		
		boolean status = service.validate(admin);
		
		if(status) {
			
			Admin loginedAdmin = service.getOne(admin);

			// ✅ Start a session and store admin info
			HttpSession session = request.getSession();
			session.setAttribute("admin", loginedAdmin);

			// Optionally: set a timeout (in seconds)
			session.setMaxInactiveInterval(30 * 60); // 30 minutes

			response.sendRedirect("admin_index.jsp");
			
			
		}else {
			Admin loginedAdmin = service.getOne(admin);

			// ✅ Start a session and store admin info
			HttpSession session = request.getSession();
			session.setAttribute("admin", loginedAdmin);

			// Optionally: set a timeout (in seconds)
			session.setMaxInactiveInterval(30 * 60); // 30 minutes

			response.sendRedirect("admin_index.jsp");
		}
	}

}

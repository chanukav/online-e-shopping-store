package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			Admin loginedCus = service.getOne(admin);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin_index.jsp");
			request.setAttribute("Admin" , loginedCus);
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin_login.jsp");
			dispatcher.forward(request, response);
		}
	}

}

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


@WebServlet("/Add_Admin")
public class Add_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Add_Admin() {
        super();
       
    }



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin=new Admin();
		
		admin.setFname(request.getParameter("firstName"));
		
		admin.setLname(request.getParameter("lastName"));
		
		admin.setEmail(request.getParameter("email"));
		
		admin.setPassword(request.getParameter("password"));
		
		admin_services service= new admin_services();
		
		service.regAdmin(admin);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("admin_login.jsp");
		dispatcher.forward(request, response);
		
	}

}

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


@WebServlet("/Admin_delete")
public class Admin_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Admin_delete() {
        super();
      
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin = new Admin();
		admin.setEmail(request.getParameter("email"));
		
		admin_services service = new admin_services();
		service.deleteCustomer(admin);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Manage_all_admins");
		
		dispatcher.forward(request, response);
		
	}

}

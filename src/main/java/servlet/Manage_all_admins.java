package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.admin_services;




@WebServlet("/Manage_all_admins")
public class Manage_all_admins extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Manage_all_admins() {
        super();
      
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        admin_services service = new admin_services();
        ArrayList<Admin> adminList = service.getAllAdmins();
        request.setAttribute("adminList", adminList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_table.jsp");
        dispatcher.forward(request, response);
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		admin_services service = new admin_services();
		ArrayList<Admin> adminList = service.getAllAdmins();
;
		
		request.setAttribute("adminList",adminList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin_table.jsp");
		dispatcher.forward(request, response);
	}

}

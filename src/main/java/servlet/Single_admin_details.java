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

/**
 * Servlet implementation class Single_admin_details
 */
@WebServlet("/Single_admin_details")
public class Single_admin_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Single_admin_details() {
        super();

    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin ad = new Admin();
		ad.setEmail(request.getParameter("email"));
		admin_services service = new admin_services();
		
		Admin admin = service.singleDataButton(ad);
		RequestDispatcher dispatcher =request.getRequestDispatcher("admin_profile.jsp");
		request.setAttribute("Admin", admin);
		
		 dispatcher.forward(request, response);
	}

}

package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer;
import services.customerService;



@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Profile() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		
		String email=(String) session.getAttribute("email");
		System.out.println(email);
		customer cus =new customer();
		cus.setEmail(email);
	    customerService service= new customerService();
	    cus=service.getone(cus);
	    
	    request.setAttribute("customer", cus);
	    RequestDispatcher dispatcher= request.getRequestDispatcher("customer/profile.jsp");
	    dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}

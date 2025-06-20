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

@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addCustomer() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    customer cus = new customer();

	    cus.setName(request.getParameter("name"));
	    cus.setAge(request.getParameter("age"));
	    cus.setGender(request.getParameter("gender"));
	    cus.setAddress(request.getParameter("address"));
	    cus.setEmail(request.getParameter("email"));
	    cus.setPassword(request.getParameter("password"));

	    customerService service = new customerService();
	    service.regCustomer(cus);

	    // Get the source value to determine the redirect
	    String source = request.getParameter("source");

	    if ("admin".equalsIgnoreCase(source)) {
	        response.sendRedirect("admincustomers");
	    } else {
			customer registerCus = service.getone(cus);
	    	
			HttpSession session = request.getSession();
			session.setAttribute("customer", registerCus);
	    	
	        response.sendRedirect("index.jsp");
	    }
	}


}

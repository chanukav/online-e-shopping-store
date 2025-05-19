package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;


@WebServlet("/updatecustomer")
public class updatecustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public updatecustomer() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		customer cus = new customer();
		cus.setName(request.getParameter("name"));
		cus.setAge(request.getParameter("age"));
		cus.setGender(request.getParameter("gender"));
		cus.setAddress(request.getParameter("address"));
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));

		customerService service = new customerService();
		service.updateCustomer(cus);
		

	    // Get the source value to determine the redirect
	    String source = request.getParameter("source");

	    if ("admin".equalsIgnoreCase(source)) {
	        response.sendRedirect("admincustomers");
	    } else {
	        response.sendRedirect("homeindex.jsp");
	    }
		

	}

}

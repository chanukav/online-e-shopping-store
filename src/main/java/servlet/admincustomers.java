package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;


@WebServlet("/admincustomers")
public class admincustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admincustomers() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		customerService service =new customerService();
		ArrayList<customer> customer =service.getAllCustomer();
		request.setAttribute("customer", customer);
		
		RequestDispatcher dispacher =request.getRequestDispatcher("customer/admintable.jsp");
		dispacher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*customerService service =new customerService();
		ArrayList<customer> customer =service.getAllCustomer();
		request.setAttribute("customer", customer);
		
		RequestDispatcher dispacher =request.getRequestDispatcher("admintable.jsp");
		dispacher.forward(request, response);*/
	}

}

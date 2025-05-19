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


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		customer cus=new customer();
		
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));
		
		customerService service=new customerService();
		boolean status=service.validate(cus);
		
		if(status) {
			
//			
			HttpSession session = request.getSession();
			session.setAttribute("email",cus.getEmail() );
			
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/homeindex.jsp");
			
//			
			dispatcher.forward(request, response);
			
		}
		else {
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/customer/login.jsp");
			dispatcher.forward(request, response);
		}

	}

}

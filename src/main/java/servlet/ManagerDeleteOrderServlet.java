package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manager;
import services.ManagerService;


@WebServlet("/admin/ManagerAdmin/ManagerDeleteOrderServlet")
public class ManagerDeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ManagerDeleteOrderServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    int orderid = Integer.parseInt(request.getParameter("orderid"));
	    Manager cus = new Manager();
	    cus.setOrderid(orderid); // ✅ Now this is correct

	    ManagerService service = new ManagerService();
	    service.deletOrder(cus);
		

		RequestDispatcher dispatcher=request.getRequestDispatcher("/admin/ManagerAdmin/ManagerReadServlet");
		
		dispatcher.forward(request, response);
	}

}

package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manager;
import services.ManagerService;


@WebServlet("/admin/ManagerAdmin/ManagerReadServlet")
public class ManagerReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ManagerReadServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 ManagerService service = new ManagerService();
		    ArrayList<Manager> orderList = null;
			try {
				orderList = service.getAllOrder();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    request.setAttribute("orderList", orderList);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/ManagerAdmin/ManagerReadOrderlist.jsp");
		    dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ManagerService service = new ManagerService();
		ArrayList<Manager> orderList = null;
		try {
			orderList = service.getAllOrder();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("orderList", orderList);
		

		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/ManagerAdmin/ManagerReadOrderlist.jsp");
		
		dispatcher.forward(request, response);
	}

}

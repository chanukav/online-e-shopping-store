package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manager;
import services.ManagerService;

@WebServlet("/admin/ManagerAdmin/ManagerUpdateOrderServlet")
public class ManagerUpdateOrderServlet extends HttpServlet {

    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Manager cus = new Manager();

	    cus.setOrderid(Integer.parseInt(request.getParameter("orderid")));
	    cus.setCusname(request.getParameter("cusname"));
	    cus.setCusemail(request.getParameter("cusemail"));
	    cus.setPid(Integer.parseInt(request.getParameter("pid")));
	    cus.setDate(request.getParameter("date"));
	    cus.setQuantity(Integer.parseInt(request.getParameter("quantity")));
	    cus.setPrice(Double.parseDouble(request.getParameter("price")));
	    cus.setTotal(Double.parseDouble(request.getParameter("total")));
	    cus.setCusadress(request.getParameter("cusadress"));
	    cus.setCuscontact(request.getParameter("cuscontact"));

	    
	    System.out.println("Delivery Address: " + request.getParameter("cusadress"));

	    ManagerService service = new ManagerService();
	    try {
			service.updateOrder(cus);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}

	    response.sendRedirect("ManagerReadServlet");
	}

            
    }


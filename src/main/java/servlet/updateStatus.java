package servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/ManagerAdmin/updateStatus")
public class updateStatus extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String status = request.getParameter("status");

        services.ManagerService service = new services.ManagerService();
        boolean updated = service.updateOrderStatus(orderid, status);

        if (updated) {
            System.out.println("Order status updated to: " + status);
        } else {
            System.out.println("Failed to update order status");
        }

        response.sendRedirect("ManagerReadServlet");
    }
}


package servlet;

import model.Manager;
import services.ManagerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/ManagerAdmin/ManagerViewOrderServlet")
public class ManagerViewOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManagerViewOrderServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderid = Integer.parseInt(request.getParameter("orderid"));

            Manager cus = new Manager();
            cus.setOrderid(orderid);

            ManagerService service = new ManagerService();
            Manager orderDetails = service.getOrderById(cus);  // Returns full record

            if (orderDetails != null) {
                request.setAttribute("order", orderDetails); // Set to request scope
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/ManagerAdmin/ManagerViewOrder.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("ManagerHome.jsp?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ManagerHome.jsp?error=exception");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Allow POST too
    }
}

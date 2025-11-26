package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.customer;
import services.customerService;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        customer cus = new customer();
        cus.setEmail(request.getParameter("email"));
        cus.setPassword(request.getParameter("password"));

        customerService service = new customerService();
        boolean status = service.validate(cus);

        if (status) {
            customer loginedCus = service.getone(cus);
            HttpSession session = request.getSession();
            session.setAttribute("customer", loginedCus);
            session.setMaxInactiveInterval(60 * 60); // 1 hour

            // After successful login always go to home page
            session.removeAttribute("redirectAfterLogin");
            response.sendRedirect("HomeServlet");
        } else {
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

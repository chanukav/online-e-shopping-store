package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ResumeAddToCart")
public class ResumeAddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get saved cart data
        String productId = (String) session.getAttribute("pendingAddToCart_productId");
        String productName = (String) session.getAttribute("pendingAddToCart_productName");
        String productPrice = (String) session.getAttribute("pendingAddToCart_productPrice");
        String quantity = (String) session.getAttribute("pendingAddToCart_quantity");

        // Clear saved data
        session.removeAttribute("pendingAddToCart_productId");
        session.removeAttribute("pendingAddToCart_productName");
        session.removeAttribute("pendingAddToCart_productPrice");
        session.removeAttribute("pendingAddToCart_quantity");

        // Forward to JSP that submits a form automatically
        request.setAttribute("productId", productId);
        request.setAttribute("productName", productName);
        request.setAttribute("productPrice", productPrice);
        request.setAttribute("quantity", quantity);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout/resumeAddToCart.jsp");
        dispatcher.forward(request, response);
    }
}

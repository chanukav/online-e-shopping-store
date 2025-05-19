package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.payment;
import services.paymentService;

@WebServlet("/updateCard")
public class updateCard extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String cardNumber = request.getParameter("cardNumber");
        String cardName = request.getParameter("cardName");
        String expMonth = request.getParameter("expMonth");
        String expYear = request.getParameter("expYear");
        String cvv = request.getParameter("cvv");

        // Create payment object to pass to service
        payment card = new payment();
        card.setCardNumber(cardNumber);
        card.setCardName(cardName);
        card.setExpMonth(expMonth);
        card.setExpYear(expYear);
        card.setCvv(cvv);

        // Call update service
        paymentService service = new paymentService();
        boolean success = service.updateCard(card);

        // Handle response
        if (success) {
            response.sendRedirect("readCard"); // redirect on success
        } else {
            response.getWriter().println("Update failed");
        }
    }
}

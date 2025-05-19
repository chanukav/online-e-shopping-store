package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.payment;
import services.paymentService;

@WebServlet("/readCard")
public class readCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public readCard() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		paymentService service = new paymentService();
		ArrayList<payment> cardList = service.getAllCards();
		
		request.setAttribute("cards", cardList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("paymentR.jsp");
		dispatcher.forward(request, response);
	}

}

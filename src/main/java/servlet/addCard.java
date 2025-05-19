package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.payment;
import services.paymentService;

@WebServlet("/addCard")
public class addCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addCard() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		payment pay =new payment();
		pay.setCardNumber(request.getParameter("cardNumber"));
		pay.setCardName(request.getParameter("cardName"));
		pay.setExpMonth(request.getParameter("expMonth"));
		pay.setExpYear(request.getParameter("expYear"));
		pay.setCvv(request.getParameter("cvv"));
		
		paymentService service=new paymentService();
		service.regCard(pay);
		
		RequestDispatcher disp=request.getRequestDispatcher("paymentR.jsp");
		
		disp.forward(request, response);
	}

}

package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logoutservlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); // Avoid creating a new session if one doesn't exist
		if (session != null) {
			session.invalidate(); // Clear session
		}
		
		response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirect to home
	}
}

package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Admin_logout")
public class Admin_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Admin_logout() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // end the session
		}
		response.sendRedirect("admin_login.jsp");
		
		
	}




}

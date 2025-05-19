package servlet;

	import java.io.IOException;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import model.Manager;
	import services.ManagerService;


	
	
	@WebServlet("/admin/ManagerAdmin/ManagerCreateServlet")
public class ManagerCreateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public ManagerCreateServlet() {
	        super();
	       
	    }

		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			

			
			
			
			
			Manager cus =new Manager();
			cus.setPid(Integer.parseInt(request.getParameter("pid")));
			cus.setPrice(Double.parseDouble(request.getParameter("price")));
			cus.setCusname(request.getParameter("cusname"));
			cus.setCusadress(request.getParameter("cusadress"));
			cus.setCuscontact(request.getParameter("cuscontact"));
			cus.setCusemail(request.getParameter("cusemail"));
			cus.setDate(request.getParameter("date"));
			cus.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cus.setTotal(Double.parseDouble(request.getParameter("total")));
			
			boolean status = ManagerService.validate(cus);
			
	        if(status) {
	        	
	        RequestDispatcher dispatcher =	request.getRequestDispatcher("/admin/ManagerAdmin/ManagerReadServlet");
	        dispatcher.forward(request,response);
	        	
	        }
	        else {
	        	
	        	request.setAttribute("error", "Invalid cusname or  pid" );
	        	RequestDispatcher dispatcher =	request.getRequestDispatcher("/admin/adminlogin.jsp" );
	            dispatcher.forward(request,response);
	            
	        }
			
		}

	}



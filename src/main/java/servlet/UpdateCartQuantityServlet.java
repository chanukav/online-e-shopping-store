package servlet;

import model.CartItem;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get parameters
        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        // Get cart from session
        @SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getPid() == productId) {
                    int newQuantity = item.getQuantity();
                    if ("increase".equals(action)) {
                        newQuantity++;
                    } else if ("decrease".equals(action) && newQuantity > 1) {
                        newQuantity--;
                    }
                    item.setQuantity(newQuantity);
                    break;
                }
            }
            session.setAttribute("cart", cart);
            // Set success message
            session.setAttribute("cartMessage", "Quantity updated successfully!");
        }

        // Redirect back to cart page
        response.sendRedirect(request.getContextPath() + "/checkout/cart.jsp");
    }
}
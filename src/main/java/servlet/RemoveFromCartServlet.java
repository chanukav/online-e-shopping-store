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

@WebServlet("/RemoveFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get product ID to remove
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Get cart from session
        @SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            // Find and remove the item
            cart.removeIf(item -> item.getProduct().getPid() == productId);
            session.setAttribute("cart", cart);
            // Set success message
            session.setAttribute("cartMessage", "Product removed from cart successfully!");
        }

        // Redirect back to cart page
        response.sendRedirect(request.getContextPath() + "/checkout/cart.jsp");
    }
}
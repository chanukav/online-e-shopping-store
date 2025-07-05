package servlet;

import model.Product;
import model.CartItem;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCart")
public class AddToCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    HttpSession session = request.getSession();

	    String productIdStr = request.getParameter("productId");
	    String productName = request.getParameter("productName");
	    String productPriceStr = request.getParameter("productPrice");
	    String quantityStr = request.getParameter("quantity");

	    if (productIdStr == null || productIdStr.trim().isEmpty() ||
	        productName == null || productName.trim().isEmpty() ||
	        productPriceStr == null || productPriceStr.trim().isEmpty() ||
	        quantityStr == null || quantityStr.trim().isEmpty()) {

	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty product fields.");
	        return;
	    }

	    int productId;
	    float productPrice;
	    int quantity;

	    try {
	        productId = Integer.parseInt(productIdStr.trim());
	        productPrice = Float.parseFloat(productPriceStr.trim());
	        quantity = Integer.parseInt(quantityStr.trim());
	    } catch (NumberFormatException e) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format in product fields.");
	        return;
	    }

	    Product product = new Product();
	    product.setPid(productId);
	    product.setProdName(productName);
	    product.setPprice(productPrice);

	    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
	    if (cart == null) {
	        cart = new ArrayList<>();
	        session.setAttribute("cart", cart);
	    }

	    boolean exists = false;
	    for (CartItem item : cart) {
	        if (item.getProduct().getPid() == productId) {
	            item.setQuantity(item.getQuantity() + quantity);
	            exists = true;
	            break;
	        }
	    }

	    if (!exists) {
	        cart.add(new CartItem(product, quantity));
	    }

	    session.setAttribute("cartMessage", "Product added to cart successfully!");
	    response.sendRedirect(request.getContextPath() + "/checkout/cart.jsp");
	}

}
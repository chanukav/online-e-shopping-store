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

        // Get product details from form
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        float productPrice = Float.parseFloat(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Create Product object
        Product product = new Product();
        product.setPid(productId);
        product.setProdName(productName);
        product.setPprice(productPrice);

        // Get or create cart from session
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Check if product exists in cart
        boolean exists = false;
        for (CartItem item : cart) {
            if (item.getProduct().getPid() == productId) {
                item.setQuantity(item.getQuantity() + quantity);
                exists = true;
                break;
            }
        }

        // Add new item if it doesn't exist
        if (!exists) {
            cart.add(new CartItem(product, quantity));
        }

        // Set success message
        session.setAttribute("cartMessage", "Product added to cart successfully!");

        // Redirect to product page
        response.sendRedirect(request.getContextPath() + "/product/products.jsp");
    }
}
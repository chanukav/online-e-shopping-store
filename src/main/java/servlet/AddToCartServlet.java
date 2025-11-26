package servlet;

import model.Product;
import model.CartItem;
import model.customer;

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
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        customer loggedCustomer = (customer) session.getAttribute("customer");

        // 🔒 Check if customer is logged in
        if (loggedCustomer == null) {
            // Just send user to login; after login they will go to home page
            // Clear any previous redirect flags
            session.removeAttribute("redirectAfterLogin");
            session.removeAttribute("pendingAddToCart_productId");
            session.removeAttribute("pendingAddToCart_productName");
            session.removeAttribute("pendingAddToCart_productPrice");
            session.removeAttribute("pendingAddToCart_quantity");

            response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
            return;
        }

        // ✅ Proceed to add to cart
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productPriceStr = request.getParameter("productPrice");
        String quantityStr = request.getParameter("quantity");

        if (productIdStr == null || productName == null || productPriceStr == null || quantityStr == null ||
            productIdStr.trim().isEmpty() || productName.trim().isEmpty() || productPriceStr.trim().isEmpty() || quantityStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product fields.");
            return;
        }

        int productId = Integer.parseInt(productIdStr.trim());
        float productPrice = Float.parseFloat(productPriceStr.trim());
        int quantity = Integer.parseInt(quantityStr.trim());

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

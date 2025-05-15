package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnect;

@WebServlet("/Admin_Image")
public class Admin_Image extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Admin_Image() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int adminId = Integer.parseInt(request.getParameter("adminId"));
            String query = "SELECT image FROM gamudalk.admin WHERE admin_id = ?";

            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, adminId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        byte[] imgBytes = rs.getBytes("image");
                        if (imgBytes != null && imgBytes.length > 0) {
                            response.setContentType("image/jpeg"); // Adjust based on stored format
                            response.getOutputStream().write(imgBytes);
                        } else {
                            // Serve a default image if no image exists
                            response.sendRedirect(request.getContextPath() + "/admin/Adminassets/images/default.webp");
                        }
                    } else {
                        // Admin not found
                        response.sendRedirect(request.getContextPath() + "/admin/Adminassets/images/default.webp");
                    }
                }
            }
        } catch (NumberFormatException e) {
            // Invalid adminId
            response.sendRedirect(request.getContextPath() + "/admin/Adminassets/images/default.webp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
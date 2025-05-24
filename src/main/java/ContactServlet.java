import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // دعم اللغة العربية

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        String url = "jdbc:mysql://localhost:3306/student_portal";
        String dbUser = "root";
        String dbPassword = "";

        boolean success = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("success", success);
        RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
        rd.forward(request, response);
    }
}

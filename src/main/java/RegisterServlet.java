
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // الاتصال بقاعدة البيانات
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username, email, password) VALUES (?, ?, ?)");

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('تم التسجيل بنجاح!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                out.println("<h3 style='color:red;'>فشل إدخال البيانات.</h3>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>حدث خطأ أثناء التسجيل:</h3>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        }
    }
}

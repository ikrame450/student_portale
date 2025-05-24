import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // تعيين ترميز UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // تحميل سائق قاعدة البيانات
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ أحدث نسخة من MySQL Driver

            // الاتصال بقاعدة البيانات
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useUnicode=true&characterEncoding=UTF-8", 
                "root", "");

            // التحقق من البيانات
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // تسجيل الدخول ناجح
                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("email", email);
                response.sendRedirect("welcome.jsp"); // ✅ يوجه إلى صفحة الترحيب
            } else {
                // تسجيل الدخول فشل
                request.setAttribute("errorMessage", "البريد الإلكتروني أو كلمة المرور غير صحيحة.");
                  response.sendRedirect("login.jsp?error=invalid");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response); // ✅ عرض رسالة الخطأ في نفس الصفحة
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("حدث خطأ أثناء المعالجة: " + e.getMessage());
        }
    }
}

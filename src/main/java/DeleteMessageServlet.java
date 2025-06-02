import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // التحقق من صلاحية المستخدم (يفضل التأكد هنا من أنه admin أيضاً)
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("home.jsp");
            return;
        }

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.getWriter().println("رقم المعرف غير موجود أو غير صالح.");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            int id = Integer.parseInt(idStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_portal", "root", "");

            ps = con.prepareStatement("DELETE FROM contact_messages WHERE id = ?");
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                // بعد الحذف، نعيد التوجيه إلى صفحة الرسائل لتحديث العرض
                response.sendRedirect("messages.jsp");
            } else {
                response.getWriter().println("لم يتم العثور على الرسالة المحددة.");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("رقم المعرف غير صالح.");
        } catch (Exception e) {
            response.getWriter().println("حدث خطأ أثناء الحذف: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}

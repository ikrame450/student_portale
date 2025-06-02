// استيراد الحزم اللازمة للتعامل مع الإدخال/الإخراج والاستثناءات وقاعدة البيانات
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

// استيراد حزم Servlet الخاصة بـ Jakarta EE
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// تحديد عنوان السيرفلت عند استدعائه من خلال المتصفح أو النموذج
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    // تنفيذ هذا الميثود عند إرسال نموذج باستخدام POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // تحديد نوع المحتوى المستجاب به على أنه HTML وترميز الأحرف UTF-8
        response.setContentType("text/html;charset=UTF-8");

        // إنشاء كائن لطباعة وإرسال البيانات إلى المتصفح
        PrintWriter out = response.getWriter();

        // استرجاع القيم المرسلة من النموذج (form) عبر الحقول: اسم المستخدم، البريد، وكلمة المرور
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // تحميل تعريف سائق (Driver) MySQL لتمكين الاتصال بقاعدة البيانات
            Class.forName("com.mysql.cj.jdbc.Driver");

            // إنشاء اتصال بقاعدة البيانات: قاعدة البيانات student_portal، المستخدم root، بدون كلمة مرور
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "");

            // تجهيز أمر SQL لإدخال البيانات في جدول users باستخدام placeholders (؟)
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username, email, password) VALUES (?, ?, ?)");

            // تعيين القيم المستلمة من النموذج إلى الأماكن المحددة في أمر الإدخال
            ps.setString(1, username); // تعيين اسم المستخدم في المكان الأول
            ps.setString(2, email);    // تعيين البريد الإلكتروني في المكان الثاني
            ps.setString(3, password); // تعيين كلمة المرور في المكان الثالث

            // تنفيذ عملية الإدخال في قاعدة البيانات وإرجاع عدد الصفوف المدخلة
            int rowsInserted = ps.executeUpdate();

            // التحقق إذا تم إدخال البيانات بنجاح (أي أن عدد الصفوف أكبر من 0)
            if (rowsInserted > 0) {
                // طباعة رسالة JavaScript لعرض تنبيه ثم تحويل المستخدم إلى صفحة تسجيل الدخول
                out.println("<script type='text/javascript'>");
                out.println("alert('تم التسجيل بنجاح!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                // طباعة رسالة فشل إذا لم يتم إدخال أي صف
                out.println("<h3 style='color:red;'>فشل إدخال البيانات.</h3>");
            }

            // إغلاق كائن PreparedStatement بعد انتهاء استخدامه
            ps.close();

            // إغلاق الاتصال بقاعدة البيانات
            con.close();

        } catch (Exception e) {
            // في حال حدوث استثناء (خطأ)، طباعة رسالة الخطأ مع التفاصيل
            out.println("<h3 style='color:red;'>حدث خطأ أثناء التسجيل:</h3>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        }
    }
}

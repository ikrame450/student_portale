import java.io.IOException; // استيراد مكتبة التعامل مع استثناءات الإدخال والإخراج
import jakarta.servlet.*; // استيراد حزم الـ Servlet الأساسية للتعامل مع الطلبات والاستجابات
import jakarta.servlet.http.*; // استيراد حزم HTTP الخاصة بـ Servlet (جلسات، طلبات، استجابات)
import java.sql.*; // استيراد حزم التعامل مع قواعد البيانات

// تعريف سيرفلت LoginServlet الذي يرث من HttpServlet
public class LoginServlet extends HttpServlet {

    // تنفيذ هذا الميثود عند استقبال طلب POST (عند إرسال نموذج تسجيل الدخول)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // تعيين ترميز الطلب إلى UTF-8 لضمان دعم الأحرف العربية أو أي أحرف خاصة
        request.setCharacterEncoding("UTF-8");

        // تعيين نوع المحتوى والاستجابة بحيث يكون نص HTML مع ترميز UTF-8
        response.setContentType("text/html;charset=UTF-8");

        // الحصول على قيمة البريد الإلكتروني المدخلة في النموذج
        String email = request.getParameter("email");

        // الحصول على قيمة كلمة المرور المدخلة في النموذج
        String password = request.getParameter("password");

        try {
            // تحميل سائق قاعدة بيانات MySQL لتتمكن من الاتصال بقاعدة البيانات
            Class.forName("com.mysql.cj.jdbc.Driver");

            // إنشاء اتصال بقاعدة البيانات "student_portal" مع ضبط الترميز للاتصال UTF-8
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useUnicode=true&characterEncoding=UTF-8", 
                "root", ""); // اسم المستخدم وكلمة المرور لقاعدة البيانات

            // تحضير جملة SQL للتحقق من وجود مستخدم بالبريد الإلكتروني وكلمة المرور المدخلة
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");

            // تعيين البريد الإلكتروني في الاستعلام مكان علامة الاستفهام الأولى
            ps.setString(1, email);

            // تعيين كلمة المرور في الاستعلام مكان علامة الاستفهام الثانية
            ps.setString(2, password);

            // تنفيذ الاستعلام وتخزين النتائج في ResultSet
            ResultSet rs = ps.executeQuery();

            // التحقق من وجود سجل مطابق (أي تسجيل الدخول ناجح)
            if (rs.next()) {
                // إنشاء جلسة HttpSession جديدة أو استدعاء الجلسة الحالية
                HttpSession session = request.getSession();

                // تخزين اسم المستخدم في الجلسة ليستفيد منها الصفحات الأخرى
                session.setAttribute("username", rs.getString("username"));

                // تخزين البريد الإلكتروني في الجلسة
                session.setAttribute("email", email);

                // تخزين دور المستخدم (مثل user أو admin) في الجلسة
                session.setAttribute("role", rs.getString("role"));

                // تخزين قيمة boolean تعبر إذا كان المستخدم مسؤول (admin) أم لا
                session.setAttribute("isAdmin", rs.getBoolean("isAdmin"));

                // إعادة توجيه المستخدم إلى الصفحة الرئيسية بعد تسجيل الدخول الناجح
                response.sendRedirect("welcome.jsp");

            } else {
                // في حالة عدم وجود المستخدم أو عدم تطابق البيانات:

                // تعيين رسالة خطأ ليتم عرضها في صفحة تسجيل الدخول
                request.setAttribute("errorMessage", "البريد الإلكتروني أو كلمة المرور غير صحيحة.");

                // إعادة توجيه المستخدم إلى صفحة تسجيل الدخول مع إرسال رسالة خطأ في الرابط
                response.sendRedirect("login.jsp?error=invalid");

                // إعداد توجيه الطلب داخل الخادم إلى صفحة تسجيل الدخول (forward) مع الاحتفاظ بالرسالة
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

            // إغلاق نتائج الاستعلام لتحرير الموارد
            rs.close();

            // إغلاق جملة الاستعلام المحضرة لتحرير الموارد
            ps.close();

            // إغلاق اتصال قاعدة البيانات لتحرير الموارد
            con.close();

        } catch (Exception e) {
            // طباعة استثناء الخطأ في الـ console أو سجل الأخطاء
            e.printStackTrace();

            // إرسال رسالة الخطأ إلى المستخدم في الصفحة الحالية (على شكل نص)
            response.getWriter().println("حدث خطأ أثناء المعالجة: " + e.getMessage());
        }
    }
}

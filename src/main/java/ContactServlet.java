import java.io.*; // استيراد مكتبة الإدخال والإخراج الأساسية
import jakarta.servlet.*; // استيراد مكتبات السيرفلت الأساسية
import jakarta.servlet.http.*; // استيراد مكتبات HTTP الخاصة بالسيرفلت
import java.sql.*; // استيراد مكتبات التعامل مع قواعد البيانات (JDBC)

public class ContactServlet extends HttpServlet {
    // إعادة تعريف ميثود doPost لمعالجة طلبات POST القادمة إلى السيرفلت
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // تعيين ترميز الطلب إلى UTF-8 لدعم اللغة العربية في استقبال البيانات
        request.setCharacterEncoding("UTF-8");

        // الحصول على قيمة حقل "name" من نموذج الإرسال
        String name = request.getParameter("name");
        // الحصول على قيمة حقل "email" من نموذج الإرسال
        String email = request.getParameter("email");
        // الحصول على قيمة حقل "message" من نموذج الإرسال
        String message = request.getParameter("message");

        // إعداد بيانات الاتصال بقاعدة البيانات: رابط القاعدة، اسم المستخدم، كلمة المرور
        String url = "jdbc:mysql://localhost:3306/student_portal";
        String dbUser = "root";
        String dbPassword = "";

        // متغير لتحديد حالة نجاح الإدخال في قاعدة البيانات (افتراضياً false)
        boolean success = false;

        try {
            // تحميل سائق MySQL الخاص بـ JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            // إنشاء اتصال بقاعدة البيانات باستخدام المعلومات المعطاة
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
            // إعداد استعلام الإدخال مع علامات استفهام تمثل القيم التي سيتم تعيينها لاحقاً
            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            // إنشاء كائن PreparedStatement لتجهيز وتنفيذ الاستعلام
            PreparedStatement stmt = conn.prepareStatement(sql);
            // تعيين القيمة الأولى (name) في الاستعلام
            stmt.setString(1, name);
            // تعيين القيمة الثانية (email) في الاستعلام
            stmt.setString(2, email);
            // تعيين القيمة الثالثة (message) في الاستعلام
            stmt.setString(3, message);

            // تنفيذ الاستعلام وتخزين عدد الصفوف المتأثرة (يجب أن يكون أكبر من صفر إذا نجح الإدخال)
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                // إذا تم إدخال صف واحد على الأقل، نعتبر العملية ناجحة
                success = true;
            }

            // إغلاق PreparedStatement لتحرير الموارد
            stmt.close();
            // إغلاق الاتصال بقاعدة البيانات
            conn.close();
        } catch (Exception e) {
            // طباعة تفاصيل الخطأ في حالة حدوث استثناء (لم يتم عرض رسالة للمستخدم هنا)
            e.printStackTrace();
        }

        // تعيين متغير "success" في طلب السيرفلت ليتم استخدامه في صفحة JSP لاحقاً
        request.setAttribute("success", success);
        // إنشاء كائن RequestDispatcher لتحويل الطلب إلى صفحة contact.jsp
        RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
        // إعادة توجيه الطلب والاستجابة إلى صفحة contact.jsp لعرض النتائج
        rd.forward(request, response);
    }
}

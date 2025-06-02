import java.io.IOException; // استيراد مكتبة التعامل مع استثناءات الإدخال والإخراج
import jakarta.servlet.ServletException; // استيراد استثناءات السيرفلت
import jakarta.servlet.annotation.WebServlet; // استيراد الدعم لتحديد السيرفلت عبر التعليقات التوضيحية (Annotations)
import jakarta.servlet.http.*; // استيراد مكتبات HTTP الخاصة بالسيرفلت (الطلبات، الاستجابات، الجلسات...)

// تعريف السيرفلت مع تعيين عنوان URL للتعامل مع الطلبات التي تأتي إلى "/LanguageServlet"
@WebServlet("/LanguageServlet")
public class LanguageServlet extends HttpServlet {

    // تنفيذ هذا الميثود عند استقبال طلب GET (مثل عند الضغط على رابط أو فتح صفحة مع باراميتر)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // الحصول على قيمة المتغير "lang" من عنوان الرابط (Query Parameter)
        // مثلاً لو الرابط يحتوي ?lang=ar ستكون القيمة "ar"
        String lang = request.getParameter("lang");

        // تخزين قيمة "language" في كائن الطلب (request) لكي يتم إرسالها إلى الصفحة التالية (details.jsp)
        request.setAttribute("language", lang);

        // تحويل (Forward) الطلب والاستجابة إلى الصفحة details.jsp لعرض التفاصيل بناءً على اللغة المختارة
        request.getRequestDispatcher("details.jsp").forward(request, response);
    }
}

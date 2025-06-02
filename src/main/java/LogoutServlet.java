// استيراد الحزم الخاصة بـ Servlet و HTTP المطلوبة للتعامل مع الطلبات والاستجابات
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

// تعريف سيرفلت LogoutServlet الذي يرث من HttpServlet
public class LogoutServlet extends HttpServlet {

    // تنفيذ هذا الميثود عند استقبال طلب GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // الحصول على الجلسة الحالية إذا كانت موجودة، وعدم إنشاء جلسة جديدة إذا لم تكن موجودة (false)
        HttpSession session = request.getSession(false);

        // التحقق إذا كانت الجلسة موجودة
        if (session != null) {
            // إبطال (إنهاء) الجلسة الحالية، أي حذف كل بيانات الجلسة
            session.invalidate();
        }

        // إعادة توجيه المستخدم إلى صفحة تسجيل الدخول مع إرسال رسالة في الرابط تفيد بتسجيل الخروج
        response.sendRedirect("login.jsp?msg=logout");
    }
}

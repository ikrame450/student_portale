<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>📨 الرسائل</title>

    <style>
        /* تنسيقات الصفحة بالكامل */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl; /* الاتجاه من اليمين لليسار للغة العربية */
            background-color: #eef5f9;
            padding-top: 70px; /* إزاحة للأسفل بسبب النافبار */
        }

        /* تنسيق شريط التنقل */
        nav {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            padding: 15px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* روابط القائمة */
        .nav-links {
            display: flex;
            gap: 20px;
            align-items: center;
            flex-grow: 1;
            justify-content: flex-start;
        }

        /* تنسيق الروابط داخل النافبار */
        nav a {
            color: white;
            text-decoration: none;
            font-size: 17px;
            padding: 5px 12px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            white-space: nowrap;
        }

        /* تأثير عند تمرير الماوس */
        nav a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        /* الرابط النشط */
        nav a.active {
            background-color: #cc2b5e;
            color: #fff;
            font-weight: bold;
        }

        /* معلومات المستخدم */
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
            font-size: 18px;
            white-space: nowrap;
            margin-left: 30px;
            flex-shrink: 0;
        }

        .user-info img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* حاوية الرسائل */
        .message-container {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            margin: 50px auto;
            padding: 40px;
            width: 80%;
            border-radius: 15px;
            box-shadow: 0 0 10px #ccc;
            color: white;
        }

        h2 {
            margin-top: 0;
        }

        /* جدول عرض الرسائل */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            color: black;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #d2ecf5;
        }

        /* زر الحذف */
        .delete-btn {
            background-color: #e74c3c;
            color: white;
            padding: 6px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        /* إشعار النجاح */
        .success-alert {
            background-color: #2ecc71;
            color: white;
            padding: 15px;
            margin-top: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
        }
    </style>

    <script>
        // تفعيل الرابط النشط في شريط التنقل
        window.addEventListener('DOMContentLoaded', () => {
            const links = document.querySelectorAll('nav a');
            const currentPath = window.location.pathname.split('/').pop();

            links.forEach(link => {
                const linkPath = link.getAttribute('href').split('/').pop();
                if (linkPath === currentPath) {
                    link.classList.add('active');
                } else {
                    link.classList.remove('active');
                }
            });
        });
    </script>
</head>
<body>

<!-- شريط التنقل -->
<nav>
    <div class="nav-links">
        <a href="home.jsp">الرئيسية</a>
        <a href="contact.jsp">اتصل بنا</a>
        <a href="about.jsp">حول</a>
        <% String role = (String) session.getAttribute("role"); if ("admin".equals(role)) { %>
        <a href="messages.jsp">📨 الرسائل</a>
        <% } %>
        <a href="LogoutServlet">تسجيل الخروج</a>

        <!-- عرض اسم المستخدم -->
        <div class="user-info">
            <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon">
            مرحباً، <%= session.getAttribute("username") != null ? session.getAttribute("username") : "زائر" %>
        </div>
    </div>
</nav>

<!-- محتوى الرسائل -->
<div class="message-container">
    <h2>📨 الرسائل المستلمة</h2>

    <%-- التحقق من الصلاحيات --%>
    <% if (role == null || !"admin".equals(role)) {
        response.sendRedirect("home.jsp"); return;
    } %>

    <%-- إشعار الحذف --%>
    <% if (request.getParameter("deleted") != null) { %>
        <div class="success-alert">✅ تم حذف الرسالة بنجاح!</div>
    <% } %>

    <%-- جلب الرسائل من قاعدة البيانات --%>
    <% Connection con = null; PreparedStatement ps = null; ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_portal", "root", "");
            ps = con.prepareStatement("SELECT id, name, email, message FROM contact_messages ORDER BY id DESC");
            rs = ps.executeQuery();
    %>

    <!-- جدول عرض الرسائل -->
    <table>
        <tr>
            <th>الاسم</th>
            <th>البريد الإلكتروني</th>
            <th>الرسالة</th>
            <th>الإجراء</th>
        </tr>

        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("message") %></td>
            <td>
                <!-- نموذج الحذف -->
                <form method="post" action="DeleteMessageServlet" onsubmit="return confirm('هل أنت متأكد من حذف هذه الرسالة؟');">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="delete-btn">🗑 حذف</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>

    <%-- معالجة الاستثناءات --%>
    <% } catch (Exception e) {
        out.println("<p style='color: red;'>حدث خطأ: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ex) {}
        if (ps != null) try { ps.close(); } catch (Exception ex) {}
        if (con != null) try { con.close(); } catch (Exception ex) {}
    } %>
</div>

</body>
</html>

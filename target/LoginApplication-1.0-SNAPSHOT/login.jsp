<%@ page contentType="text/html;charset=UTF-8" language="java" %> <!-- توجيه JSP لضبط نوع المحتوى وترميز UTF-8 لدعم اللغة العربية -->

<!DOCTYPE html> <!-- إعلان نوع المستند -->
<html lang="ar"> <!-- تحديد لغة الصفحة كلغة عربية -->
<head>
    <meta charset="UTF-8"> <!-- تعيين الترميز لدعم الأحرف العربية بشكل صحيح -->
    <title>تسجيل الدخول</title> <!-- عنوان الصفحة يظهر في شريط المتصفح -->
    <style>
        /* تنسيقات CSS لواجهة تسجيل الدخول */

        body {
            margin: 0; /* إزالة الهوامش الافتراضية */
            padding: 0; /* إزالة الحشوة الافتراضية */
            font-family: 'Segoe UI', sans-serif; /* اختيار خط عصري */
            background: linear-gradient(to right, #7f00ff, #e100ff); /* خلفية بتدرج لوني جذاب */
            height: 100vh; /* جعل ارتفاع الصفحة بارتفاع الشاشة بالكامل */
            display: flex; /* استخدام Flexbox لترتيب العناصر */
            justify-content: center; /* توسيط العنصر أفقيًا */
            align-items: center; /* توسيط العنصر عموديًا */
            direction: rtl; /* جعل اتجاه النصوص من اليمين إلى اليسار */
        }

        .login-box {
            background: linear-gradient(135deg, #6f86d6, #48c6ef); /* خلفية مائلة مميزة للصندوق */
            width: 380px; /* عرض الصندوق */
            padding: 40px 30px; /* الحشوة الداخلية للصندوق */
            border-radius: 25px; /* جعل زوايا الصندوق مستديرة */
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2); /* ظل خفيف للصندوق لإبرازه */
            color: white; /* لون النص */
            text-align: center; /* توسيط النصوص */
            position: relative; /* تحديد موضع نسبي لعناصر داخله */
        }

        .login-box h2 {
            margin-bottom: 25px; /* مسافة تحت العنوان */
            font-size: 28px; /* حجم خط العنوان */
        }

        .input-box {
            position: relative; /* لتحديد موضع الأيقونات داخلها */
            margin-bottom: 20px; /* مسافة بين الحقول */
        }

        .input-box input {
            width: 100%; /* جعل حقل الإدخال بعرض كامل */
            padding: 12px 40px 12px 12px; /* حشوة داخلية مع مساحة لأيقونة على اليمين */
            border: none; /* إزالة الإطار */
            border-radius: 30px; /* حواف مستديرة */
            font-size: 15px; /* حجم الخط */
            box-sizing: border-box; /* حساب الحشوة ضمن العرض */
        }

        .input-box i {
            position: absolute; /* تموضع الأيقونة بشكل حر */
            top: 50%; /* في منتصف الحقل عموديًا */
            right: 12px; /* بمحاذاة اليمين */
            transform: translateY(-50%); /* توسيط عمودي دقيق */
            color: #666; /* لون الأيقونة */
            cursor: pointer; /* جعل المؤشر على شكل يد عند المرور */
        }

        .toggle-password {
            position: absolute; /* أيقونة إظهار/إخفاء كلمة المرور */
            left: 12px; /* على اليسار */
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
            color: #666;
            cursor: pointer;
        }

        .login-box button {
            width: 100%; /* زر بعرض كامل */
            padding: 12px; /* حشوة داخل الزر */
            border: none;
            border-radius: 30px;
            background: linear-gradient(to right, #00c6ff, #0072ff); /* تدرج لوني أنيق للزر */
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        .login-box button:hover {
            opacity: 0.9; /* تأثير بصري عند المرور */
        }

        .login-box .options {
            margin-top: 15px;
            font-size: 14px;
        }

        .login-box .options a {
            color: white;
            text-decoration: underline;
        }

        .status-message {
            color: yellow; /* لون مميز للرسائل */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>تسجيل الدخول</h2>

    <!-- عرض رسائل الحالة بناءً على معلمات URL -->
    <%
        String error = request.getParameter("error"); // التقاط رسالة الخطأ من الرابط
        String msg = request.getParameter("msg"); // التقاط رسالة عامة من الرابط
        if ("invalid".equals(error)) {
    %>
    <p class="status-message">البريد الإلكتروني أو كلمة المرور غير صحيحة</p> <!-- رسالة خطأ -->
    <%
        }
        if ("success".equals(msg)) {
    %>
    <p class="status-message">تم التسجيل بنجاح، الرجاء تسجيل الدخول</p> <!-- رسالة نجاح تسجيل -->
    <%
        }
        if ("logout".equals(msg)) {
    %>
    <p class="status-message">تم تسجيل الخروج بنجاح</p> <!-- رسالة تسجيل خروج -->
    <%
        }
    %>

    <!-- نموذج تسجيل الدخول -->
    <form action="LoginServlet" method="post"> <!-- إرسال البيانات إلى السيرفلت -->
        <!-- حقل البريد الإلكتروني -->
        <div class="input-box">
            <input type="email" name="email" placeholder="البريد الإلكتروني" required>
            <i>👤</i> <!-- أيقونة تمثل المستخدم -->
        </div>

        <!-- حقل كلمة المرور -->
        <div class="input-box">
            <input type="password" name="password" id="password" placeholder="كلمة المرور" required>
            <i>🔒</i> <!-- أيقونة قفل -->
            <span class="toggle-password" onclick="togglePassword()">👁️</span> <!-- تبديل عرض كلمة المرور -->
        </div>

        <button type="submit">دخول</button> <!-- زر الدخول -->
    </form>

    <!-- روابط مساعدة -->
    <div class="options">
        <p>ليس لديك حساب؟ <a href="register.jsp">سجل الآن</a></p> <!-- رابط إلى صفحة التسجيل -->
    </div>
</div>

<!-- جافاسكريبت لإظهار/إخفاء كلمة المرور -->
<script>
    function togglePassword() {
        const passwordField = document.getElementById("password");
        const toggleIcon = document.querySelector(".toggle-password");

        if (passwordField.type === "password") {
            passwordField.type = "text"; // عرض كلمة المرور
            toggleIcon.textContent = "🙈"; // تغيير الأيقونة
        } else {
            passwordField.type = "password"; // إخفاء كلمة المرور
            toggleIcon.textContent = "👁️"; // إعادة الأيقونة
        }
    }
</script>
</body>
</html>

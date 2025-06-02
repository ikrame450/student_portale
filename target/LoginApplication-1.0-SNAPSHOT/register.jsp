.
<%@ page contentType="text/html;charset=UTF-8" language="java" %> <!-- إعداد الصفحة لدعم اللغة العربية وتحديد الترميز -->
<!DOCTYPE html> <!-- تعريف نوع المستند بأنه HTML5 -->
<html lang="ar"> <!-- تحديد لغة الصفحة بأنها العربية -->
<head>
    <meta charset="UTF-8"> <!-- تحديد ترميز الحروف ليكون UTF-8 لدعم العربية -->
    <title>إنشاء حساب</title> <!-- عنوان الصفحة في شريط المتصفح -->

    <style>
        /* تنسيق جسم الصفحة */
        body {
            margin: 0; /* إزالة الهوامش الافتراضية */
            padding: 0; /* إزالة الحشو الداخلي */
            font-family: 'Segoe UI', sans-serif; /* الخط المستخدم في الصفحة */
            background: linear-gradient(to right, #7f00ff, #e100ff); /* تدرج لوني للخلفية */
            height: 100vh; /* جعل الصفحة تغطي كامل ارتفاع الشاشة */
            display: flex; /* استخدام Flexbox لمركزة المحتوى */
            justify-content: center; /* توسيط أفقي */
            align-items: center; /* توسيط عمودي */
            direction: rtl; /* جعل اتجاه النص من اليمين لليسار */
        }

        /* صندوق التسجيل */
        .register-box {
            background: linear-gradient(135deg, #6f86d6, #48c6ef); /* تدرج لوني داخلي للصندوق */
            width: 400px; /* عرض الصندوق */
            padding: 40px 30px; /* مساحة داخلية حول المحتوى */
            border-radius: 25px; /* حواف دائرية */
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2); /* ظل خفيف للصندوق */
            color: white; /* لون النص داخل الصندوق */
            text-align: center; /* توسيط النص */
        }

        /* عنوان النموذج */
        .register-box h2 {
            margin-bottom: 25px; /* مسافة تحت العنوان */
            font-size: 28px; /* حجم الخط */
        }

        /* حاوية الحقول */
        .input-box {
            position: relative; /* لتمكين تموضع العناصر الداخلية بشكل نسبي */
            margin-bottom: 20px; /* مسافة تحت كل حقل */
        }

        /* الحقول النصية */
        .input-box input {
            width: 100%; /* عرض الحقل يغطي كامل العرض المتاح */
            padding: 12px; /* حشو داخلي */
            padding-right: 40px; /* مساحة كافية لظهور الأيقونة في الحقل */
            border: none; /* إزالة الإطار */
            border-radius: 30px; /* حواف دائرية للحقل */
            font-size: 15px; /* حجم الخط داخل الحقل */
        }

        /* الأيقونات داخل الحقول */
        .input-box i {
            position: absolute; /* تحديد موقع الأيقونة داخل الحقل */
            top: 50%; /* منتصف الحقل عاموديًا */
            right: 12px; /* تبعد عن الجهة اليمنى */
            transform: translateY(-50%); /* توسيط الأيقونة تمامًا */
            color: #666; /* لون الأيقونة */
        }

        /* زر إظهار/إخفاء كلمة المرور */
        .toggle-password {
            position: absolute; /* تحديد موضع الزر */
            top: 50%; /* توسيطه عموديًا */
            left: 12px; /* من الجهة اليسرى (لأننا في RTL) */
            transform: translateY(-50%); /* تصحيح تموضع الزر */
            background: none; /* بدون خلفية */
            border: none; /* بدون حدود */
            color: #fff; /* لون الأيقونة */
            font-size: 16px; /* حجم الأيقونة */
            cursor: pointer; /* تحويل المؤشر إلى يد عند المرور */
        }

        /* زر التسجيل */
        button[type="submit"] {
            width: 100%; /* يغطي الزر كامل العرض */
            padding: 12px; /* حشو داخلي */
            border: none; /* بدون حدود */
            border-radius: 30px; /* حواف دائرية */
            background: linear-gradient(to right, #00c6ff, #0072ff); /* تدرج لوني */
            color: white; /* لون النص */
            font-size: 16px; /* حجم الخط */
            cursor: pointer; /* تغيير شكل المؤشر */
            margin-top: 10px; /* مسافة من الأعلى */
        }

        /* تأثير تحويم الزر */
        button[type="submit"]:hover {
            opacity: 0.9; /* تقليل الشفافية عند التحويم */
        }

        /* قسم الروابط الإضافية */
        .options {
            margin-top: 15px; /* مسافة من الأعلى */
            font-size: 14px; /* حجم الخط */
        }

        /* روابط النص */
        .options a {
            color: white; /* لون الرابط */
            text-decoration: underline; /* تحت خط للرابط */
        }
    </style>
</head>

<body>
<!-- صندوق التسجيل -->
<div class="register-box">
    <h2>إنشاء حساب جديد</h2> <!-- عنوان النموذج -->

    <!-- نموذج التسجيل -->
    <form action="RegisterServlet" method="post"> <!-- إرسال البيانات إلى سيرفلت RegisterServlet -->
        
        <!-- حقل اسم المستخدم -->
        <div class="input-box">
            <input type="text" name="username" placeholder="اسم المستخدم" required> <!-- إدخال نص -->
            <i>👤</i> <!-- أيقونة داخل الحقل -->
        </div>

        <!-- حقل البريد الإلكتروني -->
        <div class="input-box">
            <input type="email" name="email" placeholder="البريد الإلكتروني" required> <!-- إدخال إيميل -->
            <i>📧</i> <!-- أيقونة -->
        </div>

        <!-- حقل كلمة المرور -->
        <div class="input-box">
            <input type="password" name="password" id="password" placeholder="كلمة المرور" required> <!-- حقل كلمة سر -->
            <i>🔒</i> <!-- أيقونة قفل -->
            <button type="button" class="toggle-password" onclick="togglePassword()">👁️</button> <!-- زر لإظهار كلمة المرور -->
        </div>

        <!-- زر إرسال النموذج -->
        <button type="submit">تسجيل</button>
    </form>

    <!-- رابط تسجيل الدخول -->
    <div class="options">
        <p>لديك حساب؟ <a href="login.jsp">سجل دخولك</a></p> <!-- رابط يعود لصفحة تسجيل الدخول -->
    </div>
</div>

<!-- سكريبت إظهار/إخفاء كلمة المرور -->
<script>
    function togglePassword() {
        var passwordField = document.getElementById("password"); // الحصول على حقل كلمة السر
        var type = passwordField.getAttribute("type"); // قراءة نوع الحقل الحالي
        if (type === "password") {
            passwordField.setAttribute("type", "text"); // تغييره إلى نص لعرض الكلمة
        } else {
            passwordField.setAttribute("type", "password"); // إعادته لكلمة مرور
        }
    }
</script>

</body>
</html>

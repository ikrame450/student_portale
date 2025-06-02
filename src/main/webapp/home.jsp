<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%-- تحديد نوع المحتوى وترميز الصفحة للغة العربية --%>

<!DOCTYPE html>
<html lang="ar"> <%-- تعيين اللغة إلى العربية --%>

<head>
    <meta charset="UTF-8"> <%-- تعيين ترميز الصفحة إلى UTF-8 لدعم اللغة العربية --%>
    <title>الصفحة الرئيسية</title> <%-- عنوان الصفحة الظاهر في شريط المتصفح --%>

    <style>
        /* تنسيق عام للجسم */
        body {
            margin: 0; /* إزالة الهامش الافتراضي */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* الخط المستخدم */
            direction: rtl; /* اتجاه الكتابة من اليمين لليسار */
            background-color: #eef5f9; /* لون الخلفية */
            padding-top: 70px; /* ترك مساحة أعلى للجسم لأن النافبار ثابت */
        }

        /* تصميم شريط التنقل (navbar) */
        nav {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e); /* تدرج لوني للنافبار */
            padding: 15px 40px; /* حشوة داخلية */
            display: flex; /* استخدام فليكس لجعل العناصر على صف واحد */
            align-items: center; /* محاذاة عمودية للعناصر */
            justify-content: space-between; /* توزيع العناصر بين الطرفين */
            position: fixed; /* جعل الشريط ثابت في الأعلى */
            top: 0; /* تثبيته في أعلى الصفحة */
            width: 100%; /* عرضه يساوي عرض الشاشة بالكامل */
            z-index: 1000; /* يظهر فوق أي عنصر آخر */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* ظل خفيف للنافبار */
        }

        /* روابط النافبار مرتبة في صف */
        .nav-links {
            display: flex; /* صف أفقي */
            gap: 20px; /* مسافة بين الروابط */
            align-items: center; /* محاذاة عمودية وسطية */
            flex-grow: 1; /* تأخذ كل المساحة الممكنة */
            justify-content: flex-start; /* تبدأ من اليمين (بسبب rtl) */
        }

        /* تصميم الروابط داخل النافبار */
        nav a {
            color: white; /* لون النص */
            text-decoration: none; /* إزالة التسطير */
            font-size: 17px; /* حجم الخط */
            padding: 5px 12px; /* الحشوة داخل الرابط */
            border-radius: 5px; /* الزوايا مستديرة */
            transition: background-color 0.3s, color 0.3s; /* تأثير الانتقال عند التمرير */
            white-space: nowrap; /* منع كسر النص إلى سطرين */
        }

        /* تأثير التمرير على الرابط */
        nav a:hover {
            background-color: rgba(255, 255, 255, 0.3); /* لون خلفية عند التمرير */
        }

        /* الرابط النشط المميز */
        nav a.active {
            background-color: #cc2b5e; /* خلفية مميزة */
            color: #fff; /* نص أبيض */
            font-weight: bold; /* جعل الخط عريض */
        }

        /* معلومات المستخدم بجانب الروابط */
        .user-info {
            display: flex; /* ترتيب الصورة والنص بجانب بعض */
            align-items: center; /* محاذاة عمودية */
            gap: 10px; /* مسافة بين الصورة والنص */
            color: white; /* لون النص */
            font-size: 18px; /* حجم الخط */
            white-space: nowrap; /* لا يكسر النص */
            margin-left: 30px; /* مسافة يسار الروابط */
            flex-shrink: 0; /* لا تصغر عند تصغير الشاشة */
        }

        /* صورة المستخدم */
        .user-info img {
            width: 36px;
            height: 36px;
            border-radius: 50%; /* دائرية الشكل */
            object-fit: cover; /* تغطية الصورة داخل الإطار */
        }

        /* تنسيق منطقة المحتوى */
        .content {
            padding: 30px; /* مسافة داخلية حول المحتوى */
        }

        /* تنسيق كل قسم */
        .section {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e); /* تدرج لوني */
            padding: 20px; /* حشوة داخلية */
            margin-bottom: 30px; /* مسافة أسفل كل قسم */
            border-radius: 12px; /* زوايا مستديرة */
            box-shadow: 0 0 8px #ccc; /* ظل للصندوق */
            overflow: hidden; /* منع تجاوز المحتوى */
            color: white; /* لون النص */
        }

        /* صورة القسم */
        .section img {
            float: right; /* وضع الصورة على اليمين */
            width: 120px; /* عرض الصورة */
            margin-left: 20px; /* مسافة يسار الصورة */
        }

        /* تصميم زر "تفاصيل أكثر" */
        .btn {
            display: inline-block; /* عرض كبلوك داخلي */
            background-color: #ffffff; /* خلفية الزر */
            color: #1696a6; /* لون النص */
            border: none; /* إزالة الحدود */
            padding: 10px 20px; /* الحشوة داخل الزر */
            font-size: 14px; /* حجم الخط */
            margin-top: 10px; /* مسافة من الأعلى */
            border-radius: 8px; /* زوايا مستديرة */
            cursor: pointer; /* شكل المؤشر عند المرور */
            text-decoration: none; /* إزالة التسطير */
            transition: background-color 0.3s ease; /* تأثير عند التمرير */
        }

        /* تأثير الزر عند التمرير */
        .btn:hover {
            background-color: #f0f0f0; /* لون مختلف عند التمرير */
        }
    </style>
</head>

<body>

<%
    // استخراج اسم الصفحة الحالية من الرابط لتحديد الرابط النشط
    String currentPage = request.getRequestURI(); // مثال: /project/home.jsp
    currentPage = currentPage.substring(currentPage.lastIndexOf("/") + 1); // يأخذ فقط home.jsp
%>

<!-- شريط التنقل -->
<nav>
    <!-- روابط التنقل -->
    <div class="nav-links">
        <a href="home.jsp" class="<%= "home.jsp".equals(currentPage) ? "active" : "" %>">الرئيسية</a>
        <a href="contact.jsp" class="<%= "contact.jsp".equals(currentPage) ? "active" : "" %>">اتصل بنا</a>
        <a href="about.jsp" class="<%= "about.jsp".equals(currentPage) ? "active" : "" %>">حول</a>

        <%-- عرض رابط "الرسائل" فقط إذا كان المستخدم مديراً --%>
        <%
            String role = (String) session.getAttribute("role"); // استرجاع الدور من الجلسة
            if ("admin".equals(role)) {
        %>
            <a href="messages.jsp" class="<%= "messages.jsp".equals(currentPage) ? "active" : "" %>">📨 الرسائل</a>
        <%
            }
        %>

        <a href="LogoutServlet">تسجيل الخروج</a> <%-- رابط لتسجيل الخروج --%>

        <!-- عرض معلومات المستخدم -->
        <div class="user-info">
            <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon"> <%-- صورة المستخدم --%>
            مرحباً، <%= session.getAttribute("username") %> <%-- اسم المستخدم من الجلسة --%>
        </div>
    </div>
</nav>

<!-- المحتوى الرئيسي -->
<div class="content">

    <!-- قسم جافا -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/java/java-icon.svg" alt="Java">
        <h2>لغة جافا</h2>
        <p>لغة برمجة قوية تُستخدم في تطوير التطبيقات على مختلف الأنظمة، مثل تطبيقات الويب، والأندرويد، والخوادم.</p>
        <a class="btn" href="details.jsp?lang=java">تفاصيل أكثر</a>
    </div>

    <!-- قسم C -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg" alt="C Language">
        <h2>لغة C</h2>
        <p>من أقدم اللغات البرمجية وأكثرها استخداماً في بناء الأنظمة ونظم التشغيل والبرمجيات القاعدية.</p>
        <a class="btn" href="details.jsp?lang=c">تفاصيل أكثر</a>
    </div>

    <!-- قسم بايثون -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/python/python-icon.svg" alt="Python">
        <h2>لغة بايثون</h2>
        <p>لغة سهلة وقوية تستخدم في الذكاء الاصطناعي، تطوير الويب، تحليل البيانات، وغيرها الكثير.</p>
        <a class="btn" href="details.jsp?lang=python">تفاصيل أكثر</a>
    </div>

    <!-- قسم كوتلين -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png" alt="Kotlin">
        <h2>لغة كوتلين</h2>
        <p>لغة حديثة تُستخدم لتطوير تطبيقات الأندرويد وتتميز بسهولة الكتابة والتكامل مع جافا.</p>
        <a class="btn" href="details.jsp?lang=kotlin">تفاصيل أكثر</a>
    </div>

    <!-- قسم React -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg" alt="React">
        <h2>مكتبة React</h2>
        <p>مكتبة جافاسكريبت تُستخدم في بناء واجهات المستخدم التفاعلية لتطبيقات الويب.</p>
        <a class="btn" href="details.jsp?lang=react">تفاصيل أكثر</a>
    </div>

    <!-- قسم PHP -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/php/php-icon.svg" alt="PHP">
        <h2>لغة PHP</h2>
        <p>لغة قوية لتطوير تطبيقات الويب، وتُستخدم في أنظمة إدارة المحتوى مثل ووردبريس.</p>
        <a class="btn" href="details.jsp?lang=php">تفاصيل أكثر</a>
    </div>

    <!-- قسم Flutter -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter">
        <h2>فلاتر</h2>
        <p>إطار عمل من جوجل لبناء تطبيقات جوال بواجهة واحدة تعمل على الأندرويد وiOS.</p>
        <a class="btn" href="details.jsp?lang=flutter">تفاصيل أكثر</a>
    </div>
</div>

</body>

</html>

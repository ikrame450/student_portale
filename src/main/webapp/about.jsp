<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ar">
<head>    
    <meta charset="UTF-8">
    <title>حول الموقع</title>

    <style>
        /* إعدادات عامة لجسم الصفحة */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl; /* من اليمين لليسار */
            background-color: #f9f9f9;
            padding-top: 70px; /* لإفساح مساحة للنافبار المثبت في الأعلى */
        }

        /* تصميم شريط التنقل (Navbar) */
        nav {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            padding: 15px 40px;
            display: flex;               /* تفعيل Flexbox لترتيب المحتوى في صف */
            align-items: center;         /* محاذاة عمودية وسطية لكل العناصر */
            justify-content: space-between; /* توزيع المسافات بين العناصر */
            position: fixed;             /* تثبيت النافبار في أعلى الصفحة */
            top: 0;
            width: 100%;
            z-index: 1000;               /* ليكون فوق باقي المحتوى */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* ظل خفيف */
        }

        /* حاوية روابط النافبار (تأخذ معظم العرض) */
        .nav-links {
            display: flex;               /* لترتيب الروابط أفقياً */
            gap: 20px;                  /* فراغ بين الروابط */
            align-items: center;         /* محاذاة عمودية وسطية */
            flex-grow: 1;                /* لتأخذ أكبر مساحة ممكنة */
            justify-content: flex-start; /* تبدأ من اليمين بسبب rtl */
        }

        /* روابط النافبار */
        nav a {
            color: white;
            text-decoration: none;
            font-size: 17px;
            padding: 5px 12px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            white-space: nowrap;         /* لمنع التفاف النص إلى أسطر */
        }

        /* تأثير عند مرور الماوس على الرابط */
        nav a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        /* الرابط النشط */
        nav a.active {
            background-color: #cc2b5e;
            color: #fff;
            font-weight: bold;
        }

        /* صندوق الترحيب مع صورة المستخدم على نفس استقامة الروابط */
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;                  /* مسافة بين الصورة والنص */
            color: white;
            font-size: 18px;
            white-space: nowrap;        /* عدم التفاف النص */
            margin-left: 30px;          /* مسافة بين روابط و صندوق الترحيب */
            flex-shrink: 0;             /* عدم تصغير الصندوق */
        }

        /* صورة المستخدم داخل صندوق الترحيب */
        .user-info img {
            width: 36px;
            height: 36px;
            border-radius: 50%;         /* لجعل الصورة دائرية */
            object-fit: cover;          /* لتغطية الصندوق دون تشويه */
        }

        /* صندوق المحتوى الأساسي */
        .content {
            padding: 40px;
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            margin: 50px auto;
            width: 80%;
            border-radius: 15px;
            box-shadow: 0 0 8px #ccc;
            color: white;
            line-height: 1.6;
        }
    </style>

    <script>
        // سكريبت لجعل الرابط الحالي في النافبار يتلون بشكل مختلف (رابط نشط)
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

<nav>
    <!-- روابط النافبار مع صندوق الترحيب في نفس السطر -->
    <div class="nav-links">
        <a href="home.jsp">الرئيسية</a>
        <a href="contact.jsp">اتصل بنا</a>
        <a href="about.jsp">حول</a>
        <%
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
        %>
        <a href="messages.jsp">📨 الرسائل</a>
        <%
        }
        %>
        <a href="LogoutServlet">تسجيل الخروج</a>

        <!-- صندوق الترحيب مع صورة المستخدم -->
        <div class="user-info">
            <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon" />
            مرحباً، <%= session.getAttribute("username") %>
        </div>
    </div>
</nav>

<div class="content">
    <h2>من نحن؟</h2>
    <p>نحن فريق مخصص لمساعدة الطلاب والمطورين الجدد على تعلم البرمجة من خلال تطبيقات عملية مبنية باستخدام Java و JSP وServlets.</p>
    <p>هدفنا هو تقديم بيئة تعليمية سهلة وسلسة، مع أمثلة حقيقية وتمارين تطبيقية لتقوية المهارات.</p>
    <p>الموقع يشمل دروساً في لغات متعددة مثل Java، Python، وC، مع واجهة سهلة الاستخدام ومحتوى تعليمي مفصل.</p>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    String lang = request.getParameter("lang");
    String title = "", desc = "", img = "", video = "";

    if ("java".equals(lang)) {
        title = "لغة جافا";
        desc = "جافا هي لغة برمجة عالية المستوى، كائنية التوجه (Object-Oriented)، تم تطويرها لأول مرة من قِبل شركة Sun Microsystems عام 1995، وتملكتها لاحقًا شركة Oracle. تُعتبر جافا من أكثر لغات البرمجة استخدامًا على مستوى العالم بفضل قابليتها للعمل عبر الأنظمة والمنصات المختلفة دون تعديل الكود، عبر تقنية الـ Java Virtual Machine (JVM) التي تسمح بتشغيل التطبيقات على أي جهاز يحتوي على JVM، مما يجعل شعارها الشهير اكتب مرة، شغّل في أي مكان (Write Once, Run Anywhere) حقيقة فعلية.";
        img = "https://upload.wikimedia.org/wikipedia/en/3/30/Java_programming_language_logo.svg";
        video = "https://www.youtube.com/embed/grEKMHGYyns";
    } else if ("c".equals(lang)) {
        title = "لغة C";
        desc = "لغة C هي واحدة من أقدم وأكثر لغات البرمجة تأثيرًا، حيث طُورت في مختبرات Bell Labs في أوائل السبعينيات من قبل دينيس ريتشي. تُعتبر لغة منخفضة المستوى مقارنة باللغات الحديثة، مما يمنحها قدرة فائقة على التحكم في مكونات الحاسوب (مثل الذاكرة والمعالج)، ويجعلها الخيار الأمثل لتطوير أنظمة التشغيل (مثل Linux وUnix)، والمتحكمات الدقيقة (Microcontrollers)، والمترجمات (Compilers).";
        img = "https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg";
        video = "https://www.youtube.com/embed/KJgsSFOSQv0";
    } else if ("python".equals(lang)) {
        title = "لغة بايثون";
        desc = "بايثون هي لغة برمجة عالية المستوى، تم تطويرها في أوائل التسعينيات بواسطة  غويدو فان روسوم، واشتهرت بفضل تصميمها البسيط وسهولة قراءتها، مما يجعلها مثالية للمبتدئين والمحترفين على حد سواء. تعتمد بايثون على فلسفة  القابلية للقراءة أهم من التعقيد، وتدعم العديد من الأنماط البرمجية مثل الكائنية، الإجرائية، والوظيفية";
        img = "https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg";
        video = "https://www.youtube.com/embed/_uQrJ0TkZlc";
    } else if ("kotlin".equals(lang)) {
        title = "لغة كوتلن";
        desc = "كوتلين هي لغة برمجة حديثة تم تطويرها من قبل شركة JetBrains (نفس الشركة التي طورت IntelliJ IDEA) وظهرت لأول مرة في 2011. صُممت كوتلين لتكون بديلاً عصريًا للغة Java، حيث تحاول التخلص من تعقيد جافا عبر توفير كود مختصر، آمن من الأخطاء الشائعة (مثل NullPointerException)، ودعم أفضل للبرمجة الوظيفية (Functional Programming).";
        img = "https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png";
        video = "https://www.youtube.com/embed/F9UC9DY-vIU";
    } else if ("react".equals(lang)) {
        title = "مكتبة React";
        desc = "React هي مكتبة JavaScript مفتوحة المصدر تُستخدم لبناء واجهات المستخدم التفاعلية، وخاصةً في تطبيقات الويب أحادية الصفحة (Single Page Applications - SPA). تم تطويرها لأول مرة في عام 2011 بواسطة Jordan Walke، أحد مهندسي البرمجيات في شركة Facebook، وتم إطلاقها للعامة عام 2013. وقد أصبحت اليوم من أكثر الأدوات استخدامًا في تطوير واجهات الويب الحديثة.";
        img = "https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg";
        video = "https://www.youtube.com/embed/bMknfKXIFA8";
    } else if ("php".equals(lang)) {
        title = "لغة PHP";
        desc = "PHP هي لغة برمجة نصية (Scripting Language) تعمل من جهة الخادم (Server-side)، تم تصميمها خصيصًا لتطوير تطبيقات الويب الديناميكية. تم إنشاؤها لأول مرة عام 1995 بواسطة Rasmus Lerdorf، وكانت في البداية مجموعة من السكربتات لتتبع زوار موقعه الإلكتروني. تطورت لاحقًا لتصبح واحدة من أكثر لغات البرمجة استخدامًا على الإنترنت";
        img = "https://upload.wikimedia.org/wikipedia/commons/2/27/PHP-logo.svg";
        video = "https://www.youtube.com/embed/OK_JCtrrv-c";
    } else if ("flutter".equals(lang)) {
        title = "فلاتر (Flutter)";
        desc = "Flutter هو إطار عمل مفتوح المصدر من تطوير شركة Google، يُستخدم لبناء تطبيقات الهاتف المحمول، الويب، وسطح المكتب من قاعدة كود واحدة باستخدام لغة Dart. تم إطلاقه لأول مرة في عام 2017، وأصبح واحدًا من أسرع أطر التطوير نموًا بفضل سهولته وأدائه العالي وتصميماته الجذابة.";
        img = "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png";
        video = "https://www.youtube.com/embed/x0uinJvhNxI";
    } else {
        title = "لغة غير معروفة";
        desc = "لم يتم اختيار لغة صحيحة أو أن اللغة غير مدعومة حاليًا.";
        img = "https://upload.wikimedia.org/wikipedia/commons/6/65/Crystal_Project_info.png";
        video = "";
    }
%>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title><%= title %></title>
    <style>
        body {
            direction: rtl;
            background-color: #eef5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            padding-top: 80px;
        }

      
      /* شريط التنقل - navbar */
        nav {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            padding: 15px 40px;
            display: flex;            /* نستخدم فليكس ليكون المحتوى في سطر واحد */
            align-items: center;      /* محاذاة رأسية وسطية */
            justify-content: space-between; /* توزيع العناصر على كامل العرض */
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* روابط النافبار مع رسالة الترحيب والشعار كلها في سطر واحد */
        .nav-links {
            display: flex;
            gap: 20px; /* مسافة بين الروابط */
            align-items: center;
            flex-grow: 1; /* لكي تأخذ كل المساحة المتاحة */
            justify-content: flex-start; /* تبدأ من اليمين بسبب rtl */
        }

        /* تصميم الروابط */
        nav a {
            color: white;
            text-decoration: none;
            font-size: 17px;
            padding: 5px 12px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            white-space: nowrap; /* لا تكسر النص */
        }

        nav a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        nav a.active {
            background-color: #cc2b5e;
            color: #fff;
            font-weight: bold;
        }

        /* صندوق الترحيب مع الشعار بجانب الروابط */
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
            font-size: 18px;
            white-space: nowrap; /* نص لا يكسر */
            margin-left: 30px; /* مسافة بين روابط و الترحيب */
            flex-shrink: 0; /* لا يقلص */
        }

        .user-info img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }

        .card {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            padding: 30px;
            width: 75%;
            margin: 40px auto;
            border-radius: 15px;
            box-shadow: 0 0 10px #ccc;
            text-align: center;
        }

        .card img {
            width: 120px;
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
        }

        p {
            font-size: 18px;
            color: #333;
            line-height: 1.8;
        }

        .btn {
            margin-top: 30px;
            background-color: #ffffff;
            color: #1696a6;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #f0f0f0;
        }

        .video-section {
 background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
 width: 75%;
    margin: 0 auto 50px auto;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 0 10px #ccc;
    text-align: center;
}


        .video-section iframe {
            width: 100%;
            height: 400px;
            border-radius: 12px;
            border: none;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav>
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
    </div>

    <div class="user-info">
        <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon">
        مرحباً، <%= session.getAttribute("username") %>
    </div>
</nav>

<!-- Card Section -->
<div class="card">
    <img src="<%= img %>" alt="<%= title %>">
    <h2><%= title %></h2>
    <p><%= desc %></p>
    <a href="home.jsp" class="btn">رجوع إلى الرئيسية</a>
</div>

<!-- Video Section -->
<% if (!video.isEmpty()) { %>
<div class="video-section">
    <h2>فيديو تعريفي</h2>
    <iframe src="<%= video %>" allowfullscreen></iframe>
</div>
<% } %>

</body>
</html>

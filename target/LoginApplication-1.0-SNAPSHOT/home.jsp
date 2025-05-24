<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ar">

<head>
    <meta charset="UTF-8">
    <title>الصفحة الرئيسية</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl;
            background-color: #eef5f9;
            padding-top: 90px;
        }

        nav {
            background-color: #1696a6;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .nav-section {
            flex: 1;
            display: flex;
            justify-content: flex-start;
            gap: 25px;
        }

        .nav-section.center {
            justify-content: flex-end;
        }

        .nav-section.left {
            justify-content: flex-end;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 17px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .user-info {
            color: white;
            font-size: 18px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .user-info img {
            width: 28px;
            height: 28px;
            border-radius: 50%;
        }

        .content {
            padding: 30px;
        }

        .section {
            background: linear-gradient(to right, #48c6ef, #6f86d6);
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 12px;
            box-shadow: 0 0 8px #ccc;
            overflow: hidden;
        }

        .section img {
            float: right;
            width: 120px;
            margin-left: 20px;
        }

        .btn {
            display: inline-block;
            background-color: #ffffff;
            color: #1696a6;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            margin-top: 10px;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

<nav>
    <!-- يمين الروابط -->
    <div class="nav-section right">
        <a href="home.jsp">الرئيسية</a>
        <a href="contact.jsp">اتصل بنا</a>
        <a href="about.jsp">حول</a>
        <a href="LogoutServlet">تسجيل الخروج</a>
    </div>

    <!-- وسط: ترحيب مع صورة -->
    <div class="nav-section center">
        <div class="user-info">
            <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon" style="width: 32px; height: 32px; border-radius: 50%; vertical-align: middle; margin-left: 10px;"><!--  -->  
            مرحباً، <%= session.getAttribute("username") %>
        </div>
    </div>

    <!-- يسار فارغ لتوازن التصميم -->
    <div class="nav-section left"></div>
</nav>
        
        
<div class="content">
    <!-- Java -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/java/java-icon.svg" alt="Java">
        <h2>لغة جافا</h2>
        <p>لغة برمجة قوية تُستخدم في تطوير التطبيقات على مختلف الأنظمة، مثل تطبيقات الويب، والأندرويد، والخوادم.</p>
        <a class="btn" href="details.jsp?lang=java">تفاصيل أكثر</a>
    </div>

    <!-- C Language -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg" alt="C Language">
        <h2>لغة C</h2>
        <p>من أقدم اللغات البرمجية وأكثرها استخداماً في بناء الأنظمة ونظم التشغيل والبرمجيات القاعدية.</p>
        <a class="btn" href="details.jsp?lang=c">تفاصيل أكثر</a>
    </div>

    <!-- Python -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/python/python-icon.svg" alt="Python">
        <h2>لغة بايثون</h2>
        <p>لغة سهلة وقوية تستخدم في الذكاء الاصطناعي، تطوير الويب، تحليل البيانات، وغيرها الكثير.</p>
        <a class="btn" href="details.jsp?lang=python">تفاصيل أكثر</a>
    </div>

    <!-- Kotlin -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png" alt="Kotlin">
        <h2>لغة كوتلين</h2>
        <p>لغة حديثة تُستخدم لتطوير تطبيقات الأندرويد وتتميز بسهولة الكتابة والتكامل مع جافا.</p>
        <a class="btn" href="details.jsp?lang=kotlin">تفاصيل أكثر</a>
    </div>

    <!-- React -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg" alt="React">
        <h2>مكتبة React</h2>
        <p>مكتبة جافاسكريبت تُستخدم في بناء واجهات المستخدم التفاعلية لتطبيقات الويب.</p>
        <a class="btn" href="details.jsp?lang=react">تفاصيل أكثر</a>
    </div>

    <!-- PHP -->
    <div class="section">
        <img src="https://www.vectorlogo.zone/logos/php/php-icon.svg" alt="PHP">
        <h2>لغة PHP</h2>
        <p>لغة قوية لتطوير تطبيقات الويب، وتُستخدم في أنظمة إدارة المحتوى مثل ووردبريس.</p>
        <a class="btn" href="details.jsp?lang=php">تفاصيل أكثر</a>
    </div>

    <!-- Flutter -->
    <div class="section">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter">
        <h2>فلاتر</h2>
        <p>إطار عمل من جوجل لبناء تطبيقات جوال بواجهة واحدة تعمل على الأندرويد وiOS.</p>
        <a class="btn" href="details.jsp?lang=flutter">تفاصيل أكثر</a>
    </div>
</div>

</body>
</html>

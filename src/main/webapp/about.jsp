<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ar">
    <head>    

    <meta charset="UTF-8">

    <title>حول الموقع</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl;
            background-color: #f9f9f9;
            padding-top: 80px; /* ارتفاع الـ navbar تقريبًا */
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
            padding: 40px;
            background: linear-gradient(to right, #48c6ef, #6f86d6);            
            margin: 50px auto;
            width: 80%;
            border-radius: 15px;
            box-shadow: 0 0 8px #ccc;
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
    <h2>من نحن؟</h2>
    <p>نحن فريق مخصص لمساعدة الطلاب والمطورين الجدد على تعلم البرمجة من خلال تطبيقات عملية مبنية باستخدام Java و JSP وServlets.</p>
    <p>هدفنا هو تقديم بيئة تعليمية سهلة وسلسة، مع أمثلة حقيقية وتمارين تطبيقية لتقوية المهارات.</p>
    <p>الموقع يشمل دروساً في لغات متعددة مثل Java، Python، وC، مع واجهة سهلة الاستخدام ومحتوى تعليمي مفصل.</p>
</div>

</body>
</html>

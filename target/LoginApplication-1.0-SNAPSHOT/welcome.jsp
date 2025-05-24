<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    
    <meta charset="UTF-8">
    <title>أهلاً بك</title>
    <style>
        body {
            direction: rtl;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            padding-top: 100px;
        }
        .message {
            background-color: #fff;
            margin: auto;
            padding: 40px;
            width: 50%;
            border-radius: 15px;
            box-shadow: 0 0 10px #999;
        }
        .btn {
            display: inline-block;
            margin-top: 30px;
            background-color: #1696a6;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #117988;
        }
    </style>
</head>
<body>

<div class="message">
    <h1>تم تسجيل الدخول بنجاح!</h1>
    <p>مرحباً بك في موقعنا لتعلم البرمجة.</p>
    <a href="LogoutServlet" class="btn">تسجيل الخروج</a>

    <a href="home.jsp" class="btn">الذهاب إلى الصفحة الرئيسية</a>
</div>

</body>
</html>

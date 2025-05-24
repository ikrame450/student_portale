<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>تسجيل الدخول</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #48c6ef, #6f86d6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            direction: rtl;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #aaa;
            border-radius: 8px;
            font-size: 16px;
        }

        button {
            background-color: #1696a6;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        button:hover {
            background-color: #117988;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>تسجيل الدخول</h2>
    
    <%
    String error = request.getParameter("error");
    String msg = request.getParameter("msg");
    if ("invalid".equals(error)) {
%>
        <p style="color:red;">البريد الإلكتروني أو كلمة السر خاطئة!</p>
<%
    }
    if ("success".equals(msg)) {
%>
        <p style="color:green;">تم التسجيل بنجاح، الرجاء تسجيل الدخول.</p>
<%
    }
%>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="البريد الإلكتروني" required>
        <input type="password" name="password" placeholder="كلمة السر" required>
        <button type="submit">دخول</button>
      
        

    </form>
    <div class="footer">
<p>ليس لديك حساب؟ <a href="register.jsp">سجل الآن</a></p>

<%
    if ("logout".equals(request.getParameter("msg"))) {
%>
        <p style="color:blue;">تم تسجيل الخروج بنجاح.</p>
<%
    }
%>

    </div>
</div>

</body>
</html>

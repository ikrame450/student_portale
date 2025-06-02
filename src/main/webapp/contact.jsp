<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>اتصل بنا</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            direction: rtl;
            background-color: #eef5f9;
            padding-top: 70px; /* مساحة للنافبار الثابت */
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

        /* صندوق نموذج الاتصال */
        .contact-container {
            background: linear-gradient(to right, #2193b0, #6dd5ed, #cc2b5e);
            margin: 50px auto;
            padding: 40px;
            width: 70%;
            border-radius: 15px;
            box-shadow: 0 0 10px #ccc;
            color: white;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #aaa;
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
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #117988;
        }

        .success-message {
            color: whitesmoke;
            font-weight: bold;
            margin-top: 15px;
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
    <!-- روابط النافبار -->
    <div class="nav-links">
        <a href="home.jsp">الرئيسية</a>
        <a href="contact.jsp">اتصل بنا</a>
        <a href="about.jsp">حول</a>
        <% 
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
        %>
        <a href="messages.jsp">📨 الرسائل</a>
        <% } %>
        <a href="LogoutServlet">تسجيل الخروج</a>

        <!-- رسالة الترحيب مع الشعار في نفس السطر -->
        <div class="user-info">
            <img src="https://www.w3schools.com/howto/img_avatar.png" alt="User Icon">
            مرحباً، <%= session.getAttribute("username") %>
        </div>
    </div>
</nav>

<div class="contact-container">
    <h2>اتصل بنا</h2>
    <p>يمكنك التواصل معنا من خلال النموذج التالي:</p>
    <form method="post" action="ContactServlet">
        <input type="text" name="name" placeholder="الاسم الكامل" required>
        <input type="email" name="email" placeholder="البريد الإلكتروني" required>
        <textarea name="message" rows="5" placeholder="رسالتك" required></textarea>
        <button type="submit">إرسال</button>
    </form>

    <% 
    Boolean success = (Boolean) request.getAttribute("success");
    if (success != null && success) {
    %>
        <p class="success-message">تم إرسال رسالتك بنجاح!</p>
    <% 
    } 
    %>
</div>

</body>
</html>

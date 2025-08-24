<%-- 
    Document   : login.jsp
    Created on : 12 Dec 2024, 10:35:58 pm
    Author     : ayush
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cn.tech.connection.DBCon"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <section id="header">
        <a href="#" class="logo"><img src="img/logo.png" alt="logo" id="logo"></a>
        <div>
            <ul id="navbar">
                <li><a href="main.jsp">Home</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a class="active" href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Registration</a></li>
                <li id="lg-cart"><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <a href="#" id="close"><i class="fa-solid fa-xmark"></i></a>
            </ul>
        </div>
        <div id="mobile">
            <i id="bar" class="fas fa-outdent"></i>
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>
    </section>

    <div>
        <form action="user-login" method="post" id="login">
            <label for="Email">Email</label>
            <input name="email" type="email" placeholder="Enter your registered email address" required>

            <label for="Password">Password</label>
            <input name="password" type="password" placeholder="Enter your password" required>

            <button class="btn" id="btn-login" type="submit">Login</button>
            <a href="register.jsp" class="btn" id="btn-regis">New user? Register here</a>
        </form>
    </div>
</body>
</html>

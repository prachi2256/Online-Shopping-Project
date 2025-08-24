
<%@page import="cn.tech.model.product"%>
<%@page import="java.util.List"%>
<%@page import="cn.tech.dao.ProductDao"%>
<%@page import="cn.tech.connection.DBCon"%>
<%@page import="cn.tech.model.User"%>
<% 
   User auth=(User) request.getSession().getAttribute("auth");
   if(auth!=null)
   {
   request.setAttribute("auth",auth);
}
%> 
<%
ProductDao pd=new ProductDao(DBCon.getConnection());
List<product>products=pd.getAllProducts(); 
%> 


<!DOCTYPE html>
<html lang="en" style=" scroll-behavior: smooth;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <section id="header">
<a href="# "class="logo"><img src="img/logo.png" alt="logo" id="logo"></a>
<div>
    <ul id="navbar" >
  <li><a href="main.jsp">Home</a></li>
  <%
      if(auth!=null)
  {%>
   <li><a  href="orders.jsp">Orders</a></li>
    <li><a  href="logout">Logout</a></li>
  <%}
      else{
  %>
    <li><a  href="login.jsp">Login</a></li>
  <%}
  %>
  <li><a  href="blog.jsp">Blog</a></li>
  <li><a class="active"  href="shop.jsp">shop</a></li>
  <li><a href="about.jsp">about</a></li>
  <li><a href="contact.jsp">contact</a></li>
  
 
  
  <li id="lg-cart"><a href="cart.jsp" ><i class="fa-solid fa-cart-shopping"></i></a></li>
  <a href="#" id="close"> <i class="fa-solid fa-xmark"></i></a>
    </ul>
</div>
<div id="mobile">
<i id="bar" class="fas fa-outdent"></i>
<a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
</div>

    </section>

    <section id="page-header" class="shop-header">

<h2 style="font-size: 42px;
line-height: 54px;
color:#fff;">#stayhome</h2> 
<p 
style="font-size: 16px;
color: #fff;
margin: 15px 0 20px 0;">save more with coupons & upto 70% off</p>

    </section>

  <section class="fp" >
    
<div class="container">


  <%
  if(!products.isEmpty())
  {
      for(product p:products)
   {%>
      <div class="photo">
          <img src="img/<%=p.getImage()%>" alt="photo">
<div class="des">
    <span ><%=p.getCategory()%></span>
    <h5><%=p.getName()%></h5>
    <div class="star">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
    </div>
    <h4>$ <%=p.getPrice()%> </h4>
    <button class="btn" style=' background-color:#7CA982;border-radius: 10px;color:#fff' onclick="window.location.href='OrderNow?quantity=1&id=<%=p.getId()%>'">Buy now</button>
<!--    <a class="btn" style=' background-color:#7CA982;border-radius: 10px;color:#fff' href="google.com">Buy now</a>-->
</div>
    <a id="ct" href="cart?id=<%=p.getId()%>"><i class="fa-solid fa-cart-shopping"></i></a>
</div>
    <%   }
  }
 %>

</div>
 </section>

 <section id="pagination">
<a href="#">1</a>
<a href="#">2</a>
<a href="#"><i class="fa-solid fa-arrow-right"></i></a>
 </section>




<section id="newsletter" >
    <div class="newstext">
<h4 >Sign Up For Newsletter</h4>
<p>Get e-mail updates about our latest shops and <span>special offers</span></p>

    </div>
    <div class="form">
        <input type="text" placeholder=" Your E-mail address">
        <button type="submit">sign up</button>
    </div>

</section>

<footer class="footer">
    <div class="col">
<img id="lg"src="img/logo.png" alt="">
<h4>Contact</h4>
<p><strong>Address:</strong>Lorem ipsum dolor sit amet.</p>
<p><strong>phone:</strong> +91 293756321</p>
<p><strong>Hours:</strong>10:00-18:00 ,MON-FRI</p>
    

    <div class="follow">
        <h4>Follow us</h4>
        <div  class="icon">
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-twitter"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-pinterest"></i>
            <i class="fa-brands fa-youtube"></i>
        </div>

    </div>
</div>

<div class="col"> 
<h4>About</h4>
<a href="#">About us</a>
<a href="#">Delivery information</a>
<a href="#">Privacy Policy</a>
<a href="#">Terms & conditions</a>
<a href="#">Contact us</a>
</div>

<div class="col"> 
    <h4>My Account</h4>
    <a href="#">Sign In</a>
    <a href="#">View Cart</a>
    <a href="#">My Wishlist</a>
    <a href="#">Track My order</a>
    <a href="#">Help</a>
    </div>
    
<div class="col install">
<h4>Install App</h4>
<p>From App store or Google play</p>
<div class="row">
    <img src="img/app.jpg" alt="">
    <img src="img/play.jpg" alt="">
</div>
<p>Secured Payment Gateways</p>
<img src="img/pay.png" alt="">
</div>

<div class="copyright">
    <p>© Lorem ipsum dolor sit amet consectetur.</p>
</div>

</footer>
    <script src="script.js"></script>
   
</body>
</html>
<%@page import="cn.tech.model.User"%>
<% 
   User auth=(User) request.getSession().getAttribute("auth");
   if(auth!=null)
   {
   request.setAttribute("auth",auth);
}
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
   <li><a  href="orders.jsp">Logout</a></li>
    <li><a  href="logout">Logout</a></li>
  <%}
      else{
  %>
    <li><a  href="login.jsp">Login</a></li>
  <%}
  %>
  <li><a  href="blog.jsp">Blog</a></li>
  <li><a href="shop.jsp">shop</a></li>
  <li><a href="about.jsp">about</a></li>
  <li><a class="active" href="contact.jsp">contact</a></li>
  
 
  
  <li id="lg-cart"><a href="cart.jsp" ><i class="fa-solid fa-cart-shopping"></i></a></li>
  <a href="#" id="close"> <i class="fa-solid fa-xmark"></i></a>
    </ul>
</div>
<div id="mobile">
<i id="bar" class="fas fa-outdent"></i>
<a href="cart.html"><i class="fa-solid fa-cart-shopping"></i></a>
</div>

    </section>

    <section id="page-header" class="about-header">

<h2 style="font-size: 42px;
line-height: 54px;
color:#fff;">#let's_talk</h2> 
<p 
style="font-size: 16px;
color: #fff;
margin: 15px 0 20px 0;">LEAVE A MEESAGE,we love to hear from you</p>
    </section>
  
<section id="contact-details">
<div class="details">
    <span>GET IN TOUCH</span>
    <h2>visit one of our agency locations or contact us today</h2>
    <h3>Head office</h3>
    <div>
        <li>
            <i class="fa-regular fa-map"></i>
<p>Lorem ipsum dolor sit amet consectetur.</p>
        </li>
        <li>
            <i class="fa-regular fa-envelope"></i>
<p>contact@example.com</p>
        </li>
        <li>
            <i class="fa-solid fa-phone"></i>
<p>+91 9876543342</p>
        </li>
        <li>
            <i class="fa-regular fa-clock"></i>
<p>Monday to Saturday : 9.00am to 10.00pm</p>
        </li>
    </div>
</div>
<div class="map">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d79041.58768512552!2d-1.24758785!3d51.7504163!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48713380adc41faf%3A0xc820dba8cb547402!2sOxford%2C%20UK!5e0!3m2!1sen!2sin!4v1711316028685!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>


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
      
        <section id="form-details">
<form action="">
    <span>LEAVE A MESSAGE</span>
    <h2>We love to hear from you</h2>
    <input type="text" placeholder="your Name">
    <input type="text" placeholder="E-mail">
<input type="text" placeholder="subject">
<textarea name="" id="" cols="30" rows="10" placeholder="Your Message"></textarea>
<button class="btn" >Submit</button>
</form>

<div class="people">
    <div>
        <img src="img/1.png" alt="">
        <p><span>John Doe </span>Senior Marketing Manager <br>
        Phone +91 786536788 <br>Email: contact@example.com</p>
    </div>
    <div>
        <img src="img/2.png" alt="">
        <p><span>William smith </span>Senior Marketing Manager <br>
        Phone +91 786536788 <br>Email: contact@example.com</p>
    </div>
    <div>
        <img src="img/3.png" alt="">
        <p><span>Emma stone </span>Senior Marketing Manager <br>
        Phone +91 786536788 <br>Email: contact@example.com</p>
    </div>
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
<%-- 
    Document   : cart.jsp
    Created on : 12 Dec 2024, 10:36:32 pm
    Author     : ayush
--%>

<%@page import="cn.tech.model.Cart"%>
<%@page import="java.util.*"%>
<%@page import="cn.tech.connection.DBCon"%>
<%@page import="cn.tech.model.product"%>
<%@page import="cn.tech.dao.ProductDao"%>
<%@page import="cn.tech.model.User"%>
<% 
   User auth=(User) request.getSession().getAttribute("auth");
   if(auth!=null)
   {
   request.setAttribute("auth",auth);
}
%> 
<%
ArrayList<Cart> cart_List=(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct=null;
if(cart_List!=null)
{
  ProductDao pDao=new ProductDao(DBCon.getConnection());
  cartProduct=pDao.getCartProducts(cart_List);
  request.setAttribute("cart_List",cart_List);
  double total=pDao.getTotalCartPrice(cart_List);
  request.setAttribute("total",total);
}

%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce</title>
    <link rel="stylesheet" href="style.css">
<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>
    <body>
         <section id="header">
<a href="# "class="logo"><img src="img/logo.png" alt="logo" id="logo"></a>
<div>
    <ul id="navbar" >
  <li><a  href="main.jsp">Home</a></li>
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
  <li><a href="shop.jsp">shop</a></li>
  <li><a href="about.jsp">about</a></li>
  <li><a href="contact.jsp">contact</a></li>
  
 
  
  <li id="lg-cart"><a class="active" href="cart.jsp" ><i class="fa-solid fa-cart-shopping"></i></a></li>
  <a href="#" id="close"> <i class="fa-solid fa-xmark"></i></a>
    </ul>
</div>
<div id="mobile">
<i id="bar" class="fas fa-outdent"></i>
<a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
</div>
 
    </section>
  
  <section id="page-header" class="about-header">

<h2 style="font-size: 42px;
line-height: 54px;
color:#fff;">#cart</h2> 
<p 
style="font-size: 16px;
color: #fff;
margin: 15px 0 20px 0;">Add your coupon code & SAVE upto 70%</p>
    </section>
  
    <section id="cart">
        <table width="100%">
<thead>
    <tr>
        <td>Remove</td>
        <td>Image</td>
        <td>Product</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Subtotal</td>
<!--        <td>Buy Now</td>-->
        
        
    
    </tr>
</thead>
<tbody>
    <%
    if(cart_List!=null)
    {
    for(Cart c:cartProduct)
    {
    %>
    <tr>
        <td><a href="Remove?id=<%=c.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
        <td><img src="img/<%=c.getImage()%>" alt=""></td>
        <td><%=c.getName()%></td>
        <td>$<%=c.getPrice()%></td>
        
        
        <td>
<!--            <a href="Quantity?action=${quantity.value}"><input type="number" name="quantity" min="1" value="1"></a>
        -->
  
	<form action= "OrderNow" method="post" class="form-inline" style="display: flex">
	<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
	<div class="form-group d-flex justify-content-between">
            <a class="btn bnt-sm btn-incre"  href="Quantity?action=inc&id=<%=c.getId()%>"><i style="color:white; background-color: black "class="fas fa-plus-square"></i></a> 
	<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
	<a class="btn btn-sm btn-decre" href="Quantity?action=dec&id=<%=c.getId()%>"><i  style="color:white; background-color: black " class="fas fa-minus-square"></i></a>
	</div>
<!--	<button type="submit" class="btn btn-primary btn-sm">Buy</button>-->
<button class="btn" type="submit" style=' background-color:#088178; color:#fff  ;margin-left: 20px'>Buy now</button>
						</form>
        </td>
        
        
        <td>$<%=Math.ceil(c.getPrice()*c.getQuantity())%></td>
        

    </tr>
    
    <%
    }
    }
    
    %>
    

</tbody>

        </table>
    </section>

<section id="cart-add">
<div id="coupon">
    <h3>Apply coupon</h3>
    <div>
        <input type="text" placeholder="Enter coupon code">
        <button class="btn">Apply</button>
    </div>
</div>
<div id="subtotal">
    <h3>Cart Total</h3>
    <table>
        <tr>
            <td>Cart Subtotal</td>
            <td>$ ${(total>0)?Math.ceil( total): 0}</td>
        </tr>
        <tr>
            <td>Shipping</td>
            <td>$ ${(total>0)?50:0}</td>
        </tr>
        <tr>
            <td><strong>Total</strong></td>
            <td><strong>$ ${(total>0)? Math.ceil( total+50): 0}</strong></td>
        </tr>
    </table>
    <button class="btn" onclick="window.location.href='CheckOut'">Proceed to checkout</button>

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

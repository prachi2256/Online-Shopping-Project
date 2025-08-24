<%@page import="java.util.*"%>
<%@page import="cn.tech.dao.*"%>
<%@page import="cn.tech.connection.DBCon"%>
<%@page import="cn.tech.model.*"%>

<%@page import= "cn.tech.model.User"%>
<% 
   User auth=(User) request.getSession().getAttribute("auth");
   List<Order> orders=null;
   
   if(auth!=null)
   {
   request.setAttribute("auth",auth);
     OrderDao orderDao  = new OrderDao(DBCon.getConnection());
	orders = orderDao.userOrders(auth.getId());
}
else
{
response.sendRedirect("login.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}


%> 


<!DOCTYPE html>

<html lang="en" style=" scroll-behavior: smooth;">
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
  <li><a href="main.jsp">Home</a></li>
  <%
      if(auth!=null)
  {%>
   <li><a  class="active" href="orders.jsp">Orders</a></li>
    <li><a  href="logout">Logout</a></li>
  <%}
      else{
  %>
    <li><a  href="login.jsp">Login</a></li>
  <%}
  %>
  <li><a href="blog.jsp">Blog</a></li>
  <li><a href="shop.jsp">shop</a></li>
  <li><a href="about.jsp">about</a></li>
  <li><a href="contact.jsp">contact</a></li>
  
 
  
  <li id="lg-cart"><a href="cart.jsp" ><i class="fa-solid fa-cart-shopping"></i></a></li>
  <a href="#" id="close"> <i class="fa-solid fa-xmark"></i></a>
    </ul>
</div>
<div id="mobile">
<i id="bar" class="fas fa-outdent"></i>
<a href="cart.html"><i class="fa-solid fa-cart-shopping"></i></a>
</div>
 
    </section>
 

			 <section id="cart">
        <table width="100%">
<thead>
    <tr>
        <td >Date</td>
        <td>Name</td>
        <td>Category</td>
        <td>Quantity</td>
        <td>Price</td>
        <td>Cancel</td>

        
    </tr>
</thead>
			<tbody>
                            <%
                            if(orders!=null)
                            {
                            for(Order o:orders)
                            {%>
                            <tr>
                            <td style="margin-right:10px"><%=o.getDate()%></td>
                            <td><%=o.getName()%></td>
                            <td><%=o.getCategory()%></td>
                            <td><%=o.getQuantity()%></td>
                            <td><%=o.getPrice()%></td>
                            
<td>
    
        <form action="cancel-order" method="post">
    <input type="hidden" name="id" value="<%= o.getOrderId() %>">
    <button type="submit">Cancel</button>
</form>

</td>


                            </tr>
                           <% }
                            }
                          %>
                            
			</tbody>
		</table>


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
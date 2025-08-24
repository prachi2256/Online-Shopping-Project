/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.tech.servlet;

import cn.tech.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.util.ArrayList;

/**
 *
 * @author ayush
 */
public class cart extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charSet=UTF-8");
       try(PrintWriter out=response.getWriter())
       {
           ArrayList<Cart> cartList=new ArrayList<>();
           int id=Integer.parseInt(request.getParameter("id"));
           Cart cm=new Cart();
           cm.setId(id);
           cm.setQuantity(1);
           
           HttpSession session =request.getSession();
           
           ArrayList<Cart> cart_list=(ArrayList<Cart> )session.getAttribute("cart-list");
           
           if(cart_list==null)
           {
             cartList.add(cm);
             session.setAttribute("cart-list",cartList);
             response.sendRedirect("cart.jsp");
           }
           else
           {
                cartList=cart_list;
                boolean exist=false;
                for(Cart c:cart_list)
                {
                    if(c.getId()==id)
                    {
                    exist=true;
                    
                    out.println("<h3 style='color:crimson; text-align:center'>Item already exist in cart.<a href='cart.jsp'>Go to Cart Page</a></h3>");
                    
                    }
                    
                }
                if(!exist)
                {
                cartList.add(cm);
                  response.sendRedirect("main.jsp");
                out.println("product added");
                }
           }
           
       }
        
        
    }


   
 

}

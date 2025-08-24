/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.tech.servlet;

import cn.tech.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author ayush
 */
public class Remove extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try(PrintWriter out=response.getWriter())
       {
         int id=Integer.parseInt(request.getParameter("id"));
        if(id!=0)
        {
         ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
         if(cart_list!=null)
         {
             for(Cart c:cart_list)
             {
             if(c.getId()==id)
             {
             cart_list.remove(cart_list.indexOf(c));
             break;
             }
             }
             
             response.sendRedirect("cart.jsp");
         }
         else
         {
         response.sendRedirect("cart.jsp");
         }
            
            
            
        }
       }
       
       catch(Exception e)
       {
       e.printStackTrace();
       }
    }

   
}

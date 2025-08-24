/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.tech.servlet;

import cn.tech.connection.DBCon;
import cn.tech.dao.OrderDao;
import cn.tech.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ayush
 */
public class CheckOut extends HttpServlet {

  
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try(PrintWriter out=response.getWriter())
        {
         
            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
            
           User auth=(User) request.getSession().getAttribute("auth");
           boolean fail=false;
      
      if(cart_list!=null&&auth!=null)
      {
         
          for(Cart c:cart_list)
          {
           Order  order=new Order();
           order.setId(c.getId());
           order.setUid(auth.getId());
           order.setQuantity(c.getQuantity());
           order.setDate(formatter.format(date));
           
           OrderDao OD=new OrderDao(DBCon.getConnection());
          boolean result= OD.insertOrder(order);
          if(!result)
          {
          fail=true;
           break;
          }
          }
          
          if(fail)
                response.sendRedirect("cart.jsp");
          
         cart_list.clear();
          response.sendRedirect("orders.jsp");
      
      }
      
      else
      {
      if(auth==null) response.sendRedirect("login.jsp");
      response.sendRedirect("cart.jsp");
      
      }
   
   
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        doGet(request,response);
        
    }

    
}

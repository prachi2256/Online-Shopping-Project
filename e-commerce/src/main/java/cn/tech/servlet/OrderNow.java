/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package cn.tech.servlet;

import cn.tech.connection.DBCon;
import cn.tech.dao.OrderDao;
import cn.tech.model.*;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 *
 * @author ayush
 */


public class OrderNow extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        try(PrintWriter out=response.getWriter())
        {
            
            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            
      User auth=(User) request.getSession().getAttribute("auth");
      
      if(auth!=null)
      {
      String pid=request.getParameter("id");
      int pQuantity=Integer.parseInt(request.getParameter("quantity"));
            if(pQuantity<=0)
          pQuantity =1;
            Order orderModel=new Order();
            
            orderModel.setId(Integer.parseInt(pid));
            orderModel.setUid(auth.getId());
            orderModel.setQuantity(pQuantity);
            orderModel.setDate(formatter.format(date));
            
            
 OrderDao orderDao=new OrderDao(DBCon.getConnection());
 boolean result=orderDao.insertOrder(orderModel);
 
 
 if(result)
 {
     ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
      if(cart_list!=null)
         {
             for(Cart c:cart_list)
             {
             if(c.getId()==Integer.parseInt(pid))
             {
             cart_list.remove(cart_list.indexOf(c));
           break;
             }
               
             }
           
         }
       response.sendRedirect("orders.jsp"); 
 }
     else
     out.println("order Request failed");
      }
      
      else
      {
      response.sendRedirect("login.jsp");
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

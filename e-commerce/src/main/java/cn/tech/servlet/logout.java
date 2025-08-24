/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.tech.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ayush
 */
public class logout extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out =response.getWriter())
        {
        if(request.getSession().getAttribute("auth")!=null)
        {
          request.getSession().removeAttribute("auth");
          response.sendRedirect("login.jsp");
        }
        else{
        response.sendRedirect("index.html");
        
        }
        
        }
        
     
        
    }

    
    

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package cn.tech.servlet;

import cn.tech.connection.DBCon;
import cn.tech.dao.UserDao;
import cn.tech.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;


@WebServlet(name = "LoginServlet", urlPatterns = {"/user-login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBCon.getConnection();
            UserDao userDao = new UserDao(con);

            User user = userDao.userLogin(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", user);
                response.sendRedirect("shop.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server error. Try again.");
        }
    }
}

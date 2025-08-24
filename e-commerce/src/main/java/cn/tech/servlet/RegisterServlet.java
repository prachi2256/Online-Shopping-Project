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


@WebServlet(name = "RegisterServlet", urlPatterns = {"/user-register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBCon.getConnection();
            UserDao userDao = new UserDao(con);

            User newUser = new User();
            newUser.setName(name);
            newUser.setEmail(email);
            newUser.setPassword(password);

            boolean registered = userDao.registerUser(newUser);

            if (registered) {
                response.sendRedirect("login.jsp?success=Registration successful! Please login.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed. Try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Server error. Try again.");
        }
    }
}

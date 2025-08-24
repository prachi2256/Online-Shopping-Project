/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package cn.tech.servlet;

import java.io.IOException;
import java.sql.SQLException;

import cn.tech.connection.DBCon; // Make sure the name matches your class exactly
import cn.tech.dao.OrderDao;     // Import your DAO
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/cancel-order")

@WebServlet(name = "CancelOrderServlet", urlPatterns = {"/cancel-order"})
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        cancelOrder(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        cancelOrder(request, response);
    }

    private void cancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String id = request.getParameter("id");

        if (id != null && !id.isEmpty()) {
            try {
                OrderDao orderDao = new OrderDao(DBCon.getConnection());
                orderDao.cancelOrder(Integer.parseInt(id));
                response.sendRedirect("orders.jsp?success=Order canceled successfully");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("orders.jsp?error=Could not cancel order");
            }
        } else {
            response.sendRedirect("orders.jsp?error=Invalid order ID");
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ayush
 */

package cn.tech.connection;
import java.sql.*;


public class DBCon {
    private static Connection connection =null;
    
    
    public static Connection getConnection() throws ClassNotFoundException,SQLException{
        
        if(connection==null)
        {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","root");
        System.out.println("connected");
         
        
        }
       return connection; 
    }
    
}
 
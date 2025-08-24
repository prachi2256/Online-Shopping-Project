 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



package cn.tech.dao;

import java.sql.*;
import cn.tech.model.User;

public class UserDao {
     
    private Connection con;
    
    public UserDao(Connection con) {
        this.con = con;
    } 
    
    // LOGIN: Check email + password
   
   
public User userLogin(String email, String password) {
    User user = null;
    try {
        if (this.con == null || this.con.isClosed()) {
            throw new SQLException("Database connection is not available.");
        }

        String query = "SELECT * FROM users WHERE email=? AND password=?";
        PreparedStatement pst = this.con.prepareStatement(query);
        pst.setString(1, email.trim());
        pst.setString(2, password.trim());

        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
        }
    } catch (SQLException e) {
        System.out.println("SQL Error in userLogin: " + e.getMessage());
        e.printStackTrace();
    }
    return user;
}

   
    // GET USER BY EMAIL
    public User getUserByEmail(String email) {
        User user = null;
        String query = "SELECT * FROM users WHERE email=?";
        
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // REGISTER: Insert a new user
    public boolean registerUser(User user) {
        boolean result = false;
        String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            
            int rows = pst.executeUpdate();
            result = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

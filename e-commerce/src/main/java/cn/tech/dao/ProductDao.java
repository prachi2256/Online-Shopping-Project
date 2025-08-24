/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.tech.dao;

import cn.tech.model.Cart;
import cn.tech.model.product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author ayush
 */
public class ProductDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao(Connection con) {
        this.con = con;
    }
              
     public List<product> getAllProducts(){
     
         List<product> products=new ArrayList<>();
          try{
           
              query="select * from products";
              pst=this.con.prepareStatement(query);
              rs=pst.executeQuery();
              while(rs.next())
              {
                product row=new product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                
                products.add(row);
              
              }
          }
             catch(Exception e)
                      {
                        e.printStackTrace();
                      
                      }
          
           return   products;
          }
         
         public List<Cart> getCartProducts(ArrayList<Cart> cartList)
         {
         List <Cart> products=new ArrayList<Cart>();
         try{
         if(cartList.size()>0)
         {
         for(Cart item:cartList)
         {
         query ="select * from products where id=?";
         pst=this.con.prepareStatement(query);
         pst.setInt(1,item.getId());
         rs=pst.executeQuery();
         while(rs.next())
         {
             Cart row=new Cart();
             row.setId(rs.getInt("id"));
             row.setName(rs.getString("name"));
             row.setCategory(rs.getString("category"));
             row.setPrice(rs.getDouble("price"));
             row.setQuantity(item.getQuantity());
             row.setImage(rs.getString("image"));
             products.add(row);
         }
         
         }
         
         
         }
        
         
         }
         
         catch(Exception e)
         {
         e.printStackTrace();
         }
         
         return products;
         }
         
         public product getSingleProduct(int id){
         
             product row=null;
             try{
             query="select * from products where id=?";
             pst=this.con.prepareStatement(query);
             pst.setInt(1, id);
             rs=pst.executeQuery();
             
             while(rs.next())
             {
             row=new product();
             row.setId(rs.getInt("id"));
             row.setName(rs.getString("name"));
             row.setCategory(rs.getString("category"));
             row.setPrice(rs.getDouble("price"));
             row.setImage(rs.getString("image"));
             
             }
             
             }
             catch(Exception e)
             {
             e.printStackTrace();
             
             }
             return row;
         }
         
         public double  getTotalCartPrice(ArrayList<Cart> cartList)
         {
         double sum=0;
         try{
         
             if(cartList.size()>0)
             {
             for(Cart item:cartList)
             {
             
                 query="select price from products where id=?";
                 pst=this.con.prepareStatement(query);
                 pst.setInt(1,item.getId());
                 rs=pst.executeQuery();
                 while(rs.next())
                 {
                   sum+=rs.getDouble("price")*item.getQuantity();
                 }
                 
                 
             }
             
             }
         
         }
         
         catch(Exception e)
         {
         e.printStackTrace();
         }
         
         return sum;        
         }
        
     }
    
 

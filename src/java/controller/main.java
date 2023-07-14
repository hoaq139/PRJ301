/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author tienh
 */
public class main {

    public static void main(String[] args) {
   
       String xServer = "localhost\\SQLEXPRESS";
       String xPort = "1433";
       String xDbName = "TinTuc";
       //String xUrl = "jdbc:sqlserver://localhost:1433;databaseName = studentDB";
      String xUrl = "jdbc:sqlserver://" + xServer + ":" + xPort + ";databaseName = " + xDbName;
    
       String xUser = "sa";
       String xPW = "123";
       Connection con = null; 
       try {
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         con = DriverManager.getConnection(xUrl,xUser,xPW);
         System.out.println("Connection successful." + con);
       }
       catch(Exception e) {
         System.out.println("Connection failed.");
       }
      
    }
 }

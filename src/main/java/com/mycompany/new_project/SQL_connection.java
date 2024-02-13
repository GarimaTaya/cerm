/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.new_project;

/**
 *
 * @author kriti
 */

import java.sql.*;

import java.util.*;

public class SQL_connection {
    public void view() {
        Connection con = null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pst = con.prepareStatement("select * from register_table");
           rs = pst.executeQuery(); 
            while (rs.next()) {
                System.out.println(rs.getString(1) + "\t" + rs.getString(2) + "\t" + rs.getInt(3) + "\t" + rs.getString(4) + "\t" + rs.getString(5));
            }
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    
    public void insert(){
        String name,email,state,password;
        int phone;
        
        Scanner scan = new Scanner(System.in);
        
        System.out.println("Enter Name:");
        name = scan.next();
        
        System.out.println("Enter email:");
        email = scan.next();
        
        System.out.println("Enter Phone no.:");
        phone = scan.nextInt();
        
        System.out.println("Enter State:");
        state = scan.next();
        
        System.out.println("Enter password:");
        password = scan.next();
      
        Connection con = null;
        int status=0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pst = con.prepareStatement("insert into register_table values (?,?,?,?,?);");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setInt(3,phone);
            pst.setString(4,state);
            pst.setString(5,password);
           status = pst.executeUpdate(); 
            if(status!=0)
            {
                System.out.println("Insertion successful!!!");
            }
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

public static void main(String[] args) {
        SQL_connection s = new SQL_connection();
        Scanner scan = new Scanner(System.in);
        int ch;
        while (true) {
            System.out.println("\n---------MENU---------");
            System.out.println("1.View data\n2.Insert data\n3.Exit");
            System.out.println("Enter choice:");
            ch = scan.nextInt();

            switch (ch) {
                case 1: s.view();
                        break;
                        
                case 2: s.insert();
                        break;
                        
                case 3:
                    System.out.println("Thankyou...");
                    return;
                default:
                    System.out.println("Enter valid data");
            }
        }
        }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.devs.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Administrator
 */
public class DbOp
{
Connection con = null;
ResultSet rs = null;

public void dbcon()
{
    try{  
    Class.forName("com.mysql.jdbc.Driver");  
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cermdb","root","1234");
    
 
    }catch(Exception e){ System.out.println(e);} 
}

public Connection getConnection() 
 {
    try
    {
    if (con == null)
    {
        dbcon();
    }
    }catch(Exception e){ System.out.println(e);}
    return con;
}

public ResultSet retrv_rec(String tblnm)
{
try{ 
con = getConnection();
rs=con.createStatement().executeQuery("select * from " + tblnm);
}catch(Exception e){ System.out.println(e);} 
return rs;
}

public String[][] getSelectOptionList(String selectquery, int norow, String idcol, String valcol)
{     
    String[][] strarr = new String[norow][2];
    try {
        con = getConnection();
        rs = con.createStatement().executeQuery(selectquery);
        int i=0;
        while (rs.next())
        { 
            strarr[i][0]= rs.getString(idcol);
            strarr[i][1]= rs.getString(valcol);
            i++;
         } 
        }
    catch(Exception e){ System.out.println(e);}
    return strarr ;
}

public boolean chkfldvalue(String tblnm, String fldnm, String fldvalue)
{
//this function will check whether a data exist or not for the specified field
String sqlstmt;
boolean result=false;
try{ 
con = getConnection();
sqlstmt = "select * from " + tblnm + " where " + fldnm + " = '" + fldvalue + "'";
rs=con.createStatement().executeQuery(sqlstmt);
if (rs.next() == false)
{
    result = false;
}
else
{
    result= true;
}
}catch(Exception e){ System.out.println(e);}
return result;
}
public boolean insertSubQuery(String insertsql)
 {
    Statement stmt = null;
    boolean result = false;
    try {
        con = getConnection();
        stmt = con.createStatement();
        int insert = stmt.executeUpdate(insertsql);
        if (insert == 1)
        {            result = true; 
        } 
        else 
        {            result = false;
        }
    }    catch(Exception e){ System.out.println(e);}
    return result;
    }  
public int insertGetAutoId(String insertsql)
 {
    Statement stmt = null;
    int autoIncKey = -1;
    try {
        con = getConnection();
        stmt = con.createStatement();
        int insert = stmt.executeUpdate(insertsql);
        if (insert == 1)
        {
            rs = stmt.executeQuery("SELECT LAST_INSERT_ID()");
            if (rs.next()) 
            {
                autoIncKey = rs.getInt(1);
            }
            else 
            {
                autoIncKey = -99;
            }       
        } 
        else 
        {
            autoIncKey = -99;
        }
    } 
    catch(Exception e){ System.out.println(e);}
    return autoIncKey;
    }  
public boolean CheckuserExist(String userid)
{
    boolean result=false;
    //this function will check whether user exists or not
    return result;
}

public String getFldValue(String tblnm, String fldnm, String fldvalue, String getfldnm)
{
    String fldval=null;
    String sqlstmt;
    //this function will return the value of the field passed as parameter
    try
    { 
        con = getConnection();
        sqlstmt = "select *  from " + tblnm + " where " + fldnm + " = '" + fldvalue + "'";
        rs=con.createStatement().executeQuery(sqlstmt);
        rs.next();
        fldval =  rs.getString(getfldnm);
    }catch(Exception e){ System.out.println(e);}
    return fldval;
}
public boolean updateActiveStatus(String tablenm)
 {
    boolean flag = false;
    //this function will update the status
    return flag;
    }

}
<%-- 
    Document   : logout
    Created on : Dec 7, 2022, 3:59:57 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>

        <h1><font color="Red">You are Sucessfully logged out...</font></h1>
       <a href="index.html">Go-Back To Home Page</a>    
    </body>
</html>

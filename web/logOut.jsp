<%-- 
    Document   : logOut
    Created on : Aug 5, 2021, 1:09:45 AM
    Author     : PASINDU-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            
        %>
        <script>
            window.alert("You are LogOut...");
            location.href = 'index.jsp';
        </script>
    </body>
</html>

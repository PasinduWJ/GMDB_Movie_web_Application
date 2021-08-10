<%-- 
    Document   : PurchVal
    Created on : Aug 5, 2021, 2:28:14 AM
    Author     : PASINDU-PC
--%>

<%@page import="com.uoc.ead.entity.Purchas"%>
<%@page import="com.uoc.ead.eao.PurchasEaoImpl"%>
<%@page import="com.uoc.ead.eao.PurchasEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String role = request.getParameter("role");
            session.setAttribute("movieId", request.getParameter("movieId"));
            session.setAttribute("avgRate", request.getParameter("avgRate"));
            if (role.equals("purch")) {
                
                boolean ck = false;
                String userName = (String) session.getAttribute("userName");
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                
                PurchasEao purchasEao = new PurchasEaoImpl();
                ck = purchasEao.purch(userName, movieId);
                if (ck) {
        %>
        <script>
            window.alert("You are purchased Successfully...");
            location.href = '../User/User.jsp';
        </script>
        <%        
        } else {
        %>
        <script>
            window.alert("You are purchased Fall..");
            location.href = '../User/User.jsp';
        </script>    
        <%    
                }
            } else if (role.equals("review")) {
                response.sendRedirect("rateUser.jsp");
            }
        %>
    </body>
</html>

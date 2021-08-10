<%-- 
    Document   : saveReview
    Created on : Aug 6, 2021, 9:25:45 PM
    Author     : PASINDU-PC
--%>

<%@page import="com.uoc.ead.eao.UserRateEaoImpl"%>
<%@page import="com.uoc.ead.entity.UserRate"%>
<%@page import="com.uoc.ead.eao.UserRateEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String movieId = movieId = (String) session.getAttribute("movieId");
            String userName = (String) session.getAttribute("userName");
            boolean ck = false;
            try {
                UserRateEao userRateEao = new UserRateEaoImpl();
                UserRate userRate = new UserRate();
                userRate.setRate(Integer.parseInt(request.getParameter("rateVal")));
                userRate.setTitle(request.getParameter("title"));
                userRate.setDiscription(request.getParameter("body"));
                ck = userRateEao.addReview(userRate, Integer.parseInt(movieId), userName);

            } catch (Exception e) {
            }
            if (ck) {

        %>
        <script>
            window.alert("ThankYou...");
            location.href = '../User/User.jsp';
        </script>
        <%    } else {
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = '../User/User.jsp';
        </script>
        <%
            }

        %>
    </body>
</html>

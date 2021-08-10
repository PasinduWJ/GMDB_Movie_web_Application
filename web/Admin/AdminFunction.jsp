<%-- 
    Document   : AdminFunction
    Created on : Aug 6, 2021, 11:18:04 PM
    Author     : PASINDU-PC
--%>

<%@page import="com.uoc.ead.eao.MovieEaoImpl"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String btn = request.getParameter("btn");
            String movieId = request.getParameter("movieId");
            session.setAttribute("movieId", movieId);
            if (btn.equals("delete")) {

                MovieEao movieEao = new MovieEaoImpl();
                if (movieEao.delete(Integer.parseInt(movieId))) {

        %>
        <script>
            window.alert("Delete Succsessful...");
            location.href = 'Admin.jsp';
        </script>
        <%        } else {
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = 'Admin.jsp';
        </script>
        <%
            }
        } else if (btn.equals("review")) {

            session.setAttribute("avgRate", request.getParameter("avgRate"));
            response.sendRedirect("../Purchas/rateAdmin.jsp");

        } else if (btn.equals("purch")) {
            session.setAttribute("movieName", request.getParameter("movieName"));
            System.out.println(request.getParameter("movieName"));
            response.sendRedirect("../Purchas/purchUsers.jsp");

        } else if (btn.equals("allUser")) {
            response.sendRedirect("../Admin/viewAllUser.jsp");
        } else {
        %>
        <script>
//            window.alert("ThankYou...");
            location.href = 'Admin.jsp';
        </script>
        <%
            }

        %>
    </body>
</html>

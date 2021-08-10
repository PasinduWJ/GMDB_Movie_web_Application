<%@page import="com.uoc.ead.eao.AdminEaoImpl"%>
<%@page import="com.uoc.ead.eao.AdminEao"%>
<%@page import="com.uoc.ead.eao.UserEaoImpl"%>
<%@page import="com.uoc.ead.eao.UserEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            boolean ck = false;

            if (userName.equals("Admin")) {

                AdminEao adminEao = new AdminEaoImpl();
                ck = adminEao.logAdmin(userName, password);
                if (ck) {
                    session.setAttribute("userName", userName);
                    session.setAttribute("password", password);
                    response.sendRedirect("../Admin/Admin.jsp");
                } else {
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = '../index.jsp';
        </script>
        <%
            }
        } else {
            UserEao user = new UserEaoImpl();
            ck = user.logIn(userName, password);
            if (ck) {
                session.setAttribute("userName", userName);
                session.setAttribute("password", password);
                response.sendRedirect("User.jsp");
            } else {
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = '../index.jsp';
        </script>
        <%
                }
            }


        %>

    </body>
</html>

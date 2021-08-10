
<%@page import="com.uoc.ead.entity.UserDetails"%>
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
            String email, password, userName;
            int age;

            userName = request.getParameter("userName");
            email = request.getParameter("email");
            password = request.getParameter("password");
            age = Integer.parseInt(request.getParameter("age"));
            if (!userName.equals("Admin")) {
                UserDetails user = new UserDetails(userName, email, age, password);
                UserEao uEao = new UserEaoImpl();
                if (uEao.searchbyName(userName)) {
                    boolean ch = uEao.insertUser(user);
                    System.out.println(ch);
                    if (ch) {

        %>
        <script>
            window.alert("you are Successfully Sign Up...");
            location.href = '../index.jsp';
        </script>
        <%            }
        } else {
        %>
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = '../index.jsp';
        </script>
        <%
            }
        } else {
        %>
        %>
        <script>
            window.alert("You Cant use username As Admin please Try Again...");
            location.href = '../index.jsp';
        </script>
        <%
            }
        %>
    </body>
</html>

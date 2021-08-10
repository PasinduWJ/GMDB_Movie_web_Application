<%-- 
    Document   : viewAllUser
    Created on : Aug 9, 2021, 2:24:05 AM
    Author     : PASINDU-PC
--%>

<%@page import="com.uoc.ead.entity.Purchas"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.entity.UserDetails"%>
<%@page import="com.uoc.ead.eao.UserEaoImpl"%>
<%@page import="com.uoc.ead.eao.UserEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/7eefacbee9.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body style= "background-image: url('../images/mm.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          height: 100%;"> 
        <%
            String btn = request.getParameter("delete");
            try {
                if (btn.equals("delete")) {
                    String userName = request.getParameter("userName");
                    UserEao user = new UserEaoImpl();
                    if (user.delete(userName)) {
        %>
        <script>
            window.alert("User Deteted...");
            location.href = 'viewAllUser.jsp';
        </script>
        <%
        } else {
        %>
        <script>
            window.alert("Somthing Wrong...");
            location.href = 'viewAllUser.jsp';
        </script>
        <%
                    }
                }
            } catch (Exception e) {
            }

        %>


        <div class="container">

            <div style="font-size: 50px; color: blueviolet; margin-left: 50px; margin-top: 50px;margin-bottom: 50px;">
                <a href="Admin.jsp"><i class="fas fa-arrow-left"></i></a>
            </div>

            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th scope="col"><i class="fas fa-users"></i></th>
                        <th scope="col">User Name</th>
                        <th scope="col">User Email</th>
                        <th scope="col">User Age</th>
                        <th scope="col">is Purchased User</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <%                        try {
                            UserEao userEao = new UserEaoImpl();
                            List<UserDetails> users = userEao.getAllUser();

                            for (UserDetails u : users) {
                                String pr = "<i class='fas fa-window-close' style = 'color: red; font-size: 30px'></i>";
                                Collection<Purchas> purch = u.getPurchases();
                            if(!purch.isEmpty())
                                pr ="<i class='fas fa-check-square' style = 'color: green; font-size: 30px'></i>";

                    %>
                    <tr>
                        <th scope="row">1</th>
                        <td><%= u.getUserName()%></td>
                        <td><%= u.getEmail()%></td>
                        <td><%= u.getAge() %></td>
                        <td><%= pr %></td>
                        <td>
                            <form>
                                <input type="hidden" name="userName" value=<%= u.getUserName()%> >
                                <button class="btn btn-outline-danger" type="submit" name="delete" value="delete"> Delete</button>
                            </form>
                        </td>

                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                </tbody>
            </table>

        </div>

    </body>
</html>

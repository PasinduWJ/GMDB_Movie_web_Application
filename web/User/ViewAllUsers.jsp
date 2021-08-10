<%@page import="com.uoc.ead.entity.UserDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.eao.UserEaoImpl"%>
<%@page import="com.uoc.ead.eao.UserEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 900px; margin: auto; margin-top: 100px;">
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">User Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Age</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%
                    UserEao uEao = new UserEaoImpl();
                    List<UserDetails> userList = uEao.getAllUser();
                    int i=1;
                    for (UserDetails us : userList) {
                  %>
                    <tr>
                        <th scope="row"><%= i %></th>
                        <td><%= us.getUserName() %></td>
                        <td><%= us.getEmail() %></td>
                        <td><%= us.getAge() %></td>
                    </tr>
                    <%
                        i++;
                      }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>

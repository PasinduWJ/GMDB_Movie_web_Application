<%-- 
    Document   : purchUsers
    Created on : Aug 9, 2021, 1:29:00 AM
    Author     : PASINDU-PC
--%>

<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.entity.Purchas"%>
<%@page import="com.uoc.ead.entity.Movie"%>
<%@page import="com.uoc.ead.eao.PurchasEaoImpl"%>
<%@page import="com.uoc.ead.eao.PurchasEao"%>
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
<div class="container">

            <div style="font-size: 50px; color: blueviolet; margin-left: 50px; margin-top: 50px;margin-bottom: 50px;">
                <a href="../Admin/Admin.jsp"><i class="fas fa-arrow-left"></i></a>
            </div>
   
      <h3>
          <%= session.getAttribute("movieName") %>
      </h3>
      <table class="table table-dark table-hover">
  <thead>
    <tr>
      <th scope="col"><i class="fas fa-users"></i></th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">User Age</th>
      <th scope="col">Purched Date</th>
    </tr>
  </thead>
  <tbody>
       <%
        String movieId = movieId = (String) session.getAttribute("movieId");
        try {
                                movieId = (String) session.getAttribute("movieId");
                                PurchasEao purchasEao = new PurchasEaoImpl();
                                List<Purchas> purchas = purchasEao.getPurchMovie(Integer.parseInt(movieId));
                                for(Purchas p : purchas){
                                
      %>
    <tr>
      <th scope="row">1</th>
      <td><%= p.getUserDetails().getUserName() %></td>
      <td><%= p.getUserDetails().getEmail() %></td>
      <td><%= p.getUserDetails().getAge() %></td>
      <td><%= p.getPurchDate() %></td>
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

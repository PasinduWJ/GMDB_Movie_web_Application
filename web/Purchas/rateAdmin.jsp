<%-- 
    Document   : rateAdmin
    Created on : Aug 9, 2021, 12:58:18 AM
    Author     : PASINDU-PC
--%>

<%@page import="com.uoc.ead.eao.UserRateEaoImpl"%>
<%@page import="com.uoc.ead.eao.UserRateEao"%>
<%@page import="com.uoc.ead.eao.PurchasEaoImpl"%>
<%@page import="com.uoc.ead.entity.UserDetails"%>
<%@page import="com.uoc.ead.entity.UserRate"%>
<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.entity.Purchas"%>
<%@page import="com.uoc.ead.eao.PurchasEao"%>
<%@page import="com.uoc.ead.entity.Genres"%>
<%@page import="com.uoc.ead.entity.Directors"%>
<%@page import="com.uoc.ead.entity.Actors"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Collection"%>
<%@page import="com.uoc.ead.eao.MovieEaoImpl"%>
<%@page import="com.uoc.ead.entity.Movie"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/7eefacbee9.js" crossorigin="anonymous"></script>
        <link href="../css/rate.css" rel="stylesheet">
        <title>JSP Page</title>

    </head>
    <body style= "background-image: url('../images/index.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          height: 100%;"> 

    <%
        String avgRate = "0";
        String movieId = movieId = (String) session.getAttribute("movieId");
        try {
            avgRate = (String) session.getAttribute("avgRate");
            if (avgRate.isEmpty()) {
                avgRate = "0";
            }
        } catch (Exception e) {
        }

    %>          

    <div class="container">

            <div style="font-size: 50px; color: blueviolet; margin-left: 50px;">
                <a href="../Admin/Admin.jsp"><i class="fas fa-arrow-left"></i></a>
            </div>
            <div class="row" style="display: inline;">
                <div class="row">

                    <div class="col-3 " style="margin-right: 10px;">
                    <div class="rating-block"  style="width: 225px;">
                        <h4>Average user rating</h4>
                        <h2 class="bold padding-bottom-7"><%= avgRate%><small>/ 10</small></h2>
                        <button type="button" id="r1" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        </button>
                        <button type="button" id="r2" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        </button>
                        <button type="button" id="r3" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        </button>
                        <button type="button" id="r4" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        </button>
                        <button type="button" id="r5" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <div class="col-9" >
                    <div class="pull-left" style=" background-color: bisque; width: 800px; padding: 20px; border-radius: 8px;height: 330px;">
                        <%
                            try {
                                movieId = (String) session.getAttribute("movieId");
                                MovieEao uEao = new MovieEaoImpl();
                                Movie movie = uEao.getMovie(Integer.parseInt(movieId));
                                Collection<Directors> directors = movie.getDirector();
                                Collection<Actors> actors = movie.getActor();
                                Collection<Genres> genres = movie.getGenre();

                        %>
                        <div style="margin: 10px; margin-top: -20px;">
                            <div class="card" style="width: 100%; display: inline-flex;">
                                <div style="margin-left: -23px; width: 275px;">
                                    <img class="card-img-top" style="width: 431px;padding: 10px; background-size: cover; border-radius: 8px;" src="../images/iceage.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body" style="width: 230px; margin-left: 170px;">
                                    <div style="display: inline-grid;position: absolute;    margin-left: 290px; margin-top: 24px;">
                                        <span><a href="#facebook"><i class="fab fa-facebook-square"></i></a></span>
                                        <span><a href="#twitter"><i class="fab fa-twitter-square"></i></a></span>
                                        <span><a href="#google-plus"><i class="fab fa-google-plus-square"></i></a></span>
                                    </div>
                                    <h2 class="card-title bold"><%= movie.getMovieName()%></h2>
                                    <h5 class="card-subtitle mb-2 text-muted"><%= movie.getRunTime()%></h5>
                                    <h5 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap">
                                        <%
                                            for (Genres g : genres) {
                                        %>
                                        <%= g.getGenre()%>,  
                                        <% } %>
                                    </h5>
                                    <br>
                                    <h5 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Directors: </samp>
                                        <%
                                            for (Directors d : directors) {
                                        %>
                                        <%=  d.getDirectorName()%>,  
                                        <% } %>
                                    </h5>
                                    <h5 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Actors: </samp> 
                                        <%
                                            for (Actors a : actors) {
                                        %>
                                        <%=  a.getActorName()%>,  
                                        <% }%>
                                    </h5>

                                </div>
                            </div>
                        </div>
                        <%
                            } catch (Exception e) {
                            }
                        %>
                    </div>
                </div>
            </div>			

            <div class="row">
                <div class="col-sm-7">
                    <%
                        try {
                            movieId = (String) session.getAttribute("movieId");
                            PurchasEao purchasEao = new PurchasEaoImpl();

                            List<Purchas> purchList = purchasEao.getPurchMovie(Integer.parseInt(movieId));
                            for (Purchas purchas : purchList) {
UserDetails userDetails = purchas.getUserDetails();
                                UserRateEao rateEao = new UserRateEaoImpl();
                                System.out.println(purchas.getPurId());
                                List<UserRate> uRate = rateEao.getUserRates(purchas.getPurId());
                                System.out.println(uRate);
                                for (UserRate u : uRate) {
                                    int rate = u.getRate();
                                    System.out.println("111111111");
                                    String star1 = "btn-grey";
                                    String star2 = "btn-grey";
                                    String star3 = "btn-grey";
                                    String star4 = "btn-grey";
                                    String star5 = "btn-grey";

                                    System.out.println(u.getRate());

                    %>

                    <hr/>
                    <div class="review-block">
                        <div class="row">
                            <div class="col-sm-3">
                                <img src="../images/tra.jpg" style="width: 180px;padding: 10px; background-size: cover; border-radius: 8px;" class="img-rounded">
                                <div class="review-block-name"><a href="#"><%= userDetails.getUserName()%></a></div>
                                <div class="review-block-date"><%= u.getRateDate()%></div>
                            </div>
                            <div class="col-sm-9">
                                <div class="review-block-rate">
                                    <%
                                        if (rate > 9) {
                                            star1 = "btn-warning";
                                            star2 = "btn-warning";
                                            star3 = "btn-warning";
                                            star4 = "btn-warning";
                                            star5 = "btn-warning";
                                        } else if (rate > 7) {
                                            star1 = "btn-warning";
                                            star2 = "btn-warning";
                                            star3 = "btn-warning";
                                            star4 = "btn-warning";
                                            star5 = "btn-grey";
                                        } else if (rate > 5) {
                                            star1 = "btn-warning";
                                            star2 = "btn-warning";
                                            star3 = "btn-warning";
                                            star4 = "btn-grey";
                                            star5 = "btn-grey";
                                        } else if (rate > 3) {
                                            star1 = "btn-warning";
                                            star2 = "btn-warning";
                                            star3 = "btn-grey";
                                            star4 = "btn-grey";
                                            star5 = "btn-grey";
                                        } else if (rate > 0) {
                                            star1 = "btn-warning";
                                            star2 = "btn-grey";
                                            star3 = "btn-grey";
                                            star4 = "btn-grey";
                                            star5 = "btn-grey";
                                        }

                                    %>
                                    <button type="button" class="btn btn-default <%= star1%> btn-xs" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                    </button>
                                    <button type="button" class="btn btn-default  <%= star2%> btn-xs" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                    </button>
                                    <button type="button" class="btn btn-default  <%= star3%> btn-xs" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                    </button>
                                    <button type="button" class="btn btn-default  <%= star4%> btn-xs" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                    </button>
                                    <button type="button" class="btn btn-default  <%= star5%> btn-xs" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                    </button>
                                </div>
                                <div class="review-block-title"><%= u.getTitle()%></div>
                                <div class="review-block-description"><%= u.getDiscription()%></div>

                            </div>
                        </div>

                    </div>
                    <%

                                }
                            }
                        } catch (Exception e) {
                        }
                    %>
                </div>
            </div>

    </div>
    </body>
    <script>
        var r1 = document.getElementById('r1');
        var r2 = document.getElementById('r2');
        var r3 = document.getElementById('r3');
        var r4 = document.getElementById('r4');
        var r5 = document.getElementById('r5');

        var avgRate = <%= avgRate%>

        if (avgRate > 9) {
            r1.setAttribute("class", "btn btn-warning btn-sm");
            r2.setAttribute("class", "btn btn-warning btn-sm");
            r3.setAttribute("class", "btn btn-warning btn-sm");
            r4.setAttribute("class", "btn btn-warning btn-sm");
            r5.setAttribute("class", "btn btn-warning btn-sm");
        } else if (avgRate > 7) {
            r1.setAttribute("class", "btn btn-warning btn-sm");
            r2.setAttribute("class", "btn btn-warning btn-sm");
            r3.setAttribute("class", "btn btn-warning btn-sm");
            r4.setAttribute("class", "btn btn-warning btn-sm");
        } else if (avgRate > 5) {
            r1.setAttribute("class", "btn btn-warning btn-sm");
            r2.setAttribute("class", "btn btn-warning btn-sm");
            r3.setAttribute("class", "btn btn-warning btn-sm");
        } else if (avgRate > 3) {
            r1.setAttribute("class", "btn btn-warning btn-sm");
            r2.setAttribute("class", "btn btn-warning btn-sm");
        } else if (avgRate > 0) {
            r1.setAttribute("class", "btn btn-warning btn-sm");
        }

    </script>


</html>

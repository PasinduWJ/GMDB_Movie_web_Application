
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.entity.Genres"%>
<%@page import="com.uoc.ead.entity.Directors"%>
<%@page import="java.util.Collection"%>
<%@page import="com.uoc.ead.entity.Actors"%>
<%@page import="com.uoc.ead.entity.Movie"%>
<%@page import="com.uoc.ead.eao.MovieEaoImpl"%>
<%@page import="com.uoc.ead.eao.MovieEaoImpl"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page import="com.uoc.ead.eao.MovieEao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7eefacbee9.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>

    </head>
    
    
    <body style= "background-image: url('../images/mm.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          height: 100%;"> 
       <%@include file="../header.jsp" %> 
       
       
        <%
            String search = request.getParameter("searchName");
            System.out.println(search);
            try{
            MovieEao uEao = new MovieEaoImpl();
                List<Movie> movieList = uEao.getSearchMovie(search);
            
                if(movieList != null){
            %>
        <div style="width: 100%; justify-content: center; display: flex; flex-wrap: wrap; background-color: rgba(0,0,0,0.4); ">
            <%

                
                int i = 1;
                for (Movie movie : movieList) {
                    Collection<Directors> directors = movie.getDirector();
                    Collection<Actors> actors = movie.getActor();
                    Collection<Genres> genres = movie.getGenre();
                    String rate = "";
                    try{
                        rate = String.format("%.1f", movie.getRate().getRate());
                    }catch(Exception e){}

            %>
            <div style="margin: 10px;">
                <form action="../Purchas/PurchVal.jsp" method="post">
                    <div class="card" style="width: 25rem;">
                        <img class="card-img-top" style="width: 100%; height: 250px; background-size: cover" src="../images/tra.jpg" alt="Card image cap">
                        <div class="card-body">
                            <div style="display: inline-grid;position: absolute;margin-left: 353px;">
                                <span><a href="#facebook"><i class="fab fa-facebook-square"></i></a></span>
                                <span><a href="#twitter"><i class="fab fa-twitter-square"></i></a></span>
                                <span><a href="#google-plus"><i class="fab fa-google-plus-square"></i></a></span>
                            </div>
                            <h4 class="card-title"><%= movie.getMovieName()%></h4>
                            <h6 class="card-subtitle mb-2 text-muted"><%= movie.getRunTime()%></h6>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap">
                                <%
                                    for (Genres g : genres) {
                                %>
                                <%=g.getGenre()%>,  
                                <% } %>
                            </h6>
                            <br>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Directors: </samp>
                                <%
                                    for (Directors d : directors) {
                                %>
                                <%=  d.getDirectorName()%>,  
                                <% } %>
                            </h6>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Actors: </samp> 
                                <%
                                    for (Actors a : actors) {
                                %>
                                <%=  a.getActorName()%>,  
                                <% }%>
                            </h6>
                            <div style="width: 100%; display: flex;">
                                <button type="submit" name="role" value="review" class="btn btn-outline-danger" style="width: 150px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-star-half-alt"></i></span><%= rate %></button>
                                <button type="submit" name="role" value="purch" class="btn btn-outline-success" style="width: 150px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-money-check-alt"></i></span>$<%= String.format("%.2f",movie.getPrice()) %></button>
                            </div>
                        </div>
                    </div>
                    <input name="movieId" type="hidden" value=<%= movie.getMovieId()%>>
                    <input name="avgRate" type="hidden" value=<%= rate %>>
                </form>
            </div>
                
                
                
            <%
                }
            %>
        </div>
        <%     
        }else{
                   %>
        <script>
            window.alert("Not Match Search Movie Name...");
        </script>
        <%
}
}catch(Exception e){}

    %>

        <div style="width: 100%; justify-content: center; display: flex; flex-wrap: wrap;">
            <%

                MovieEao uEao = new MovieEaoImpl();
                List<Movie> movieList = uEao.getAllMovie();
                int i = 1;
                for (Movie movie : movieList) {
                    Collection<Directors> directors = movie.getDirector();
                    Collection<Actors> actors = movie.getActor();
                    Collection<Genres> genres = movie.getGenre();
                    String rate = "";
                    try{
                        rate = String.format("%.1f", movie.getRate().getRate());
                    }catch(Exception e){}

            %>
            <div style="margin: 10px;">
                <form action="../Purchas/PurchVal.jsp" method="post">
                    <div class="card" style="width: 25rem;">
                        <img class="card-img-top" style="width: 100%; height: 250px; background-size: inherit" src="../images/iceage.jpg" alt="Card image cap">
                        <div class="card-body">
                            <div style="display: inline-grid;position: absolute;margin-left: 353px;">
                                <span><a href="#facebook"><i class="fab fa-facebook-square"></i></a></span>
                                <span><a href="#twitter"><i class="fab fa-twitter-square"></i></a></span>
                                <span><a href="#google-plus"><i class="fab fa-google-plus-square"></i></a></span>
                            </div>
                            <h4 class="card-title"><%= movie.getMovieName()%></h4>
                            <h6 class="card-subtitle mb-2 text-muted"><%= movie.getRunTime()%></h6>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap">
                                <%
                                    for (Genres g : genres) {
                                %>
                                <%=g.getGenre()%>,  
                                <% } %>
                            </h6>
                            <br>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Directors: </samp>
                                <%
                                    for (Directors d : directors) {
                                %>
                                <%=  d.getDirectorName()%>,  
                                <% } %>
                            </h6>
                            <h6 class="card-subtitle mb-2 text-muted" style="overflow: hidden; white-space: nowrap"><samp>Actors: </samp> 
                                <%
                                    for (Actors a : actors) {
                                %>
                                <%=  a.getActorName()%>,  
                                <% }%>
                            </h6>
                            <div style="width: 100%; display: flex;">
                                <button type="submit" name="role" value="review" class="btn btn-outline-danger" style="width: 150px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-star-half-alt"></i></span><%= rate %></button>
                                <button type="submit" name="role" value="purch" class="btn btn-outline-success" style="width: 150px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-money-check-alt"></i></span>$<%= String.format("%.2f",movie.getPrice()) %></button>
                            </div>
                        </div>
                    </div>
                    <input name="movieId" type="hidden" value=<%= movie.getMovieId()%>>
                    <input name="avgRate" type="hidden" value=<%= rate %>>
                </form>
            </div>
                
                
                
            <%
                }
            %>
        </div>

    </body>

</html>

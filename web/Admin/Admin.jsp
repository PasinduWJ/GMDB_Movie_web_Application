
<%@page import="com.uoc.ead.entity.Genres"%>
<%@page import="com.uoc.ead.entity.Actors"%>
<%@page import="java.util.Collection"%>
<%@page import="com.uoc.ead.entity.Directors"%>
<%@page import="java.util.List"%>
<%@page import="com.uoc.ead.entity.Movie"%>
<%@page import="com.uoc.ead.eao.MovieEaoImpl"%>
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
    </head>
    <body style= "background-image: url('../images/avt.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          height: 100%;"> 
       <%@include file="../header.jsp" %> 
       
       <div style=" width: 100%; margin: auto; margin-top: 50px;justify-content: center; display: flex;">
           <button type="button" style="width: 200px;" onclick="addNewMovie()" class="btn btn-danger "><i class="fas fa-film"></i> Add Movie</button>
           <form action="../Admin/AdminFunction.jsp" method="post">
               <button type="submit" style="width: 200px; margin-left: 10px;" name="btn" value="allUser" class="btn btn-success "><i class="fas fa-users"></i> View All User</button>
           </form>
       </div>
        <br><br>
        <div style="justify-content: center;  margin: auto;margin-bottom: 30px; color: white; display: none;" class="visible-add-section" id="addSection">
            <div style="border: 2px solid; border-radius: 10px; padding: 60px 40px; background-color: rgba(0,0,0,0.4);">
            <form action="AddMovie.jsp" method="post">
                <div class="form-group">
                    <input type="text" required name="mName" class="form-control" placeholder="Enter Film Name">
                </div>
                <div class="form-group">
                    <input type="text" required name="mTime" class="form-control" placeholder="Enter Film Run Time (45 min.)">
                </div>
                <div class="form-group">
                    <input type="number" required name="mPrice" min="0" class="form-control" placeholder="Enter Film Purchase Price in US Dollars">
                </div>
                <div>
                    <button type="button" class="btn btn-warning btn-sm" onclick ="addDirector()" >Add Director</button>
                    <div class="form-group" id="directorButton">
                        <input type="text" required name="dName0" class="form-control" placeholder="Enter Film Direcor Name">
                    </div>
                </div>
                <div>
                    <button type="button" class="btn btn-warning btn-sm" onclick ="addActor()" >Add Actor</button>
                    <div class="form-group" id="actorButton">
                        <input type="text" required name="aName0" class="form-control" placeholder="Enter Film Actor Name">
                    </div>
                </div>

                <div style="display: flex;justify-content: space-evenly;">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="1">
                        <label class="form-check-label" for="defaultCheck1">Action  </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"  name="2">
                        <label class="form-check-label" for="defaultCheck1">Animation  </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="3">
                        <label class="form-check-label" for="defaultCheck1">Comedy</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="4">
                        <label class="form-check-label" for="defaultCheck1">Crime</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="5">
                        <label class="form-check-label" for="defaultCheck1">Drama</label>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="6">
                        <label class="form-check-label" for="exampleCheck1">Horror</label>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="7" >
                        <label class="form-check-label" for="exampleCheck1">Other</label>
                    </div>
                </div>
                <button type="submit" name="addNew" value="addNew" class="btn btn-primary">Submit</button>
                <button type="button" class="btn btn-danger" onclick="closeAddMovie()">Cancel</button>
            </form>
            </div>
        </div>
        
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
                <form action="../Admin/AdminFunction.jsp" method="post">
                    <div class="card" style="width: 25rem;">
                        <img class="card-img-top" style="width: 100%; height: 250px; background-size: cover" src="../images/tra.jpg" alt="Card image cap">
                        <div class="card-body">
                            <div style="display: inline-grid;position: absolute;margin-left: 353px;">
                                <span><a href="#facebook"><i class="fab fa-facebook-square"></i></a></span>
                                <span><a href="#twitter"><i class="fab fa-twitter-square"></i></a></span>
                                <span><a href="#google-plus"><i class="fab fa-google-plus-square"></i></a></span>
                            </div>
                            <h4 class="card-title"><%= movie.getMovieName() %></h4>
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
                                <button type="submit" name="btn" value="review" class="btn btn-outline-danger" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-star-half-alt"></i></span><%= rate %></button>
                                <button type="submit" name="btn" value="purch" class="btn btn-outline-success" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-money-check-alt"></i></span>$<%= movie.getPrice() + " "%></button>
                                <button type="submit" name="btn" value="delete" class="btn btn-outline-danger" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-trash-alt"></i></span></button>
                            </div>
                        </div>
                    </div>
                    <input name="movieId" type="hidden" value=<%= movie.getMovieId()%>>
                    <input name="avgRate" type="hidden" value=<%= rate %>>
                    <input name="movieName" type="hidden" value=<%= movie.getMovieName() %>>
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
                <form action="AdminFunction.jsp" method="post">
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
                                <button type="submit" name="btn" value="review" class="btn btn-outline-danger" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-star-half-alt"></i></span><%= rate %></button>
                                <button type="submit" name="btn" value="purch" class="btn btn-outline-success" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-money-check-alt"></i></span>$<%= movie.getPrice() + " "%></button>
                                <button type="submit" name="btn" value="delete" class="btn btn-outline-danger" style="width: 100px; margin: auto;"><span style="margin: 8px;"><i class="fas fa-trash-alt"></i></span></button>
                            </div>
                        </div>
                    </div>
                    <input name="movieId" type="hidden" value=<%= movie.getMovieId()%>>
                    <input name="avgRate" type="hidden" value=<%= rate %>>
                    <input name="movieName" type="hidden" value=<%= movie.getMovieName() %>>
                </form>
            </div>
            <%
                }

            %>
        </div>
       

</body>
<script>

    function addNewMovie() {
        var visible = document.getElementById('addSection');
        document.querySelector('.visible-add-section').style.display = 'flex';
    }
    function closeAddMovie() {
        var visible = document.getElementById('addSection');
        document.querySelector('.visible-add-section').style.display = 'none';
    }

    var d = 1;
    function addDirector()
    {
        var dir = document.getElementById('directorButton');

        var newInput = document.createElement("input");
        newInput.setAttribute("type", "text");
        newInput.setAttribute("name", "dName" + d);
        newInput.setAttribute("class", "form-control");
        newInput.setAttribute("placeholder", "Enter Film Direcor Name");

        dir.appendChild(newInput.cloneNode(true));
        d++;
    }
    var a = 1;
    function addActor()
    {
        var dir = document.getElementById('actorButton');

        var newInput = document.createElement("input");
        newInput.setAttribute("type", "text");
        newInput.setAttribute("name", "aName" + a);
        newInput.setAttribute("class", "form-control");
        newInput.setAttribute("placeholder", "Enter Film Actor Name");

        dir.appendChild(newInput.cloneNode(true));
        a++;
    }
</script>


</html>

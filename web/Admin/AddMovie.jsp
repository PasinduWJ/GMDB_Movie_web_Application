
<%@page import="com.uoc.ead.entity.Genres"%>
<%@page import="com.uoc.ead.entity.Actors"%>
<%@page import="com.uoc.ead.entity.Movie"%>
<%@page import="com.uoc.ead.entity.Directors"%>
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
            MovieEao movieEao = new MovieEaoImpl();
            int d = 0;
            int a = 0;
            
            Movie movie = new Movie();
            movie.setMovieName(request.getParameter("mName"));
            movie.setRunTime(request.getParameter("mTime"));
            movie.setPrice(Double.parseDouble(request.getParameter("mPrice")));

            while (true) {
                String mDirector = request.getParameter("dName" + d);
                if (mDirector == null) {break;}
                Directors directors = new Directors();
                directors.setDirectorName(mDirector);
                directors.setMovie(movie);
                movie.getDirector().add(directors);
                d++;
            }
            while (true) {
                String mActor = request.getParameter("aName" + a);
                if (mActor == null) {break;}
                Actors actors = new Actors();
                actors.setActorName(mActor);
                actors.setMovie(movie);
                movie.getActor().add(actors);
                a++;
            }
            for(int k=1; k<8;k++){
                if(request.getParameter(""+k) != null){
                    System.out.println(request.getParameter(""+k));
                    Genres genre = new Genres();
                    genre.setGenId(k);
                    movie.getGenre().add(genre);
                }
            }
            
            movieEao.create(movie);
            
            response.sendRedirect("Admin.jsp");

        %>
    </body>
</html>

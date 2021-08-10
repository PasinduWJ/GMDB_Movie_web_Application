
package com.uoc.ead.eao;

import com.uoc.ead.entity.Movie;
import java.util.List;

public interface MovieEao {
    
    void create(Movie movie);
    void saveOrUpdate(Movie movie);
    boolean delete(int movieId);
    List<Movie> getAllMovie();
    List<Movie> getSearchMovie(String movieName);
    Movie getMovie(int movieId);
}

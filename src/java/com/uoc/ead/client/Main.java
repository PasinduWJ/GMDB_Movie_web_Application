package com.uoc.ead.client;

import com.uoc.ead.eao.AdminEao;
import com.uoc.ead.eao.AdminEaoImpl;
import com.uoc.ead.eao.MovieEao;
import com.uoc.ead.eao.MovieEaoImpl;
import com.uoc.ead.eao.RateEao;
import com.uoc.ead.eao.RateEaoImpl;
import com.uoc.ead.eao.UserEao;
import com.uoc.ead.eao.UserEaoImpl;
import com.uoc.ead.eao.UserRateEao;
import com.uoc.ead.eao.UserRateEaoImpl;
import com.uoc.ead.entity.Actors;
import com.uoc.ead.entity.Admin;
import com.uoc.ead.entity.Directors;
import com.uoc.ead.entity.Genres;
import com.uoc.ead.entity.Movie;
import com.uoc.ead.entity.Purchas;
import com.uoc.ead.entity.Rate;
import com.uoc.ead.entity.UserDetails;
import com.uoc.ead.entity.UserRate;
import com.uoc.ead.util.HibernateUtil;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

public class Main {

    public static void main(String[] args) {

//        AdminEao adminEao = (AdminEao) new AdminEaoImpl();
//
//        Admin admin = new Admin("Admin", "00");
//        adminEao.create(admin);
//        GenresEao genre = new GenresEaoImpl();
//
//        Genres genre = new Genres("Action");
//        adminEao.create(genre);
//        UserRateEao userRateEao = new UserRateEaoImpl();
//        
//        UserRate userRate = new UserRate();
//        
//        userRate.setRate(4);
//        userRate.setTitle("First");
//        userRate.setDiscription("firsst disk");
//        
//        System.out.println("111111111111111111111111");
//        
//        userRateEao.addReview(userRate,1,"pasindu");
//        Movie movie = new Movie();
//        movie.setMovieId(2);
//
//        RateEao rateEao = new RateEaoImpl();
//        
//        rateEao.update(movie, 8);
//        SessionFactory sessionFactory;
//        sessionFactory = HibernateUtil.getSessionFactory();
//         
//        Session session = sessionFactory.openSession();
String userName = "pasindu";
        UserEao user = new UserEaoImpl();
        user.delete(userName);
//        session.beginTransaction();
        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
       
//        Movie movie = (Movie) session.get(Movie.class, 13);
//        Collection<Purchas>  purchas = movie.getPruchas();
//        for(Purchas p : purchas){
//            System.out.println(p);
//           Collection<UserRate> userRates = p.getUserRate();
//           for(UserRate u : userRates){
//               System.out.println(u.getTitle());
//           }
//        }
//        MovieEao uEao = new MovieEaoImpl();
//                List<Movie> movieList = uEao.getSearchMovie("Love");
//        
//session.getTransaction().commit();
//        session.close();
        System.out.println("hellooooooooo");
    }
}

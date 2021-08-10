package com.uoc.ead.eao;

import com.uoc.ead.entity.Movie;
import com.uoc.ead.entity.Purchas;
import com.uoc.ead.entity.Rate;
import com.uoc.ead.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author PASINDU-PC
 */
public class RateEaoImpl implements RateEao {

    SessionFactory sessionFactory;

    public RateEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public void update(Movie movie, int newRate) {
        Session session = sessionFactory.openSession();
        double sumRate;
        try {
            
            session.beginTransaction();
 
            Rate rate = new Rate();
            rate = (Rate) session.get(Rate.class, movie.getMovieId());
 
            if(rate == null){
                sumRate = newRate;
                Rate rate1 = new Rate();
                rate1.setMovie(movie);
                rate1.setRate(sumRate);
                rate1.setUserCount(1);
                session.saveOrUpdate(rate1);
                    System.out.println(":::::::::::::::::::::::::::::::");
            }else{
               sumRate = ((rate.getRate()*rate.getUserCount()) + newRate)/(rate.getUserCount()+1);
               rate.setMovie(movie);
               rate.setRate(sumRate);
               rate.setUserCount(rate.getUserCount()+1);
               session.saveOrUpdate(rate);
               System.out.println(":::^^^^^^/////////////////^^^^^^^^^^^^^^::::");
            }
            System.out.println(":::^^^^^^^^^^^^^^^^^^^^::::");
//            if(!rate.equals(null)){
//                oldRate = newRate; 
//            }else{
//                oldRate = rate.getRate();
//                
//            }

            session.getTransaction().commit();
            

        } catch (Exception e) {
        }
        session.close();
    }

}

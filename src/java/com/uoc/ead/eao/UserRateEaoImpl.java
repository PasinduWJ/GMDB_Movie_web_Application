package com.uoc.ead.eao;

import com.uoc.ead.entity.Movie;
import com.uoc.ead.entity.Purchas;
import com.uoc.ead.entity.UserDetails;
import com.uoc.ead.entity.UserRate;
import com.uoc.ead.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author PASINDU-PC
 */
public class UserRateEaoImpl implements UserRateEao {

    SessionFactory sessionFactory;

    public UserRateEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public boolean addReview(UserRate userRate, int movieId, String userName) {
        Session session = sessionFactory.openSession();
        boolean ck = false;
        try {
            
            session.beginTransaction();
            userRate.setRateDate(new Date());
            String hql = "FROM Purchas p WHERE p.movie.movieId = :movie_id AND p.userDetails.userName = :user_name";
            Query query = session.createQuery(hql);

            query.setParameter("movie_id", movieId);
            query.setParameter("user_name", userName);
            List<Purchas> pur = query.list();

            if (!pur.isEmpty()) {
                Purchas purch = new Purchas();
                for (Purchas p : pur) {
                    purch.setPurId(p.getPurId());
                }
                userRate.setPurchas(purch);
                session.saveOrUpdate(userRate);
                session.getTransaction().commit();

                Movie movie = new Movie();
                movie.setMovieId(movieId);
                RateEao rateEao = new RateEaoImpl();
                rateEao.update(movie, userRate.getRate());
                ck = true;
            }
        } catch (Exception e) {
        }
        session.close();
        return ck;
    }

    @Override
    public boolean isPurchUser(int movieId, String userName) {
        Session session = sessionFactory.openSession();
        boolean ck = false;
        try {
            
            session.beginTransaction();
            Purchas purch = new Purchas();
            String hql = "FROM Purchas p WHERE p.movie.movieId = :movie_id AND p.userDetails.userName = :user_name";
            Query query = session.createQuery(hql);
            query.setParameter("movie_id", movieId);
            query.setParameter("user_name", userName);
            List<Purchas> pur = query.list();
            if(!pur.isEmpty()){
                ck = true;
            }
            
        }catch (Exception e) {}
        session.close();
        return ck;
    }

    @Override
    public List<UserRate> getUserRates(int purId) {
         List<UserRate> rateList = null;
        Session session = sessionFactory.openSession();
        try {
            String hql = "FROM UserRate u WHERE u.purchas.purId = :purId";
            
            Query query = session.createQuery(hql);
            query.setParameter("purId", purId);
            rateList = query.list();
        } catch (Exception e) {
        }
session.close();
        return rateList;
    }

}

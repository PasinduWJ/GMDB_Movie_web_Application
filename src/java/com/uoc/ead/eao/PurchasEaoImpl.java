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
public class PurchasEaoImpl implements PurchasEao {

    SessionFactory sessionFactory;

    public PurchasEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public boolean purch(String username, int movieId) {
        boolean ck = false;
        Session session = sessionFactory.openSession();
            session.beginTransaction();
        try {

            Purchas purch = new Purchas();
            System.out.println("fffffffffffffffffff");

            Movie movie = new Movie();
            movie.setMovieId(movieId);
            purch.setMovie(movie);

            System.out.println(".........................................");
            UserDetails user = new UserDetails();
            user.setUserName(username);
            purch.setUserDetails(user);

            purch.setPurchDate(new Date());

            session.persist(purch);
            session.getTransaction().commit();
            ck = true;
        } catch (Exception e) {
        }
        session.close();
        return ck;
    }

    @Override
    public List<Purchas> getPurchMovie(int movieId) {
        Session session = sessionFactory.openSession();
        List<Purchas> purchList = null;
        try {

            String hql = "FROM Purchas p WHERE p.movie.movieId = :movie_id";
            
            Query query = session.createQuery(hql);
            query.setParameter("movie_id", movieId);
            purchList = (List<Purchas>) query.list();

        } catch (Exception e) {
        }
        session.close();
        return purchList;
    }

    @Override
    public List<Purchas> getPurchUser(String userName) {
        List<Purchas> purchList = null;
        Session session = sessionFactory.openSession();
        try {

            String hql = "FROM Purchas p WHERE p.userDetails.userName = :user_name";
            
            Query query = session.createQuery(hql);
            query.setParameter("user_name", userName);
            purchList = query.list();
            

        } catch (Exception e) {
        }
session.close();
        return purchList;
    }

    @Override
    public List<Purchas> getUserInMovie(String movieId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deletePurchByUserName(String userName) {
        Session session = sessionFactory.openSession();
            session.beginTransaction();
        try {
            

            String hql = "FROM Purchas p WHERE p.userDetails.userName = :userName";
            Query query = session.createQuery(hql);
            query.setParameter("userName", userName);
            List<Purchas> purchList = query.list();
            for (Purchas p : purchList) {
                session.delete(p);
            }
            session.getTransaction().commit();
           
        } catch (Exception e) {
        }
         session.close();
    }

}

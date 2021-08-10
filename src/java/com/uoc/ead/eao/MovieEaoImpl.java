package com.uoc.ead.eao;

import com.uoc.ead.entity.Directors;
import com.uoc.ead.entity.Movie;
import com.uoc.ead.entity.Purchas;
import com.uoc.ead.util.HibernateUtil;
import java.util.Collection;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class MovieEaoImpl implements MovieEao {

    SessionFactory sessionFactory;

    public MovieEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Movie movie) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.persist(movie);

        session.getTransaction().commit();
        session.close();

    }

    @Override
    public void saveOrUpdate(Movie movie) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.saveOrUpdate(movie);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Movie> getAllMovie() {
        List<Movie> movieList = null;
        Session session = sessionFactory.openSession();
        try {

            String hql = "FROM Movie m";

            session.beginTransaction();
            movieList = session.createQuery(hql).list();

            return movieList;
        } catch (Exception e) {
        }
        session.close();
        return movieList;
    }

    @Override
    public Movie getMovie(int movieId) {
        Session session = sessionFactory.openSession();
        Movie movie = null;
        try {

            movie = (Movie) session.get(Movie.class, movieId);

        } catch (Exception e) {
        }
        session.close();
        return movie;
    }

    @Override
    public boolean delete(int movieId) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            Movie movie = (Movie) session.get(Movie.class, movieId);
            session.delete(movie);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
        }
        session.close();
        return false;
    }

    @Override
    public List<Movie> getSearchMovie(String movieName) {
        List<Movie> movieList = null;
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            System.out.println("*************************************");
            String hql = "FROM Movie m WHERE m.movieName = :movie_name";
            Query query = session.createQuery(hql);
            query.setParameter("movie_name", movieName);
            movieList = query.list();
            session.close();
            System.out.println("*************************************");
            return movieList;
        } catch (Exception e) {
        }
        session.close();
        return movieList;
    }

}

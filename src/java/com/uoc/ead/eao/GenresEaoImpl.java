
package com.uoc.ead.eao;

import com.uoc.ead.entity.Genres;
import com.uoc.ead.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class GenresEaoImpl implements GenresEao{

    SessionFactory sessionFactory; 

    public GenresEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory(); 
    }
    @Override
    public void create(Genres genres) {
        Session session = sessionFactory.openSession(); 
        session.beginTransaction(); 
        session.persist(genres); 
        session.getTransaction().commit(); 
        session.close();
    }
    
}

package com.uoc.ead.eao;

import com.uoc.ead.entity.Purchas;
import com.uoc.ead.entity.UserDetails;
import com.uoc.ead.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Iterator;

import java.util.List;
import java.util.ListIterator;
import javax.xml.registry.infomodel.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserEaoImpl implements UserEao {

    SessionFactory sessionFactory;

    public UserEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public boolean insertUser(UserDetails user) {
        Session session = sessionFactory.openSession();
        boolean c = false;
        try {

            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            session.close();
            c = true;
        } catch (Exception e) {
        }
        return c;
    }

    @Override
    public int upDate(long id, UserDetails user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String userName) {
        Session session = sessionFactory.openSession();
        boolean c = false;
        try {
            PurchasEao purchasEao = new PurchasEaoImpl();
            purchasEao.deletePurchByUserName(userName);

            session.beginTransaction();
            UserDetails user = new UserDetails();
            user.setUserName(userName);
            session.delete(user);
            session.getTransaction().commit();
            session.close();
            c = true;
        } catch (Exception e) {
        }
        session.close();
        return c;
    }

    @Override
    public UserDetails selectUser(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UserDetails> getAllUser() {
        String hql = "FROM UserDetails u";
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<UserDetails> userList = session.createQuery(hql).list();
        session.close();
        return userList;
    }

    @Override
    public boolean logIn(String userName, String password) {
        Session session = sessionFactory.openSession();
        boolean ck = false;
        UserDetails user = null;
        try {

            user = (UserDetails) session.get(UserDetails.class, userName);
            if (user != null && user.getPassword().equals(password)) {
                ck = true;
                session.close();
                return ck;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return ck;
    }

    @Override
    public boolean searchbyName(String userName) {
        Session session = sessionFactory.openSession();
        boolean ck = false;
        UserDetails user = null;
        try {
            user = (UserDetails) session.get(UserDetails.class, userName);
            if (user == null) {
                ck = true;
                session.close();
                System.out.println(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
                return ck;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return ck;
    }

}

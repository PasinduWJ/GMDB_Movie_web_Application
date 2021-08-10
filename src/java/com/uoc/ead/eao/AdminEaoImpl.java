/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uoc.ead.eao;

import com.uoc.ead.entity.Admin;
import com.uoc.ead.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class AdminEaoImpl implements AdminEao{

    SessionFactory sessionFactory; 

    public AdminEaoImpl() {
        sessionFactory = HibernateUtil.getSessionFactory(); 
    }
    
    @Override
    public void create(Admin admin) {
        Session session = sessionFactory.openSession(); 
        try{

            session.beginTransaction(); 
            session.persist(admin); 
            session.getTransaction().commit(); 
            session.close(); 
        }catch(Exception e){}
        session.close(); 
    }


    @Override
    public boolean logAdmin(String userName, String password) {
        Session session = sessionFactory.openSession(); 
        boolean ck = false; 
        Admin admin = null;
        try{
            
            admin = (Admin) session.get(Admin.class, userName);
            if(admin != null && admin.getPassword().equals(password)){
                ck = true;
                return ck;
            }
        }catch(Exception e){}
        session.close();
        return ck;
    }
    
}

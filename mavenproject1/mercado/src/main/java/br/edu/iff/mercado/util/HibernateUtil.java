/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.util;


import br.edu.iff.mercado.entidades.Admin;
import br.edu.iff.mercado.entidades.Cliente;
import br.edu.iff.mercado.entidades.Produto;
import br.edu.iff.mercado.entidades.Sessao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

//    private static final SessionFactory sessionFactory;
//    static {
//        try {
//            sessionFactory = new AnnotationConfiguration()
//                    .configure().buildSessionFactory();
//        } catch (Throwable ex) {
//            // Log exception!
//            throw new ExceptionInInitializerError(ex);
//        }
//    }
//
//    public static Session getSession()
//            throws HibernateException {
//        return sessionFactory.openSession();
//    }
    
    private static SessionFactory factory;

    static {
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        cfg.configure();
        cfg.addAnnotatedClass(Cliente.class);
        cfg.addAnnotatedClass(Admin.class);
        cfg.addAnnotatedClass(Produto.class);
        cfg.addAnnotatedClass(Sessao.class);
        cfg.addAnnotatedClass(Produto.class);

        factory = cfg.buildSessionFactory();
    }

    public static Session getSession() {
        return factory.openSession();
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.controles;

import br.edu.iff.mercado.entidades.Admin;
import br.edu.iff.mercado.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aluno
 */
public class ControleAdmin {
    
    //Função de salvar/atualizar um usuario
    public static boolean salvar(Admin admin){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(admin);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza um usuario pelo id
    public static Admin buscar(Integer id)
    {
        String idAdmin = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Admin u where u.idAdmin='"+idAdmin+"'";
        Admin usuario = (Admin)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return usuario;
    }
    
    //Retorna todos os usuario do sistema
    public static List<Admin> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Admin u";
        List<Admin> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Admin admin){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(admin);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}


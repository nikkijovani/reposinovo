package br.edu.iff.mercado.controles;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import br.edu.iff.mercado.entidades.Sessao;
import br.edu.iff.mercado.util.HibernateUtil;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aluno
 */
public class ControleSessao {
    //Função de salvar/atualizar um produto
    public static boolean salvar(Sessao sessao){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(sessao);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return false;
        }        
    }

    //Localiza um usuario pelo id
    public static Sessao buscar(Integer id) {
        String IdSessao = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Sessao u where u.id='"+IdSessao+"'";
        Sessao produto = (Sessao) sessionRecheio.createQuery(hql).uniqueResult();
        return produto;
    }

    //Retorna todos os usuario do sistema
    public static List<Sessao> listar() {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Sessao u";
        List<Sessao> lista = (List) sessionRecheio.createQuery(hql).list();
        return lista;
    }

    
   
    
    //Função de apagar um produto
    public static boolean deletar(Sessao sessao){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(sessao);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }


    public static void atualizar(String IdSessao, String NmNome) {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Sessao u where u.id='"+ IdSessao +"'";
        Sessao sessao = (Sessao) sessionRecheio.createQuery(hql).uniqueResult();
        Transaction tr = sessionRecheio.beginTransaction();
        sessao.setNmNome(NmNome);
        
        sessionRecheio.saveOrUpdate(sessao);
        tr.commit();
    }

}
    
    


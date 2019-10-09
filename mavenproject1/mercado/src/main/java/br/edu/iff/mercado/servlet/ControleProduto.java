/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.entidades.Produto;
import br.edu.iff.mercado.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
/**
 *
 * @author aluno
 */
public class ControleProduto {
    
     //Função de salvar/atualizar um usuario
    public static boolean salvar(Produto produto){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(produto);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza um usuario pelo id
    public static Produto buscar(Integer id)
    {
        String idUsuario = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Produto u where u.id='"+idUsuario+"'";
        Produto produto = (Produto)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return produto;
    }
    
    //Retorna todos os usuario do sistema
    public static List<Produto> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Produto u";
        List<Produto> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Produto usuario){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(usuario);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
    
}

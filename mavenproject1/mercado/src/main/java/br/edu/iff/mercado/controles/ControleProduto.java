package br.edu.iff.mercado.controles;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
    //Função de salvar/atualizar um produto
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
    
    //Localiza um produto pelo id
    public static Produto buscar(Integer id)
    {
        String idProduto = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Produto u where u.id='"+idProduto+"'";
        Produto produto = (Produto)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return produto;
    }
    
    //Retorna todos os produto do sistema
    public static List<Produto> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Produto u";
        List<Produto> lista = (List)sessionRecheio.createQuery(hql).list();
        return lista;
    }
    
    //Função de apagar um produto
    public static boolean deletar(Produto produto){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(produto);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }

}
    
    


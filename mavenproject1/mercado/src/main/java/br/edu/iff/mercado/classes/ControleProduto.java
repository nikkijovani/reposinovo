package br.edu.iff.mercado.classes;

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
    public static boolean salvar(ControleProduto produto){
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
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Produto u";
        List<Produto> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um produto
    public static boolean deletar(ControleProduto produto){
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

    public static void deletar(Produto produto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setId(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
    
    


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.controles;

import br.edu.iff.mercado.entidades.Produto;
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
public class ControleProduto {

    //Função de salvar/atualizar um produto
    public static boolean salvar(Produto produto) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(produto);
            System.out.println("PROMOÇÃO? " + produto.getVlPromocao());
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    //Localiza um usuario pelo id
    public static Produto buscar(Integer id) {
        String idProduto = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Produto u where u.id='" + idProduto + "'";
        Produto produto = (Produto) sessionRecheio.createQuery(hql).uniqueResult();
        return produto;
    }

    //Retorna todos os usuario do sistema
    public static List<Produto> listar() {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Produto";
        List<Produto> lista = (List) sessionRecheio.createQuery(hql).list();
        return lista;
    }

    public static List<Produto> listarPorSessao(Sessao sessao) {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Produto p WHERE p.idSessao = :idSessao";
        List<Produto> lista = (List) sessionRecheio.createQuery(hql).setEntity("idSessao", sessao).list();
        return lista;
    }

    //Função de apagar um usuario
    public static boolean deletar(Produto produto) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(produto);
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public static void atualizar(String idProduto, String NmNome, String NmMarca, String DsDescricao, BigDecimal VlUnidade, Date DtPromocao, BigDecimal VlPromocao) {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        String hql = "from Produto u where u.id='" + idProduto + "'";
        Produto produto = (Produto) sessionRecheio.createQuery(hql).uniqueResult();
        Transaction tr = sessionRecheio.beginTransaction();
        produto.setNmNome(NmNome);
        produto.setNmMarca(NmMarca);
        produto.setDsDescricao(DsDescricao);
        produto.setVlUnidade(VlUnidade);
        produto.setVlPromocao(VlPromocao);
        produto.setDtPromocao(DtPromocao);
        sessionRecheio.saveOrUpdate(produto);
        tr.commit();
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.controles;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import br.edu.iff.mercado.entidades.Cliente;
import br.edu.iff.mercado.util.HibernateUtil;

/**
 *
 * @author aluno
 */
public class ClienteControle {

    //Função de salvar/atualizar um usuario
    public static boolean salvar(Cliente usuario) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(usuario);
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    //Localiza um usuario pelo id
    public static Cliente buscar(Integer id) {
        String idUsuario = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Cliente u where u.id='" + idUsuario + "'";
        Cliente usuario = (Cliente) sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return usuario;
    }

    //Retorna todos os usuario do sistema
    public static List<Cliente> listar() {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Cliente u";
        List<Cliente> lista = sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }

    //Função de apagar um usuario
    public static boolean deletar(Cliente usuario) {
        try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(usuario);
            tr.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}

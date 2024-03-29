/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleProduto;
import br.edu.iff.mercado.entidades.Produto;
import br.edu.iff.mercado.entidades.Sessao;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
public class CadastrarProdutoSA extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idProduto = request.getParameter("pid");
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String unidade = request.getParameter("unidade");
        String sessao = request.getParameter("sessao");
        //unidade
                //sessao

        //Cria variavel do produto
        Produto produto = new Produto();
        //Detecta se é produto novo ou antigo
        if(!idProduto.isEmpty()){
            produto = ControleProduto.buscar(Integer.parseInt(idProduto));
        }
        //Insere informações no objeto
        produto.setNmNome(nome);
        produto.setNmMarca(marca);
        produto.setVlUnidade(BigDecimal.ONE);
     Sessao idSessao = null;
        produto.setIdSessao(idSessao);
        


        //Chama de funcao para salvar ou atualizar produto
        ControleProduto.salvar(produto);
        
        //Redireciona pagina
        response.sendRedirect("listarproduto.jsp");
    }
}

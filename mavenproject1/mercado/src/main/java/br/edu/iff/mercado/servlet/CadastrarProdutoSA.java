/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleProduto;
import br.edu.iff.mercado.entidades.Produto;
import java.io.IOException;
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

        //Cria variavel do produto
        Produto produto = new Produto();
        //Detecta se é produto novo ou antigo
        if(!idProduto.isEmpty()){
            produto = ControleProduto.buscar(Integer.parseInt(idProduto));
        }
        //Insere informações no objeto
        produto.setNome(nome);
        produto.setMarca(marca);

        //Chama de funcao para salvar ou atualizar produto
        ControleProduto.salvar(produto);
        
        //Redireciona pagina
        response.sendRedirect("listarproduto.jsp");
    }
}

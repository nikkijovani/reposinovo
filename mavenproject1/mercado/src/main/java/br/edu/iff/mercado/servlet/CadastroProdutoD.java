/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleProduto;
import br.edu.iff.mercado.entidades.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Este servlet realiza a remoção de Produtos do BD.
 * @author aluno
 */
public class CadastroProdutoD extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura id da tela
        String idProduto = request.getParameter("pid");
        
        //Cria instancia do Produto com id informado
        Produto produto = new Produto();
        produto.setIdProduto(Integer.parseInt(idProduto));
        
        //Chama de funcao para apagar produto
        ControleProduto.deletar(produto);
        
        //Redireciona pagina
        response.sendRedirect("listarproduto.jsp");
    }
}

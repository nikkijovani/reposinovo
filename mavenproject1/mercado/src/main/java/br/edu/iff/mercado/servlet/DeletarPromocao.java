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
public class DeletarPromocao extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura id da tela
        String IdProduto = request.getParameter("pid");
        
        //Chama de funcao para apagar usuario
        ControleProduto.atualizarPromocao(IdProduto, null, null);
        
        //Redireciona pagina
        response.sendRedirect("listagemProdutos.jsp");
    }
}

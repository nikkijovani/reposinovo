/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleAdmin;
import br.edu.iff.mercado.entidades.Admin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
public class DeletarAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura id da tela
        String idAdmin = request.getParameter("pid");
        
        //Cria instancia do usuario com id informado
        Admin usuario = new Admin();
        usuario.setIdAdmin(Integer.parseInt(idAdmin));
        
        //Chama de funcao para apagar usuario
        ControleAdmin.deletar(usuario);
        
        //Redireciona pagina
        response.sendRedirect("listarAdmin.jsp");
    }
}

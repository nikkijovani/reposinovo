/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleAdmin;
import br.edu.iff.mercado.entidades.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
public class AdminAS extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idAdmin = request.getParameter("pid");
        String NmNome = request.getParameter("nome");
        String DsSenha = request.getParameter("senha");
        String NrTelefone = request.getParameter("telefone");
        String NrCpf = request.getParameter("cpf");

        //Cria instancia do usuario
        Admin admin = new Admin();        
        //Detecta se é usuario novo ou antigo
        if(!idAdmin.isEmpty()){
            Integer id = Integer.parseInt(idAdmin);
            admin.setIdAdmin(id);
        }
        //Insere informações no objeto
        admin.setNmNome(NmNome);
        admin.setDsSenha(DsSenha);
        admin.setNrTelefone(NrTelefone);
        admin.setNrCpf(NrCpf);
        //Chama de funcao para salvar ou atualizar usuario
        ControleAdmin.salvar(admin);
        
        //Redireciona pagina
        response.sendRedirect("listarAdmin.jsp");
    }
}
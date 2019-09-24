/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

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
        String idtext = request.getParameter("pid");
        String NmNome = request.getParameter("NmNome");
        String DsSenha = request.getParameter("DsSenha");

        //Cria instancia do usuario
        Admin usuario = new Admin();        
        //Detecta se é usuario novo ou antigo
        if(!idtext.isEmpty()){
            Integer id = Integer.parseInt(idtext);
            usuario.setId(id);
        }
        //Insere informações no objeto
        usuario.setNmNome(NmNome);
        usuario.setDsSenha(DsSenha);

        //Chama de funcao para salvar ou atualizar usuario
        Adminnn.salvar(usuario);
        
        //Redireciona pagina
        response.sendRedirect("index.html");
    }
}
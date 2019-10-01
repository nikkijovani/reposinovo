/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.entidades.Cliente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
public class ClienteAS extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idtext = request.getParameter("pid");
        String NmNome = request.getParameter("nome");
        String DsSenha = request.getParameter("senha");
        String NrTelefone = request.getParameter("telefone");
        String NrCpf = request.getParameter("cpf");
        String endereco = request.getParameter("endereco");
        String NrRg = request.getParameter("rg");
        String DsEmail = request.getParameter("email");

        //Cria instancia do usuario
        Cliente usuario = new Cliente();        
        //Detecta se é usuario novo ou antigo
        if(!idtext.isEmpty()){
            Integer id = Integer.parseInt(idtext);
            usuario.setId(id);
        }
        //Insere informações no objeto
        usuario.setNmNome(NmNome);
        usuario.setDsSenha(DsSenha);
        usuario.setNrTelefone(NrTelefone);
        usuario.setNrCpf(NrCpf);
        usuario.setEndereco(endereco);
        usuario.setNrRg(NrRg);
        usuario.setDsEmail(DsEmail);

        //Chama de funcao para salvar ou atualizar usuario
        ClienteControle.salvar(usuario);
        
        //Redireciona pagina
        response.sendRedirect("perfilcliente.html");
    }
}
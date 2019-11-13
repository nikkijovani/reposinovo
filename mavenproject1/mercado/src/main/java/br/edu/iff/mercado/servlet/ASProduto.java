/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.controles.ControleProduto;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
public class ASProduto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String IdProduto = request.getParameter("pid");
        
        String valorPromocional = request.getParameter("vlpromocao");
        BigDecimal VlPromocao = null;
        if (!(valorPromocional == null || valorPromocional.isEmpty())) {
            VlPromocao = BigDecimal.valueOf(Double.parseDouble(valorPromocional));
        }

        String data = request.getParameter("dtpromocao");
        Date DtPromocao = null;
        if (!(data == null || data.isEmpty())) {
            try {
                DtPromocao = new SimpleDateFormat("dd/MM/yyyy").parse(data);
            } catch (ParseException ex) {
                System.out.println("ERRO DE CONVERSAO DE DATA! Data digitada: " + data);
            }
        }
        //Chama de funcao para salvar ou atualizar usuario
        ControleProduto.atualizarPromocao(IdProduto, DtPromocao, VlPromocao);

        //Redireciona pagina
        response.sendRedirect("listagemProdutos.jsp");
    }
}

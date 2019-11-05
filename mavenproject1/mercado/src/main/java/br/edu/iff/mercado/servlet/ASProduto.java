/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

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
        String idProduto = request.getParameter("idProduto");
        String NmNome = request.getParameter("nome");
        String NmMarca = request.getParameter("marca");
        String DsDescricao = request.getParameter("descricao");
        String valorUnitario = request.getParameter("vlunidade");
        BigDecimal VlUnidade = BigDecimal.valueOf(Double.parseDouble(valorUnitario));
        String valorPromocional = request.getParameter("vlpromocao");
        BigDecimal VlPromocao = BigDecimal.valueOf(Double.parseDouble(valorPromocional));

        String data = request.getParameter("dtpromocao");

        Date DtPromocao = new Date();
        try {
            DtPromocao = new SimpleDateFormat("dd/MM/yyyy").parse(data);
        } catch (ParseException ex) {
            System.out.println("ERRO DE CONVERSAO DE DATA! Data digitada: " + data);
        }

        //Redireciona pagina
        response.sendRedirect("listagemProdutos.jsp");
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.servlet;

import br.edu.iff.mercado.entidades.Cliente;
import br.edu.iff.mercado.entidades.Produto;
import br.edu.iff.mercado.entidades.Compra;
import br.edu.iff.mercado.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aluno
 */
public class compra extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String IdProduto = request.getParameter("coisa");
        String quantidade;
        quantidade = request.getParameter("treco");
        Cliente usuario = (Cliente) request.getSession().getAttribute("usuariologado");
        Date agora = new Date();
        // TODO capturar a quantidade do produto

        Produto produto = new Produto();
        produto.setIdProduto(Integer.parseInt(IdProduto));
        
        Compra compra = new Compra();
        compra.setIdCliente(usuario);
        compra.setIdProduto(produto);
        // trocar
        Random random = new Random();
        int numero = random.nextInt(Integer.MAX_VALUE);
        compra.setIdCompra(numero);
        compra.setDataHora(agora);
        compra.setQuantidade(BigInteger.valueOf(Long.parseLong(quantidade)));
        
         try {
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(compra);
            tr.commit();

        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
    }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }

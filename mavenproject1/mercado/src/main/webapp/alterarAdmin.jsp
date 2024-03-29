<%@page import="br.edu.iff.mercado.entidades.Admin"%>
<%@page import="br.edu.iff.mercado.controles.ControleAdmin"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="br.edu.iff.mercado.util.HibernateUtil.*" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <title>Crud</title>
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        <br> 
        <h2>Leitura e alteração!</h2>
        <%
            //Criar variaveis
            Admin admin = new Admin();
            String nome = "";
            String senha = "";
            String telefone = "";
            String cpf = "";

            //Captura id (se alteração)
            String idAdmin = request.getParameter("pid");

            //Localiza usuario (se alteração)
            if (!idAdmin.isEmpty()) {
                admin = ControleAdmin.buscar(Integer.parseInt(idAdmin));
                nome = admin.getNmNome();
                senha = admin.getDsSenha();
                telefone = admin.getNrTelefone();
                cpf = admin.getNrCpf();

            } else {
                idAdmin = "";
            }

        %>
        <form method="POST" action="AdminAS">
            <div hidden>
                ID<input type="text" name="pid" value="<%=idAdmin%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Senha<input type="text" name="senha" value="<%=senha%>">
            Telefone<input type="text" name="telefone" value="<%=telefone%>">
            CPF<input type="text" name="cpf" value="<%=cpf%>">
            <input type="submit">
        </form>
    </body>
</html>


<%@page import="br.edu.iff.mercado.servlet.ClienteControle"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="br.edu.iff.mercado.HibernateUtil" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>

        <%
            //Criar variaveis
            Cliente usuario = new Cliente();
            String nome = "";
            String senha = "";

            //Captura id (se alteração)
            String idUsuario = request.getParameter("pid");

            //Localiza usuario (se alteração)
            if (!idUsuario.isEmpty()) {
                usuario = ClienteControle.buscar(Integer.parseInt(idUsuario));
                nome = usuario.getNmNome();
                senha = usuario.getDsSenha();
            } else {
                idUsuario = "";
            }

        %>
        <form method="POST" action="ClienteAS">
            <div hidden>
                ID<input type="text" name="pid" value="<%=idUsuario%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Senha<input type="text" name="senha" value="<%=senha%>">
            <input type="submit">
        </form>
    </body>
</html>

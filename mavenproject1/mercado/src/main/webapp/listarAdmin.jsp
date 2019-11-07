<%@page import="br.edu.iff.mercado.controles.ControleAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <title>Crud Admin</title>
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        <br>
        <h2>Lista dos usuários admin's</h2>
        <%
            List<Admin> lista = ControleAdmin.listar();
            request.setAttribute("usuarios", lista);
        %>
        <display:table name="usuarios">
            <display:column property="id" title="ID" paramProperty="checkbox"/>
            <display:column property="nmNome" title="Nome"/>
            <display:column property="nrTelefone" title="Telefone"/>
            <display:column property="nrCpf" title="Cpf"/>
            <display:column value="alterar" title="Alterar" href="alterarAdmin.jsp" paramId="id" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="id" paramProperty="id" href="${pageContext.request.contextPath}/DeletarAdmin"/>
            <display:setProperty name="basic.msg.empty_list" value="Nenhum admin cadastrado." />
        </display:table>
        <br>
    </body>
</html>
<%@page import="br.edu.iff.mercado.servlet.Adminnn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="beleza.css">
        <title>Crud Admin</title>
    </head>
    <body>
        <%@ include file="cabecalhoadm.jspf" %>
        <br>
        <h2>Lista dos usuários admin's</h2>
        <%
            List<Admin> lista = Adminnn.listar();
            request.setAttribute( "usuarios", lista );
        %>
        <display:table name="usuarios">
            <display:column property="id" title="ID" paramProperty="checkbox"/>
            <display:column property="nmNome" title="Nome"/>
            <display:column property="dsSenha" title="Senha"/>
            <display:column property="nrTelefone" title="Telefone"/>
            <display:column property="nrCpf" title="Cpf"/>
            <display:column value="alterar" title="Alterar" href="alterar.jsp" paramId="id" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="id" paramProperty="id" href="${pageContext.request.contextPath}/DeletarAdmin"/>
            <display:setProperty name="basic.msg.empty_list" value="Nenhum admin cadastrado." />
        </display:table>
        <br>
    </body>
</html>
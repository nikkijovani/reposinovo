<%@page import="br.edu.iff.mercado.servlet.ClienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil do Cliente :) </title>
    </head>
    <body>
        <h1>Informações</h1>
        <%
            List<Cliente> lista = ClienteControle.listar();
            request.setAttribute("cliente", lista);
        %>
        <display:table name="cliente">
            <display:column property="id" title="ID" paramProperty="checkbox"/>
            <display:column property="nmNome" title="Nome"/>
            <display:column property="dsSenha" title="Senha"/>
            <display:column property="nrTelefone" title="Telefone"/>
            <display:column property="nrCpf" title="Cpf"/>
            <display:column property="nrRg" title="Rg"/>
            <display:column property="dsEmail" title="Email"/>
            <display:column property="endereco" title="Endereço"/>
            <display:column value="alterar" title="Alterar" href="alterar.jsp" paramId="id" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="id" paramProperty="id" href="${pageContext.request.contextPath}/DeletarCliente"/>
        </display:table>
        <br><br>

    </body>
</html>
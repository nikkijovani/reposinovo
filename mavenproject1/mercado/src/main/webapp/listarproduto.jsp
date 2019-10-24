<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page import="br.edu.iff.mercado.classes.ControleProduto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.classes.*"/>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*"/>
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
    </head>
    <body>
        <h1>Lista dos produtos</h1>
        <%
            List<Produto> lista = ControleProduto.listar();
            request.setAttribute("produtos", lista);
        %>
        <display:table name="lista">
            <display:column property="id" title="ID" paramProperty="checkbox"/>
            <display:column property="nome" title="Produto"/>
            <display:column property="marca" title="Marca"/>
            <display:column value="alterar" title="Alterar" href="alterar.jsp" paramId="pid" paramProperty="id" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="id" href="${pageContext.request.contextPath}/CadastrarProdutos"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem produtos" />
        </display:table>
        <br><br/>
        <a href="alterar.jsp?pid=" >Criar novo produto</a>
    </body>
</html>
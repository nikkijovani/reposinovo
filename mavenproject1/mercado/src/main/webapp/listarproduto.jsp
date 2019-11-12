<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*"/>
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <title>Produtos</title>
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        <h1>Lista dos produtos</h1>
        <%
            List<Produto> lista = ControleProduto.listar();
            request.setAttribute("produto", lista);
        %>
        <display:table name="produto" >
            <display:column property="idProduto" title="ID" paramProperty="checkbox"/>
            <display:column property="nmNome" title="Produto"/>
            <display:column property="nmMarca" title="Marca"/>
            <display:column property="vlUnidade" title="Unidade"/>
            <display:column property="idSessao" title="Sessão" />
            <display:column value="alterar" title="Alterar" href="produtoAlterar.jsp" paramId="pid" paramProperty="idProduto" />             
            <display:column value="deletar" title="Deletar" autolink="true"  paramId="pid" paramProperty="idProduto" href="${pageContext.request.contextPath}/CadastroProdutoD"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem produtos" />
        </display:table>
        <br><br/>
        <a href="produtoAlterar.jsp?pid=" >Criar novo produto</a>
    </body>
</html>
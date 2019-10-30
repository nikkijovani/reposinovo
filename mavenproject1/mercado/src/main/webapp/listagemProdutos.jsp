<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <%@ include file="cabecalhoadm.jspf" %>
        <br>
        <h2>Lista dos usuários admin's</h2>
        <%
            List<Produto> lista = ControleProduto.listar();
            request.setAttribute("produtos", lista);
        %>
        <display:table name="produtos">
            <display:column property="ftProduto" title=""/>
            <display:column property="idSessao" title="ID" paramProperty="checkbox"/>
            <display:column property="idProduto" title="ID" paramProperty="checkbox"/>
            <display:column property="nmNome" title="Nome"/>
            <display:column property="nmMarca" title="Marca"/>
            <display:column property="vlUnidade" title="Preço a unidade"/>
            <display:column property="vlPromocao" title="Valor promocional"/>
            <display:column property="dtPromocao" title="Fim da Promoção"/>
            <display:column property="nmMarca" title="Marca"/>
            <display:column value="alterar" title="" href="alteracaoProduto.jsp" paramId="idProduto" paramProperty="idProduto" />             
            <display:column value="deletar" title="" autolink="true"  paramId="idProduto" paramProperty="idProduto" href="${pageContext.request.contextPath}/DeletarProduto"/>
            <display:setProperty name="basic.msg.empty_list" value="Nenhum produto cadastrado." />
        </display:table>
        <br>
    </body>
</html>

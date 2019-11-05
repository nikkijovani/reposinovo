<%@page import="java.math.BigDecimal"%>
<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
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
        <title>Alterando produtos!</title>
    </head>
    <body>
        <%@ include file="cabecalhoadm.jspf" %>
        <br> 
        <h2>Editar Produto</h2>
        <%
            String idProduto = request.getParameter("idProduto");
            Produto produto = ControleProduto.buscar(Integer.parseInt(idProduto));
            if (produto == null) {
        %>
        <h3>Produto não encontrado!</h3>

        <% } else {
                session.setAttribute("produtoEditado", produto);
        %>

        <form method="POST" action="ASProduto">
            <div hidden>
                ID Produto<input type="text" name="idProduto" value="<%=idProduto%>">
            </div>
            Nome<input type="text" name="nome" value="<%=produto.getNmNome()%>">
            Descricao<input type="text" name="descricao" value="<%=produto.getDsDescricao()%>">
            Marca<input type="text" name="marca" value="<%=produto.getNmMarca()%>">
            Valor unidade<input type="text" name="vlunidade" value="<%=produto.getVlUnidade()%>">
            Valor promocional<input type="text" name="vlpromocao" value="<%=produto.getVlPromocao()%>">
            Fim da Promoção<input type="text" name="dtpromocao" value="<%=produto.getDtPromocao()%>">
            <input type="submit">
        </form>
        <% }%>
    </body>
</html>

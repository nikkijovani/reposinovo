<%@page import="java.math.BigDecimal"%>
<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
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
            String IdProduto = request.getParameter("pid");
            Produto produto = ControleProduto.buscar(Integer.parseInt(IdProduto));
            if (produto == null) {
        %>
        <h3>Produto não encontrado!</h3>

        <% } else {
                session.setAttribute("produtoEditado", produto);
                String dataPromo = new SimpleDateFormat("dd/MM/yyyy").format(produto.getDtPromocao());
        %>

        <form method="POST" action="ASProduto">
            <div hidden>
                ID Produto<input type="text" name="pid" value="<%=IdProduto%>">
            </div>
            Nome<input type="text" name="nome" value="<%=produto.getNmNome()%>">
            Descricao<input type="text" name="descricao" value="<%=produto.getDsDescricao()%>">
            Marca<input type="text" name="marca" value="<%=produto.getNmMarca()%>">
            Valor unidade<input type="text" name="vlunidade" value="<%=produto.getVlUnidade()%>">
            Valor promocional<input type="text" name="vlpromocao" value="<%=produto.getVlPromocao()%>">
            Fim da Promoção<input type="text" name="dtpromocao" value="<%=dataPromo%>">
            <input type="submit">
        </form>
        <% }%>
    </body>
</html>

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
        <%@ include file="cabecalho.jspf" %>
        <br> 
        <h2>Editar Promoção</h2>
        <%
            String IdProduto = request.getParameter("pid");
            Produto produto = ControleProduto.buscar(Integer.parseInt(IdProduto));
            if (produto == null) {
        %>
        <h3>Produto não encontrado!</h3>

        <% } else {

            session.setAttribute("produtoEditado", produto);
            String promo;
            String promoData;
            if (produto.getVlPromocao() == null) {
                promo = "";
            } else {
                promo = produto.getVlPromocao().toString();
            }

            if (produto.getDtPromocao() == null) {
                promoData = "";
            } else {
                promoData = new SimpleDateFormat("dd/MM/yyyy").format(produto.getDtPromocao());
            }

            session.setAttribute("produtoEditado", produto);

        %>

        <form method="POST" action="ASProduto">
            <input type="hidden" name="pid" value="<%=IdProduto%>">
            Nome <input type="text" name="nome" value="<%=produto.getNmNome()%>" disabled><br>
            Descricao <input type="text" name="descricao" value="<%=produto.getDsDescricao()%>" disabled><br>
            Marca <input type="text" name="marca" value="<%=produto.getNmMarca()%>" disabled><br>
            Valor unidade <input type="text" name="vlunidade" value="<%=produto.getVlUnidade()%>" disabled><br>

            Valor promocional <input type="text" name="vlpromocao" value="<%=promo%>"><br>
            Fim da Promoção <input type="text" name="dtpromocao" value="<%=promoData%>"><br>

            <input type="submit" title="Alterar Promoção">
        </form>
        <% }%>
    </body>
</html>

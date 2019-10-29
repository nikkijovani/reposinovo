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
        <h2>Leitura e alteração!</h2>
        <%
            //Criar variaveis
            Produto produto = new Produto();
            String nome = "";
            String marca = "";
            String descricao = "";
            Date promocao = "";
            BigDecimal unidade = "";
            BigDecimal promocao = "";

            //Captura id (se alteração)
            String idProduto = request.getParameter("id");

            //Localiza usuario (se alteração)
            if (!idProduto.isEmpty()) {
                produto = ControleProduto.buscar(Integer.parseInt(idProduto));
                nome = produto.getNmNome();
                descricao = produto.getDsDescricao();
                marca = produto.getNmMarca();
                unidade = produto.getVlUnidade();
                promocao = produto.getDtPromocao();
                

            } else {
                idProduto = "";
            }

        %>
        <form method="POST" action="AdminAS">
            <div hidden>
                ID<input type="text" name="id" value="<%=idProduto%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Descricao<input type="text" name="telefone" value="<%=descricao%>">
            Marca<input type="text" name="marca" value="<%=marca%>">
            Valor unidade<input type="text" name="vlunidade" value="<%=unidade%>">
            Valor promocional<input type="text" name="vlpromocional" value="<%=promocao%>">
            <input type="submit">
        </form>
    </body>
</html>

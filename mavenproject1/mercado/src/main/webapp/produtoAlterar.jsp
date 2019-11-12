
<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page import="br.edu.iff.mercado.util.WebHelpis"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <title>Alterar Produto</title>
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        <h1>Alteração ou Adição dos Produtos</h1>
        <%
            //Criar variáveis dos produtos
            Produto produto = new Produto();
            String nome = "";
            String marca = "";
            String unidade = "";
            Sessao sessao = null;
            

            //Capturar id(se alteração)
            String idProduto = request.getParameter("pid");

            //Localizar Produto
            if (!idProduto.isEmpty()) {
                produto = ControleProduto.buscar(Integer.parseInt(idProduto));
                nome = produto.getNmNome();
                marca = produto.getNmMarca();
                unidade = produto.getVlUnidade().toString();
                sessao = produto.getIdSessao();
                
        %>
        <form method="POST" action="CadastrarProdutoSA">
            <%
            } else {
            %>
            <form method="POST" action="CadastrarProdutos">
                <%              
                    idProduto = "";
                    }
                %>
                <input type="hidden" name="pid" value="<%=idProduto%>"/>
                Nome<input type="text" name="nome" value="<%=nome%>"/>
                Marca<input type="text" name="marca" value="<%=marca%>"/>
                Preço<input type="text" name="unidade" value="<%=unidade%>"/>
                Sessão<%=WebHelpis.montarSelectSessao(sessao)%>
                <input type="submit"/>
            </form>
    </body>
</html>

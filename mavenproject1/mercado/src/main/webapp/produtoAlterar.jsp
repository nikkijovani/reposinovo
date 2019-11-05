
<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page import="br.edu.iff.mercado.entidades.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <h1>Alteração dos Produtos</h1>
        <%
            //Criar variáveis dos produtos
            Produto produto = new Produto();
            String nome = "";
            String marca = "";

            //Capturar id(se alteração)
            String idProduto = request.getParameter("pid");

            //Localizar Produto
            if (!idProduto.isEmpty()) {
                produto = ControleProduto.buscar(Integer.parseInt(idProduto));
                nome = produto.getNmNome();
                marca = produto.getNmMarca();
            } else {
                idProduto = "";
            }

        %>
        <form method="POST" action="CadastrarProdutoSA.java"
             <input type="hidden" name="pid" value="<%=idProduto%>"/>

        <form method="POST" action="CadastrarProdutos.java">
              <div hidden>
                ID<input type="text" name="pid" value="<%=idProduto%>"/>
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>"/>
            Marca<input type="text" name="marca" value="<%=marca%>"/>
            <input type="submit"/>
        </form>
    </body>
</html>

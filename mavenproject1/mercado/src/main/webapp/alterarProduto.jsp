<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.Produto.java"/>
<jsp:directive.page import="java.util*"/>
<jsp:directive.page impor="br.edu.iff.mercado.util.HibernateUtil"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD dos produtos</title>
    </head>
    <body>
        <h1>Alteração dos Produtos</h1>
        <%
            //Criar variáveis dos produtos
            Produto produto = new Produto;
            String nome = "";
            String marca = "";
            Integer unidade "";
            
            //Capturar id(se alteração)
            String idProduto = request.getParameter("pid");
            
            //Localizar Produto
            if(!idProduto.isEmpty()){
                produto = ProdutoControle.buscar(Integer.parseInt(idProduto));
                nome = produto.getNome();
                marca = produto.getMarca();
                unidade = produto.getUnidade ();
            }
            else{
                idProduto = "";
            }
            
        %>
        <form method="POST" action="CadastrarProdutos.java"
              <div hidden>
                ID<input type="text" name="pid" value="<%=idProduto%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Marca<input type="text" name="senha" value="<%=marca%>">
            Unidade<input type="texte" name="unidade" value="<%nome%>">
            <input type="submit">
        </form>
    </body>
</html>

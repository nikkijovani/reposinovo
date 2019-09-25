<%@page import="br.edu.iff.mercado.entidades.Admin"%>
<%@page import="br.edu.iff.mercado.servlet.Adminnn"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="br.edu.iff.mercado.util.HibernateUtil.*" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>
        <h1>Leitura e alteração!</h1>
        <%
        //Criar variaveis
        Admin usuario = new Admin();
        String nome = "";
        String senha = "";
        String telefone = "";
        String cpf = "";

        //Captura id (se alteração)
        String idUsuario = request.getParameter("id");
        
        //Localiza usuario (se alteração)
        if(!idUsuario.isEmpty()){
            usuario = Adminnn.buscar(Integer.parseInt(idUsuario));
            nome = usuario.getNmNome();
            senha = usuario.getDsSenha();
            telefone = usuario.getNrTelefone();
            cpf = usuario.getNrCpf();
            
        }
        else{
            idUsuario = "";
        }
        
        %>
        <form method="POST" action="AdminAS">
            <div hidden>
                ID<input type="text" name="id" value="<%=idUsuario%>">
            </div>
            Nome<input type="text" name="nome" value="<%=nome%>">
            Senha<input type="text" name="senha" value="<%=senha%>">
            Telefone<input type="text" name="telefone" value="<%=telefone%>">
            Cpf<input type="text" name="cpf" value="<%=cpf%>">
            <input type="submit">
        </form>
    </body>
</html>

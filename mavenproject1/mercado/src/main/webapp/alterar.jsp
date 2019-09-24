<%@page import="br.edu.iff.mercado.servlet.Adminnn"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="br.edu.iff.mercado.entidades.Admin*" />
<jsp:directive.page import="br.edu.iff.mercado.util.HibernateUtil*" />

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
        String NmNome = "";
        String DsSenha = "";
        String NrTelefone = "";
        String NrCpf = "";

        //Captura id (se alteração)
        String idUsuario = request.getParameter("pid");
        
        //Localiza usuario (se alteração)
        if(!idUsuario.isEmpty()){
            usuario = Adminnn.buscar(Integer.parseInt(idUsuario));
            NmNome = usuario.getNmNome();
            DsSenha = usuario.getDsSenha(); 
            NrTelefone = usuario.getNrTelefone();
            NrCpf = usuario.getNrCpf();   
        }
        else{
            idUsuario = "";
        }
        
        %>
        <form method="POST" action="UsuarioServletSA">
            <div hidden>
                ID<input type="text" name="pid" value="<%=idUsuario%>">
            </div>
            Nome<input type="text" name="nome" value="<%=NmNome%>">
            Senha<input type="text" name="senha" value="<%=DsSenha%>">
            Telefone<input type="text" name="senha" value="<%=NrTelefone%>">
            Cpf<input type="text" name="senha" value="<%=NrCpf%>">
            <input type="submit">
        </form>
    </body>
</html>
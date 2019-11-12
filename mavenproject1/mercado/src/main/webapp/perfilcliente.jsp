<%-- 
    Document   : perfilcliente
    Created on : 01/10/2019, 17:28:27
    Author     : aluno
--%>

<%@page import="br.edu.iff.mercado.entidades.Cliente"%>
<%@page import="br.edu.iff.mercado.controles.ClienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
        <link rel="stylesheet" type="text/css" href="css\cssdocontato.css">
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        <br><br>
        <section>

            <div class="formulario">  

                <form method="POST" action="ClienteAS" >       
                    <h1> PERFIL BOLADÃO :)</h1>
                    <div hidden>
                        <input type="text" name="pid" value="<%=usuario.getId()%>">
                    </div>
                    <div>  
                        <label>* Nome</label>
                        <input name="nome" type="text" class="g"value="<%=usuario.getNmNome()%>">
                    </div>
                    <div>
                        <label>* E-mail</label>
                        <input name="email" type="text" class="g" value="<%=usuario.getDsEmail()%>">
                    </div>
                    <div>
                        <label>Telefone celular</label>
                        <input name="telefone" type="text" class="p" id="celular" value="<%=usuario.getNrTelefone()%>">
                    </div>
                    <div>
                        <label>* CPF</label>
                        <input name="cpf" type="text" class="p" id="cpf" value="<%=usuario.getNrCpf()%>">
                    </div>
                    <div>
                        <label>RG</label>
                        <input name="rg" type="text" class="p" id="rg" value="<%=usuario.getNrRg()%>">
                    </div>
                    <div>
                        <label>Endereço</label>
                        <input name="endereco" type="text" class="g" value="<%=usuario.getEndereco()%>">
                    </div> 
                    <div>
                        <label> * Senha</label>
                        <input name="senha" type="password" class="p" value="<%=usuario.getDsSenha()%>">  
                    </div>
                    <div>
                        <label>* Confirmar senha</label>
                        <input name="senha" type="password" class="p">  
                    </div>

                    <div class="button">
                        <input type="submit" value="Alterar" href="index.jsp">
                    </div>
                </form>
            </div><!--/formulario-->

        </section>



    </body>
</html>

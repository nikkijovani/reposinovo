<%-- 
    Document   : perfilcliente
    Created on : 01/10/2019, 17:28:27
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="cabecalho.jspf" %>
        
       value="<%usuario.getNome();%>" 
        
        <section>
        
       <div class="formulario">  

            <form method="post" action="cadastroclie" >                  
             <div>  
                <label>* Nome</label>
                <input name="nm_nome" type="text" class="g"value="<%usuario.getNmNome();%>">
            </div>
            <div>
                <label>* E-mail</label>
                <input name="ds_email" type="text" class="g" value="<%usuario.getDsEmail();%>">
            </div>
            <div>
                <label>Telefone celular</label>
                <input name="nr_telefone" type="text" class="p" id="celular" value="<%usuario.getNrTelefone();%>">
            </div>
            <div>
                <label>CPF</label>
                <input name="nr_cpf" type="text" class="p" id="cpf" value="<%usuario.getNrCpf();%>">
            </div>
            <div>
                <label>RG</label>
                <input name="nr_rg" type="text" class="p" id="rg" value="<%usuario.getNrRg();%>">
            </div>
            <div>
                <label>Endereço</label>
                <input name="endereco" type="text" class="g" value="<%usuario.getEndereco();%>">
            </div> 
            <div>
                <label>Senha</label>
                <input name="ds_senha" type="password" class="p" value="<%usuario.getDsSenha();%>">  
            </div>
            <div>
                <label>Confirmar senha</label>
                <input name="ds_senha" type="password" class="p">  
            </div>
            <div class="button">
                <input type="submit" value="Enviar">
            </div>
            </form>
      </div><!--/formulario-->
                
    </section>
        
        
        
    </body>
</html>

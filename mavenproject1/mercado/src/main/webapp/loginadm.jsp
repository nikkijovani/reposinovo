<%-- 
    Document   : loginadm
    Created on : 01/10/2019, 12:34:50
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> Login </title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="cssadmlogin.css">
</head>
<body>
    <%@ include file="cabecalho.jspf" %>
<form action="loginadm" method="post">
    <div>
        <label>CPF:</label>
        <input type="text" name="nr_cpf" />
    </div>
    <div>
        <label>Senha:</label>
        <input type="senha" name="ds_senha"/>
    </div>
    <div class="button">
        <button type="submit">Enviar</button>
    </div>
</form>
</body>
</html>
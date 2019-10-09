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
	<link rel="stylesheet" type="text/css" href="css\cssdologin.css">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
</head>
<body>
    <%@ include file="cabecalho.jspf" %>
    <br> <br> <br>
<form action="loginadm" method="post">
    <div>
        <label>Digite seu CPF:</label>
        <input type="text" name="nr_cpf" />
    </div>
    <div>
        <label>Digite sua senha:</label>
        <input type="password" name="ds_senha"/>
    </div>
    <div class="button">
        <input type="submit" value="Enviar">
    </div>
</form>
</body>
</html>

<%-- 
    Document   : indexadm
    Created on : 02/10/2019, 10:51:26
    Author     : aluno
--%>
<%@page import="br.edu.iff.mercado.servlet.Adminnn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />
<!DOCTYPE html>
<html style="border: 0em;">
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="beleza.css">
		<title>Mercearia online</title>
	</head>

	<body>
		<header>
			<img src="imagens /logosite.png" width=155px right=55px alt="Mercearia online">
			   <nav class="menu">
					<ul>
                                                <li><a href="indexadm.jsp">Página Inicial</a></li>
						<li><a	href="listar.jsp">Listar Admin's</a></li>
                                                <li><a href="alterar.jsp?id=" >Criar um novo Admin</a></li>
					</ul>
			 </nav>
		
		</header>
                
                <img src="imagens /adminicial.png" alt="logo da página inicial" id="imgpos">

        </body>
</html>
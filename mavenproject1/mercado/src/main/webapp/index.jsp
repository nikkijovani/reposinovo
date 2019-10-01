<%-- 
    Document   : index
    Created on : 18/09/2019, 11:32:45
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*"/>
<jsp:directive.page import="java.util.*"/>

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
						<li><a	href="index.html">Página inicial</a></li>
                                                <li><a	href="contato.html">Contato</a>
						<li><a	href="sessaodeprodutos.html">Sessão de produtos</a>
							<ul>
								<li><a	href="verduras.html">Verduras</a></li>
								<li><a	href="frutas.html">Frutas</a></li>
								<li><a	href="enlatados.html">Enlatados</a></li>
								<li><a	href="carneseaves.html">Carnes e aves</a></li>
								<li><a	href="frioselati.html">Frios e laticínios</a></li>
								<li><a	href="cereais.html">Cereais e farináceos</a></li>
								<li><a	href="bebidas.html">Bebidas</a></li>
							</ul>
						</li>
                                                <li> <a href="admlogin.html">Adm</a> </li>
                                                <% Cliente usuario = (Cliente) session.getAttribute("usuario");
                                                    if (usuario == null) {
                                                %>
						<li><a	href="login.html">Login</a></li>
						<li><a	href="cadastro.html">Cadastro</a></li>
                                                <% } else { %>
                                                <li><a	href="editarperfil.jsp">Configurações</a></li>
                                                <li><a	href="perfilcliente.html">Olá, <%=usuario.getNmNome()%>!</a></li>
                                                <li><a	href="servletLogout">Sair</a></li>
                                                <% } %>
					</ul>
			 </nav>
		
		</header>
	
		    <img src="imagens /pinicial.png" alt="logo da página inicial" id="imgpos">
                  
	</body>
</html>
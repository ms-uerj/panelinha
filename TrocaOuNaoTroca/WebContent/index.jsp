<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String erros = (String) request.getAttribute("erros");
   String msg = (String) request.getAttribute("msg");
   Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
   
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Troca ou N&atilde;o Troca?</title>
		<meta name="author" content="Panelinh@"/>
		<meta name="description" content="Web site para troca de produtos entre usuários"/>
		<meta name="keywords" content="UERJ, Troca" />		
		<meta http-equiv="content-language" content="pt-br" />
		<meta name="robots" content="index" />
		<link href="css/layout.css" type="text/css" rel="stylesheet">  		
		<link rel="icon" type="image/x-icon" href=".ico" />
		
		<script type="text/javascript" src="jquery/jquery.js"></script>
		<script type="text/javascript"> 
			$(document).ready(function(){
				$(".logar").click(function(){
					$("#logon_extra").slideToggle("slow");
				});
			});
		</script>
	</head>
	
	<body>
		<div id="wrap">
			<div id="auxiliar">
				
				<div id="logon">
					<table width="100%" cellpadding="7">				
						<tr>
							<td align="left">Bem-vindo! <% if(erros!=null){%>
						                                   <%=erros %>
						                                <% } %>
						                                <% if(usuario!=null){%>
						                                   <%="Usuário: "+usuario.getNome() %>
						                                <% } %>
						    </td>
							<td align="right"><% if(usuario==null){ %><a href="cadastro.jsp">Cadastre-se &raquo;&nbsp;
							                  <input class="logar" type="button" value="Entrar"></td><% } %>
						</tr>
					</table>
				</div>		
				<% if(usuario==null){ %>
				<div id="logon_extra">
					<center>
						Entre e troque!
						<form action="Login" method="POST">
						<a href="PaginaUsuario?cod=1">clique</a><br>
						<a href="PaginaItem?cod=1">clique item</a>
						<br>
						<br>
						<font size=2>LOGIN:</font>&nbsp;<input type="text" name="login" value="111111">
						<br>
						<br>
						<font size=2>SENHA:</font>&nbsp;<input type="text" name="senha" value="senha">
						<br>
						<br>
						<input type="submit" value="Confirmar">&nbsp;<input type="button" value="Cancelar">
						</form>
					</center>
				</div>
				<% } %>
				
				<div id="logo">Logo</div>			
				
				<div id="conteudo">Conteudo</div>			
				
				<div id="news">News</div>
				
				<div id="rodape">
				<table width="100%" cellpadding="1">
					<tr>
						<td align="center" width="300px">Termo de Uso</td>
						<td align="center" width="300px">Pol&iacute;tica de Privacidade</td>
						<td align="center" width="300px">Ajuda</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</body>
</html>
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
							<td align="right"><% if(usuario==null){ %><a href="cadastro.jsp">Cadastre-se &raquo;&nbsp;&nbsp;</a>
							                  <input class="logar" type="button" value="Entrar"></td><% } %>
						</tr>
					</table>
				</div>		
				<% if(usuario==null){ %>
				<div id="logon_extra">
					<center>
						<form action="Login" method="POST">
						<br>
						<font size=2>LOGIN:</font>&nbsp;<input type="text" name="login">
						<br>
						<br>
						<font size=2>SENHA:</font>&nbsp;<input type="text" name="senha">
						<br>
						<br>
						<input type="submit" value="Entrar">
						</form>
					</center>
				</div>
				<% } %>
				
				<div id="logo"> 
					<input name="busca" title="Buscar" type="text"><input type="button" value="Buscar"> 
				</div>			
				
				<div id="conteudo">
				<br>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis odio at tortor varius malesuada. Vestibulum pharetra adipiscing pharetra. Proin nec porttitor augue. Ut elementum dolor quis dolor sagittis tempor. Praesent vitae viverra leo. Etiam dapibus eleifend varius. In dapibus consectetur placerat. Praesent mollis interdum euismod. Vivamus vitae vulputate dolor. Suspendisse commodo quam quis lorem lobortis nec dictum lorem gravida. In neque turpis, lacinia sit amet egestas quis, feugiat vitae orci. Duis aliquet posuere malesuada. Nulla ut est vel quam porta tincidunt et ut eros. Nam tristique tincidunt tempus. Duis nec purus augue, in aliquet nisl. Fusce tristique scelerisque elementum.
				</div>			
				
				<div id="news">
				<b><u>Últimos Produtos cadastrados</u></b>
				<br><br><center>
				<a href="PaginaItem?cod=4"><img src="http://www.concamusic.com.br/images/CD%20INIMIGOS%20DA%20HP%20-%20E%20QUEM%20NAO%20GOSTA%20DO%20INIMIGOS.jpg" width="100" height="100"><br>
				Inimigos da HP - ao vivo (CD)</a><br><br>
				<a href="PaginaItem?cod=5"><img src="http://2.bp.blogspot.com/_CWq0wF54ukU/SwREe7U4cEI/AAAAAAAAD1E/ReQ4-ix-LnM/s1600/Bastardos+Ingl%C3%B3rios+-+DVDRip+-+RMVB+-+Legendado" width="100" height="100"><br>
				Bastardos Inglórios (DVD)</a><br><br>
				<a href="PaginaItem?cod=2"><img src="http://livrosgratis.net/upload/capas/fim_do_jogo.jpg" width="100" height="100"><br>
				Fim de Jogo (Livro)</a><br><br>
				</center>
				</div>
				
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
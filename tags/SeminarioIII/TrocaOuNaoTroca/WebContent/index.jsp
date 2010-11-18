<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String erros = (String) request.getAttribute("erros");
   String msg = (String) request.getAttribute("msg");
   Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
   
<html>
	<head>
		<title>Troca ou N&atilde;o Troca?</title>
		<meta name="author" content="Panelinh@"/>
		<meta name="description" content="Web site para troca de produtos entre alunos da UERJ"/>
		<meta name="keywords" content="UERJ, Troca" />		
		<meta http-equiv="content-language" content="pt-br" />
		<meta name="robots" content="index" />
		<link href="css/layout.css" type="text/css" rel="stylesheet">  		
		<link rel="icon" type="image/x-icon" href="imagens/icone.ico" />
		<script type="text/javascript" src="jquery/jquery.js"></script>
		<script type="text/javascript"> 
			$(document).ready(function(){
				$("#logar").click(function(){
					$("#logonExtra").slideToggle("slow");
				});
				$("#cancelar").click(function(){
					$("#logonExtra").slideUp("slow")
				})
			});
		</script>
	</head>
	
	<body>
		<div id="wrap">				
			<div id="logon">
				<table width="100%" cellpadding="7">				
					<tr>
						<td align="left"><b>Bem-vindo! <% if(erros!=null){%>
						                                   <%=erros %>
						                                <% } %>
						                                <% if(usuario!=null){%>
						                                   <a href="PaginaUsuario?cod=<%=usuario.getId()%>"><%="Usuário: "+usuario.getNome() %></a>
						                                <% } %></b></td>
						<td align="right"><% if(usuario==null){ %><input onclick="window.open('cadastro.jsp','_self');" type="button" value="Cadastre-se"> <input id="logar" type="button" value="Entrar"></td><% } %>
					</tr>
				</table>
			</div>		
			<% if(usuario==null){ %>
			<div id="logonExtra">
			    <form action="Login" method="POST">
				<center>
						<table>
							<tr height="50px">
								<td align="center" colspan="2"><b>Entre e troque!</b><tb> 
							</tr>
								<tr>
									<td align="right"><font size=2>MATR&Iacute;CULA:</font></td>
									<td><input name="login" type="text"></td>
								</tr>
								<tr>
									<td align="right"><font size=2>SENHA:</font></td>
									<td><input name="senha" type="password"></td>
								</tr>
							<tr height="50px">
								<td align="center" colspan="2"><input type="submit" value="Confirmar"> <input id="cancelar" type="button" value="Cancelar"></td>
							<tr>
						</table>
				</center>
				</form>
			</div>
			<% } %>
			
			<div id="logo">
			        <form action="BuscarItens" method="POST">
					<input name="busca" title="Buscar" type="text">
					<select name="cat">
						<option value="0">Todos</option>
						<option value="1">Livro</option>
						<option value="4">Apostila</option>
						<option value="2">CD</option>
						<option value="3">DVD</option>
						<option value="5">Outros</option>
					</select>
					<input type="submit" value="Buscar">
					</form>
			</div>			
			
			<div id="conteudo">		
				<strong>
					<p align="center">
						<font color="#0000ff" size="5">
							Troca <font color="#808080">ou</font> <font color="#ff0000">n&atilde;o Troca</font> <font color="#808080">?</font>
						</font>
					</p>
					<br>
					<p align=center>
						<font color="#0099ff" size="3" style="font-size: 13pt">
							Site desenvolvido na disciplina de Engenharia de Software, do curso de
							Ci&ecirc;ncia da Computa&ccedil;&atilde;o, com tem a inten&ccedil;&atilde;o
							de desenvolver os conhecimentos na gerencia de projetos de software.
						</font>
					</p>
					<p align=center>
						<font color="#0099ff" size="3" style="font-size: 13pt">
							O site tem como objetivo promover a intera&ccedil;&atilde;o dos alunos
							da UERJ atrav&eacute;s de um sistema web para troca de itens.
						</font>
					</p>
				</strong>
				<br>
				<br>
				<center>
					<table>
						<tr>
							<td align="center" width="150px"><a href="http://www.uerj.br/"><img src="imagens/logouerj.png" name="uerj" height="118px" width="107px" border="0"/></a></td>
							<td align="center" width="150px"><a href="http://www.ime.uerj.br/"><img src="imagens/logoime.png" name="ime" height="95px" width="127px" border="0"/></a></td>
						</tr>
					</table>
				</center>
			</div>			
			
			<div id="news">
				<table>
					<tr>
						<th>&Uacute;ltimos Usu&aacute;rios</th>
					</tr>
					<tr>
						<td><a href="#">Francisco de Paula</a></td>
					</tr>
					<tr>
						<td><a href="#">Camilla Jacinto</a></td>
					</tr>
					<tr>
						<td><a href="#">Luiz Felipe Manso</a></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><hr align="center" width="50%"></td>
					</tr>
					<tr>
						<th> &Uacute;ltimos Itens</th>
					</tr>
					<tr>
						<td><a href="#">Livro - Fim do Jogo</a></td>
					</tr>
					<tr>
						<td><a href="#">DVD - Bastardos Inglórios</a></td>
					</tr>
					<tr>
						<td><a href="#">CD - Emanuel</a></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><hr align="center" width="50%"></td>
					</tr>
					<tr>
						<th>&Uacute;ltimos Trocas</th>
					</tr>
					<tr>
						<td><a href="#">Felipe trocou com Camilla</a></td>
					</tr>
					<tr>
						<td><a href="#">Francisco trocou com Luiz</a></td>
					</tr>
					<tr>
						<td><a href="#">Camilla cancelou troca</a></td>
					</tr>
				</table>
			</div>
			
			<div id="rodape">
					<table width="100%" cellpadding="2">
						<tr>						
							<td align="center" width="300px">Termo de Uso</td>
							<td align="center" width="300px">Pol&iacute;tica de Privacidade</td>
							<td align="center" width="300px">Ajuda</td>
							
						</tr>
					</table>
			</div>
		</div>
	</body>
</html>

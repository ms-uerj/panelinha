<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String erro = (String) request.getAttribute("erro");
   Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
   
<html>
	<head>
		<title>Cadastro de Itens</title>
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
				
			});
		</script>
	</head>
	
	<body>
		<div id="wrap">				
			<div id="logon">
				<table width="100%" cellpadding="7">				
					<tr>
						<td align="left"><b>Bem-vindo! <%="Usuário: "+usuario.getNome() %></b></td>
						<td align="right"><input onclick="window.open('PaginaUsuario?cod=<%=usuario.getId()%>','_self');" type="button" value="Perfil"> <input type="button" value="Sair"></td>
					</tr>
				</table>
			</div>		
			
			<div id="logo">
					<input name="busca" title="Buscar" type="text">
					<select>
						<option value="todos">Todos</option>
						<option value="livro">Livro</option>
						<option value="apostila">Apostila</option>
						<option value="cd">CD</option>
						<option value="dvd">DVD</option>
						<option value="outros">Outros</option>
					</select>
					<input type="button" value="Buscar">
			</div>			
			
			<div id="conteudoCadastroItem">
<% if(erro!=null){ %>
<%=erro %>
<% } %>

<% if(usuario!= null){ %>

<form method="POST" action="CadastrarItem">
<b>
 Título:<br>
<input type="text" name="titulo" size="40"><br><br>

Url da imagem:<br>
<input type="text" name="imagem" size="60"><br><br>

Categoria: <select name="categoria">
                <option value="1">Livro</option>
                <option value="2">CD</option>
                <option value="3">DVD</option>
                <option value="4">Apostila</option>
                <option value="5">Outros</option>
            </select><br><br>

Descrição: <br>
<textarea rows="5" cols="80" name="descricao"></textarea><br><br>

<input type="submit" value="Cadastrar Item">
</form>
<% } else{ %>
É necessário estar logado para cadastrar novos itens em nosso sistema de trocas.
<% } %>
	
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
   String erros = (String) session.getAttribute("erros"); 
   Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
   
<html>
	<head>
		<title>Cadastre-se</title>
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
						<td align="left"><b>Bem-vindo! 
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
			
			<div id="conteudoCadastroItem">

<body>
<h2>Cadastro de Usuario | <a href="index.jsp">Home</a></h2>
<HR>
<% if(erros != null){%>
<%=erros %>
<% } %>
<h2>Dados Pessoais</h2>
<form method="post" action="CadastrarUsuario">

<pre><b>      Nome <input type="text" maxlength="50" name="nome" > Sobrenome <input type="text" maxlength="50" name="sobrenome"><br>
      E-mail <input type="text" maxlength="35" name="email"> <br>
      Sexo <select name="sexo">
                      <option value="Masculino">Masculino</option>
                      <option value="Feminino">Feminino</option>
                   </select><br> 
      Área do Curso:<select name="area">
                      <option value="1">Humanas</option>
                      <option value="2">Exatas</option>
                      <option value="3">Biológicas</option>
                   </select><br>
</b></pre>

<HR>

<h2>Dados de Acesso</h2>
<pre>      <b>Matrícula <input type="text" maxlength="12" name="matricula"> <br>
           Senha <input type="password" maxlength="10" name="senha"> <small>   Senha de 6 a 10 digitos </small> <br>
 Confirmar Senha <input type="password" maxlength="10"name="confirmacao"> <br> <br> </b>
</pre>

<br><br>
<pre>  <input type="submit" value="Finalizar Cadastro">             <input type="reset" value="Apagar Campos">  </pre>                    
</form>

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
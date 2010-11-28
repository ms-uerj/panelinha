<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*, java.text.SimpleDateFormat, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<% Usuario u2 = (Usuario) request.getAttribute("usuario");
   Usuario u1 = (Usuario) session.getAttribute("usuario");
   Usuario usuario = (Usuario) session.getAttribute("usuario");
   Item i2 = (Item) request.getAttribute("item");
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens");
   
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy"); %>



<html>
	<head>
		<title>Troca em Andamento</title>
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

<h2><b>Troca em andamento</b></h2><hr> 

Você se mostrou interessado no(a) <a target="main" href="PaginaItem?cod=<%=i2.getId() %>"><%=i2.getCategoria().getDescricao() %> <%=i2.getTitulo() %></a> 
do usuário <a target="main" href="PaginaUsuario?cod=<%=u2.getId() %>"><%=u2.getNome() %></a>
<br><br>

<img width="100" height="100" src="<%=i2.getImagem() %>"><br><br>

Selecione um de seus itens para trocar pelo item acima. Lembrando que ainda será necessário que <a target="main" href="PaginaUsuario?cod=<%=u2.getId() %>"><%=u2.getNome() %></a> aceite sua proposta.
<br><br>
<form action="NovaTroca" method="post">
<table border="1">
<tr>
<td></td>
<td>Título</td>
<td>Categoria</td>
<td>Data de Cadastro</td>
<tr>

<% Iterator iterator = itens.iterator();
   while (iterator.hasNext()){ 
      Item item = (Item) iterator.next(); 
      if(item.getStatus()==1){
	  	String dti = formatador.format(item.getDataCadastro().getTime());
%>
      
<tr>
<td><input type="radio" name="item1" value="<%=item.getId() %>" SELECTED></td>
<td><a href="PaginaItem?cod=<%=item.getId() %>"><%=item.getTitulo() %></a></td>
<td><%=item.getCategoria().getDescricao() %></td>
<td><%=dti %></td>
<tr>

<%} } %>
</table>
<br><br>
<input type="hidden" value="<%=u2.getId() %>" name="user2">
<input type="hidden" value="<%=i2.getId() %>" name="item2">

<input type="submit" value="Confirmar">
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
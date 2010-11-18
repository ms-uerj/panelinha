<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Item, model.Usuario" %>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens");
   Usuario usuario = (Usuario) session.getAttribute("usuario"); 
   String palavra = (String) request.getAttribute("busca");
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy"); %>
   
<html>
	<head>
		<title>Busca</title>
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

<h3>Busca de Itens</h3><br>
<%=itens.size() %> Resultados encontrados na busca por "<%=palavra %>"<br><br> 

<table border="0">
<% Iterator iterator = itens.iterator();
   while (iterator.hasNext()){ 
      	Item item = (Item) iterator.next(); 
	  	String dti = formatador.format(item.getDataCadastro().getTime());
%>

<tr>
<td width="101"><br><br><a href="PaginaItem?cod=<%=item.getId()%>"><img src="<%=item.getImagem() %>" width="100" height="100" border="1"></a><br><br><br></td>
<td><b>Título:</b> <a href="PaginaItem?cod=<%=item.getId()%>"><%=item.getTitulo() %></a><br><b>Descrição:</b> <%=item.getDescricao() %></td>
</tr>

<% } %>
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
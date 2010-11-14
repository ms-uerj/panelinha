<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% Item item = (Item) request.getAttribute("item"); 
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
%>

<html>
	<head>
		<title><%=item.getTitulo() %></title>
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
						<td align="left"><b>Bem-vindo Nome</b></td>
						<td align="right"><input type="button" value="Perfil"> <input type="button" value="Sair"></td>
					</tr>
				</table>
			</div>		
			
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
 <h2>Página do Item | <a href="index.jsp">Home</a></h2>
<hr> 
<br><br>

<img border="1" width="250" height="300" src="<%=item.getImagem() %>"><br><br>

<b>Título: </b><%=item.getTitulo() %><br>
<b>Categoria: </b><%=item.getCategoria().getDescricao() %><br>
<b>Data de cadastro: </b><%=formatador.format(item.getDataCadastro().getTime()) %><br><br>

<a href="PaginaUsuario?cod=<%=item.getDono() %>">Perfil do Dono &raquo;</a><br><br>

<% if(item instanceof Livro){ 
      Livro livro = (Livro) item; %>
      
<b>Autor: </b><%=livro.getAutor() %><br>
<b>Edição: </b><%=livro.getEdicao() %><br>
<b>Editora: </b><%=livro.getEditora() %><br>

<% } else {
       if(item instanceof Apostila){ 
         Apostila ap = (Apostila) item; %>
      
<b>Autor: </b><%=ap.getAutor() %><br>

<%    } else {
          if(item instanceof Cd){ 
             Cd cd = (Cd) item; %>
             
<b>Artista: </b><%=cd.getArtista() %><br>
<b>Genero: </b><%=cd.getGenero() %><br>
<b>Gravadora: </b><%=cd.getGravadora() %><br>

<%    } else {
          if(item instanceof Dvd){ 
             Dvd dvd = (Dvd) item; %>
             
<b>Genero: </b><%=dvd.getGenero() %><br>

<% } } } }%>

<b>Descrição: </b><%=item.getDescricao() %><br><br>

<% Usuario usuario = (Usuario) session.getAttribute("usuario");
   
   if(usuario!=null){
       if(usuario.getId()!=item.getDono()){ %>
        
        <form action="IniciarTroca" method="post">
           <input type="hidden" name="item" value="<%=item.getId() %>">
           <input type="submit" value="Iniciar Troca">
        </form>
     <% } } %>
            

      

	
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
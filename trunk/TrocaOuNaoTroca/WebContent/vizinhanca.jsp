<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario, java.util.ArrayList, java.util.Iterator, model.Item" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% Usuario usuario = (Usuario) session.getAttribute("usuario");
   ArrayList<Usuario> vizinhos = (ArrayList<Usuario>) request.getAttribute("vizinhos"); 
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens");
   
%>
<html>
	<head>
		<title>Vizinhanca</title>
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
			
<h3> Seus Vizinhos</h3>

<% if(vizinhos!=null){
      Iterator<Usuario> ivizinhos = vizinhos.iterator();
      
      while(ivizinhos.hasNext()){
         Usuario u2 = ivizinhos.next(); %>
<a href="PaginaUsuario?cod=<%=u2.getId() %>"><%=u2.getNome() %> <%=u2.getSobrenome() %></a><br><br>
<%     }
   }else{  %>
   Por enquanto você não possui vizinhos, aguarde novas recomendações.
<% } %>

<h3> Itens Recomendados</h3>

<% Iterator iterator = itens.iterator();
   while (iterator.hasNext()){ 
      	Item item = (Item) iterator.next();
%>
      

<a href="PaginaItem?cod=<%=item.getId() %>"><img src="<%=item.getImagem() %>" width="100" height="100"><br>
<%=item.getCategoria().getDescricao() %> <%=item.getTitulo() %></a><br><br>


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
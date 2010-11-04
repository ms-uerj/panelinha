<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="model.Usuario, model.Item, model.Troca" %>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<% Usuario usuario = (Usuario) request.getAttribute("usuario");
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens");
   ArrayList<Troca> trocasAbertas = (ArrayList<Troca>) request.getAttribute("trocasAbertas");
   ArrayList<Troca> trocasFechadas = (ArrayList<Troca>) request.getAttribute("trocasFechadas");
    %>
    
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
<h2><b>Dados do usuário | <a href="index.jsp">Home</a> | <a href="cadastrarItem.jsp">Novo Item</a></h2>
<hr> 
<br><br>

<% SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
   if(usuario!=null){ 
    	 String dtu = formatador.format(usuario.getData_cadastro().getTime());
%>
<b>Nome: </b><%=usuario.getNome() %> <%=usuario.getSobrenome() %><br><br>
<b>Email: </b><%=usuario.getEmail() %><br><br>
<b>Sexo: </b><%=usuario.getSexo() %><br><br>
<b>Usuário desde: </b><%=dtu %><br><br>
<b>Área: </b><%=usuario.getArea() %><br><br><br>

<h3>Galeria de itens para troca</h3><hr>

<table border="1" width='60%'>
<tr>
<td>Título</td>
<td>Categoria</td>
<td>Data de Cadastro</td>
<tr>

<% Iterator iterator = itens.iterator();
   while (iterator.hasNext()){ 
      	Item item = (Item) iterator.next(); 
	  	String dti = formatador.format(item.getDataCadastro().getTime());
%>
      
<tr>
<td><a href="PaginaItem?cod=<%=item.getId() %>"><%=item.getTitulo() %></a></td>
<td><%=item.getCategoria().getDescricao() %></td>
<td><%=dti %></td>
<tr>

<% } %>
</table>


<% Usuario logado = (Usuario) session.getAttribute("usuario");
   
   if(logado!=null){
       if(logado.getId()==usuario.getId()){ %>
       
<h3>Trocas em aberto</h3><hr>

<table border="1" width='60%'>
<tr>
<td>Código</td>
<td>Quem iniciou</td>
<td>Quem deu a resposta</td>
<td>Data de Início</td>
<tr>

<% Iterator iteratorTrocasAbertas = trocasAbertas.iterator();
   while (iteratorTrocasAbertas.hasNext()){ 
      	Troca troca= (Troca) iteratorTrocasAbertas.next(); 
	  	String dti = formatador.format(troca.getDataPedido().getTime());
%>
      
<tr>
<td><a href="PaginaTroca?cod=<%=troca.getId() %>"><%=troca.getId() %></a></td>
<td><a href="PaginaUsuario?cod=<%=troca.getUsuario1().getId() %>"><%=troca.getUsuario1().getNome() %></a></td>
<td><a href="PaginaUsuario?cod=<%=troca.getUsuario2().getId() %>"><%=troca.getUsuario2().getNome() %></a></td>
<td><%=dti %></td>
<tr>

<% } %>
</table>
        
        
<% } } %>





<h3>Histórico de Trocas</h3><hr>

<table border="1" width='60%'>
<tr>
<td>Código</td>
<td>Quem iniciou</td>
<td>Quem deu a resposta</td>
<td>Data de Início</td>
<td>Status</td>
<tr>

<% Iterator iteratorTrocasFechadas = trocasFechadas.iterator();
   while (iteratorTrocasFechadas.hasNext()){ 
      	Troca troca= (Troca) iteratorTrocasFechadas.next(); 
	  	String dti = formatador.format(troca.getDataPedido().getTime());
	  	String status = "";
	  	if(troca.getStatus()== 2){
	  	    status = "Concluída";
	  	}else{
	  	    status = "Cancelada";
	  	}
	  	  
%>
      
<tr>
<td><a href="PaginaTroca?cod=<%=troca.getId() %>"><%=troca.getId() %></a></td>
<td><a href="PaginaUsuario?cod=<%=troca.getUsuario1().getId() %>"><%=troca.getUsuario1().getNome() %></a></td>
<td><a href="PaginaUsuario?cod=<%=troca.getUsuario2().getId() %>"><%=troca.getUsuario2().getNome() %></a></td>
<td><%=dti %></td>
<td><%=status %></td>


<tr>

<% } %>
</table>



<% }else{ %>
<%=request.getAttribute("erro") %>
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
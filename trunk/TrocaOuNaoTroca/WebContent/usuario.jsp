<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario, model.Item" %>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<% Usuario usuario = (Usuario) request.getAttribute("usuario");
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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

<table border="1">
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




<% }else{ %>
<%=request.getAttribute("erro") %>
<% } %>

</table>

</body>
</html>
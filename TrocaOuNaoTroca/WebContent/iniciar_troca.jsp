<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*, java.text.SimpleDateFormat, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<% Usuario u2 = (Usuario) request.getAttribute("usuario");
   Usuario u1 = (Usuario) session.getAttribute("usuario");
   Item i2 = (Item) request.getAttribute("item");
   ArrayList<Item> itens = (ArrayList<Item>) request.getAttribute("itens");
   
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy"); %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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


</body>
</html>
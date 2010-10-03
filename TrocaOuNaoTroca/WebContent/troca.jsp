<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario, model.Item, model.Troca" %>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<%
   Troca troca = (Troca) request.getAttribute("troca");
   Usuario user1 = troca.getUsuario1();
   Usuario user2 = troca.getUsuario2();
   
   ArrayList<Item> itens = troca.getItens(); %>
   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Troca nº <%=troca.getId() %></title>
</head>
<body>
<center>
<h2><b>Dados da Troca | <a href="index.jsp">Home</a></h2>
<hr>

<h3><b>Usuários envolvidos:<b></h3>

<% Iterator iterator = itens.iterator();
   String itens1 = "";
   String itens2 = "";
   while (iterator.hasNext()){ 
      	Item item = (Item) iterator.next();
      	if(item.getDono()==user1.getId()){
      		itens1 += "<a href='PaginaItem?cod="+item.getId()+"'><img width='100' height='100' src='"+ item.getImagem_item()+ "'></a> ";
      	}
      	else{
      	    itens2 += "<a href='PaginaItem?cod="+item.getId()+"'><img width='100' height='100' src='"+ item.getImagem_item()+"'></a> ";
      	}
   }
%>
<b><a href="PaginaUsuario?cod=<%=user1.getId()%>"><%=user1.getNome()%> <%=user1.getSobrenome()%></a></b><br><br>
itens na troca:<br>
<%=itens1 %> 
<br><br>
<b><a href="PaginaUsuario?cod=<%=user2.getId()%>"><%=user2.getNome()%> <%=user2.getSobrenome()%></a></b><br><br>
itens na troca:<br>
<%=itens2 %> 
<br><br><br>

<% Usuario logado = (Usuario) session.getAttribute("usuario");
   if(logado!=null){
       if(logado.getId()==user2.getId()){ %>

<hr>
<form action="AceitarTroca" method="POST">
<input type="hidden" value="<%=troca.getId() %>">
<input type="submit" value="Aceitar Troca">
</form>
<hr>
<form action="CancelarTroca" method="POST">
<input type="hidden" value="<%=troca.getId() %>">
<input type="submit" value="Cancelar Troca">
</form>

   <% }  }%> 
</center>

</body>
</html>
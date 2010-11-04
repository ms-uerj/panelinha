<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario, model.Item, model.Troca, model.Mensagem" %>
<%@ page import="java.util.Iterator, java.util.ArrayList, java.text.SimpleDateFormat" %>

<%
   Troca troca = (Troca) request.getAttribute("troca");
   Usuario user1 = troca.getUsuario1();
   Usuario user2 = troca.getUsuario2();
   
   ArrayList<Item> itens = troca.getItens(); 
   ArrayList<Mensagem> msgs = troca.getMensagens();
   
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");%>
   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Troca nº <%=troca.getId() %></title>
</head>
<body>

<h2><b>Dados da Troca | <a href="index.jsp">Home</a></b></h2>
<hr>

Código da Troca: <%=troca.getId() %><br>

<% String status = "";
   switch(troca.getStatus()){
       case 1:
           status = " Em aberto";
           break;
       case 2:
           status = " Concluída";
           break;
       case 3: 
           status = " Cancelada";
           break;
   }
%>  

Status:<%=status %> <br>    

Data de início: <%=formatador.format(troca.getDataPedido().getTime()) %><br>

Data de fim: 
<% if(troca.getDataFim()!=null){ %>
<%=formatador.format(troca.getDataFim().getTime()) %>
<% }else{ %>
--/--/----
<% } %>
<br>

<h3><b>Usuários envolvidos:</b></h3>

<% Iterator iterator = itens.iterator();
   String itens1 = "";
   String itens2 = "";
   while (iterator.hasNext()){ 
      	Item item = (Item) iterator.next();
      	if(item.getDono()==user1.getId()){
      		itens1 += "<a href='PaginaItem?cod="+item.getId()+"'><img width='100' height='100' src='"+ item.getImagem()+ "'></a> ";
      	}
      	else{
      	    itens2 += "<a href='PaginaItem?cod="+item.getId()+"'><img width='100' height='100' src='"+ item.getImagem()+"'></a> ";
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
   if(logado!=null && troca.getStatus()==1){
       if(logado.getId()==user2.getId()){ %>

<hr>
<form action="AceitaTroca" method="POST">
<input type="hidden" name="id_troca" value="<%=troca.getId() %>">
<input type="submit" value="Aceitar Troca">
</form>
<% } %>
<hr>
<form action="CancelarTroca" method="POST">
<input type="hidden" name="id_troca" value="<%=troca.getId() %>">
<input type="submit" value="Não Troca">
</form>

<% } %>
<h3><b>Mensagens</b></h3>
<hr>
<%
 Iterator iteratorMsg = msgs.iterator();

   while (iteratorMsg.hasNext()){ 
      	Mensagem msg = (Mensagem) iteratorMsg.next();%>
<b>De:</b> <%=msg.getRemetente().getNome() %> - <b>Para:</b> <%=msg.getDestinatario().getNome() %> - <%=formatador.format(msg.getDataEnvio().getTime()) %>
<br><br>
<b>Texto:</b> <%=msg.getTexto() %>
<br>
<hr>
<% } 
   if(logado!=null && troca.getStatus()==1 
      && (logado.getId()==user1.getId() || logado.getId()==user2.getId())){ 
      
      int destinatario;
      
      if(logado.getId()==user1.getId()){
         destinatario = user2.getId();
      }else{
         destinatario = user1.getId();
      }
      
      
      
      %>
<form action="NovaMensagem" method="POST">
<br>
<b>Nova Mensagem:</b><br>
<textarea name="texto" rows="5" cols="80"></textarea><br>
<input type="hidden" name="idTroca" value="<%=troca.getId() %>">
<input type="hidden" name="usuario1" value="<%=logado.getId() %>">
<input type="hidden" name="usuario2" value="<%=destinatario %>">
<input type="submit" value="Enviar Mensagem">
<% } %>
   
 


</body>
</html>
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
		<title>Troca nº <%=troca.getId() %></title>
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
<input type="submit" value="Cancelar Troca">
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% Item item = (Item) request.getAttribute("item"); 
   SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=item.getTitulo() %></title>
</head>
<body>

<h2>Página do Item | <a href="index.jsp">Home</a></h2>
<hr> 
<br><br>

<img width="250" height="300" src="<%=item.getImagem() %>"><br><br>

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
            

      
</body>
</html>
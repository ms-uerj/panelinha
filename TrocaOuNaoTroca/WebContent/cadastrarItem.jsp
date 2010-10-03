<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String erro = (String) request.getAttribute("erro");
   Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Itens</title>
</head>
<body>

<h1>Cadastro de Itens | <a href="index.jsp">Home</a></h1>
<HR>
<% if(erro!=null){ %>
<%=erro %>
<% } %>

<% if(usuario!= null){ %>

<form method="post" action="CadastrarItem">

<b>

Título:<br>
<input type="text" name="titulo" size="40"><br><br>

Url da imagem:<br>
<input type="text" name="imagem" size="60"><br><br>

Categoria: <select name="categoria">
                <option value="1">Livro</option>
                <option value="2">CD</option>
                <option value="3">DVD</option>
                <option value="4">Apostila</option>
                <option value="5">Outros</option>
            </select><br><br>

Descrição: <br>
<textarea rows="5" cols="80" name="descricao"></textarea><br><br>

<input type="submit" value="Cadastrar Item">
<form>

<% } else{ %>
É necessário estar logado para cadastrar novos itens em nosso sistema de trocas.
<% } %>

</body>
</html>
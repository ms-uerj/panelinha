<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
   String erros = (String) session.getAttribute("erros"); 
%>
   
<html>
<head>
<title>Cadastro de Usuarios</title>
</head>

<body>
<h2>Cadastro de Usuario | <a href="index.jsp">Home</a></h2>
<HR>
<% if(erros != null){%>
<%=erros %>
<% } %>
<h2>Dados Pessoais</h2>
<form method="post" action="CadastrarUsuario">

<pre><b>      Nome <input type="text" maxlength="50" name="nome" > Sobrenome <input type="text" maxlength="50" name="sobrenome"><br>
      E-mail <input type="text" maxlength="35" name="email"> <br>
      Sexo <select name="sexo">
                      <option value="Masculino">Masculino</option>
                      <option value="Feminino">Feminino</option>
                   </select><br> 
      Área do Curso:<select name="area">
                      <option value="1">Humanas</option>
                      <option value="2">Exatas</option>
                      <option value="3">Biológicas</option>
                   </select><br>
</b></pre>

<HR>

<h2>Dados de Acesso</h2>
<pre>      <b>Matrícula <input type="text" maxlength="12" name="matricula"> <br>
           Senha <input type="password" maxlength="10" name="senha"> <small>   Senha de 6 a 10 digitos </small> <br>
 Confirmar Senha <input type="password" maxlength="10"name="confirmacao"> <br> <br> </b>
</pre>

<br><br>
<pre>  <input type="submit" value="Finalizar Cadastro">             <input type="reset" value="Apagar Campos">  </pre>                    
</form>
</body>
</html>
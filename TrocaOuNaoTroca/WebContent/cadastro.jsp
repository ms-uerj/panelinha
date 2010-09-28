<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
   String erros = (String) session.getAttribute("erros"); %> 
   
<html>
<head></head>

<body>
<h1>Cadastro de Usuario</h1>

<HR>
<% if(erros != null){%>
<%=erros %>
<% } %>

<h2>Dados de Acesso</h2>
<form method="post" action="CadastrarUsuario">
<pre>      <b>Seu e-mail <input type="text" maxlength="35" name="email" value="<%=request.getAttribute("email") %>"> <br>
           Senha <input type="password" maxlength="10" name="senha"> <small>   Senha de 6 a 10 digitos </small> <br>
 Confirmar Senha <input type="password" maxlength="10"name="confirmacao"> <br> <br> </b>
</pre>
<HR>


<h2>Dados Pessoais</h2>

<pre><b>      Nome <input type="text" maxlength="50" name="nome" value="<%=request.getAttribute("email") %>"> <br>
Sobrenome <input type="text" maxlength="50" name="sobrenome" value="<%=request.getAttribute("email") %>"> <br>
              Sexo <select name="sexo">
<option value="Masculino">Masculino</option>
<option value="Feminino">Feminino</option>
</select> 
              Matrícula <input type="text" maxlength="12" name="matricula" value="<%=request.getAttribute("email") %>"> <br>
</b></pre>
<br><br>
<pre>  <input type="submit" value="Finalizar Cadastro">             <input type="reset" value="Apagar Campos">  </pre>                    
</form>
</body>
</html>
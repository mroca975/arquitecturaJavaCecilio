<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.arquitecturajava.Libro"%> 
<% 
	String isbn =request.getParameter("isbn");
	Libro libro =Libro.buscarPorClave(isbn);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Formulario Editar Libro</title>
		<link rel="stylesheet" type="text/css" href="css/formato.css"/>
		<script type="text/javascript" src="js/validacion.js"></script>
	</head>
<body>
		<form id="miformulario" action="SalvarLibro.do" onsubmit="return validacion();">
			<fieldset>
				<legend>Formulario Editar Libro</legend>
				
				<p>
					<label for="isbn">ISBN:</label> 
					<input id="isbn" type="text" name="isbn" value="<%=libro.getIsbn()%>"/>
				</p>
				<p> 
					<label for="titulo">Titulo:</label>				
					<input id="titulo" type="text" name="titulo" value="<%=libro.getTitulo()%>"/>
				</p>
				
				<p>
					<label for="categoria">Categoria:</label>			
					<input id="categoria" type="text" name="categoria" value="<%=libro.getCategoria()%>"/>
				</p>
				<p>
				<input type="submit" value="Salvar"/>				
				</p>
			</fieldset>
		</form>
</body>
</html>
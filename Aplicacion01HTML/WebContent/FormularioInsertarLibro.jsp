<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.arquitecturajava.Libro"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Formulario Libro</title>
		<link rel="stylesheet" type="text/css" href="css/formato.css"/>
		<script type="text/javascript" src="js/validacion.js"></script>
	</head>
<body>
		<form id="miformulario" action="InsertarLibro.jsp" onsubmit="return validacion();">
			<fieldset>
				<legend>Formulario alta Libro</legend>
				
				<p>
					<label for="isbn">ISBN:</label> 
					<input id="isbn" type="text" name="isbn"/>
				</p>
				<p> 
					<label for="titulo">Titulo:</label>				
					<input id="titulo" type="text" name="titulo"/>
				</p>
				
				<p>
					<label for="categoria">Categoria:</label>			
					
					<select name="catogoria">
						<option value="seleccionar">seleccionar</option>
				
					<%
						List<String> listaDeCategorias = null;
						listaDeCategorias = Libro.buscarTodasLasCategorias();
					
						for(String categoria:listaDeCategorias){%>
							<option value="<%=categoria%>">
								<%=categoria%>
							</option>
						<% } %>
					</select>					
					
						
					<!-- <input id="categoria" type="text" name="categoria"/> -->
				</p>
				
				
				
				<p>
				<input type="submit" value="Insertar"/>				
				</p>
			</fieldset>
		</form>
</body>
</html>
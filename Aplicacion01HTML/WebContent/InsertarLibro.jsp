<%@page import="com.arquitecturajava.DataBaseException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="com.arquitecturajava.Libro"%>

<%
	//1
	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String categoria = request.getParameter("categoria");
	
	//realizo la consulta usando Libro y el codigo queda mas simplificado

	Libro libro = new Libro(isbn, titulo, categoria);
	
	libro.insertar();

	response.sendRedirect("MostrarLibros.jsp");		
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
	//1
	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String categoria = request.getParameter("categoria");
	
	Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try{
		//2
		Class.forName("com.mysql.cj.jdbc.Driver");
		conexion = DriverManager.getConnection("jdbc:mysql://localhost/arquitecturajava?zeroDateTimeBehavior=convertToNull&useSSL=false&useTimezone=true&serverTimezone=UTC", 
				                               "root", "admin");
		
		sentencia = conexion.createStatement();
		
		//3
		String consultaSQL = "insert into libros (isbn, titulo, categoria) values ";
		consultaSQL += "('"+ isbn +"','"+ titulo +"','"+ categoria +"')";
		
		//4
		filas = sentencia.executeUpdate(consultaSQL);
		
		conexion.close(); //cerrando conexion
		
		response.sendRedirect("MostrarLibros.jsp");
		
	} catch (ClassNotFoundException e){
		System.out.println("Error en la carga del driver "+e.getMessage());
	} catch (SQLException e){
		System.out.println("Error accediendo a la base de datos "+e.getMessage());
	}finally{
		//5
		if(sentencia != null){
			try{
				sentencia.close();
			}catch(SQLException e){
				System.out.println("Error cerrando la conexion "+e.getMessage());
			}
		}
		if(conexion!=null){
			try{
				conexion.close();
			}catch(SQLException e){
				System.out.println("Error cerrando la conexion "+e.getMessage());
			}
		}
	}
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista de Libros</title>
	</head>
	<body>
		<% 
			Connection conexion=null;
			Statement sentencia=null;
			ResultSet rs=null;
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				//1
				conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arquitecturajava?zeroDateTimeBehavior=convertToNull&useSSL=false&useTimezone=true&serverTimezone=UTC",
						"root",
						"admin");
				sentencia=conexion.createStatement();
				
				//2
				String consultaSQL="Select isbn, titulo, categoria from libros";
				
				//3 y 4
				rs=sentencia.executeQuery(consultaSQL);
				
				//5
				while(rs.next()){%>
					
					<%=rs.getString("isbn")%>
					<%=rs.getString("titulo")%>
					<%=rs.getString("categoria")%>
					<p></p>
				<%}
				
			}catch(ClassNotFoundException e){
				System.out.println("Error en la carga del driver");
			}catch(SQLException e){
				System.out.println("Error accediendo a la base de datos "+e.getMessage());
			}finally{
				//6
				if (rs != null){
					try{
						rs.close();
					}catch(SQLException e){
						System.out.println("Error cerrando la resultset "+e.getMessage());
					}
				}
				if (sentencia != null){
					try{
						sentencia.close();
					}catch(SQLException e){
						System.out.println("Error cerrando la sentencia "+e.getMessage());
					}
				}				
				if (conexion != null){
					try{
						conexion.close();
					}catch(SQLException e){
						System.out.println("Error cerrando la conexion "+e.getMessage());
					}					
				}
			}
		%>
		<a href="FormularioInsertarLibro.jsp">Insertar Libro</a>
	</body>
</html>
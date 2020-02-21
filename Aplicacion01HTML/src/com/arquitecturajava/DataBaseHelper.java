package com.arquitecturajava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseHelper {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost/arquitecturajava?zeroDateTimeBehavior=convertToNull&useSSL=false&useTimezone=true&serverTimezone=UTC";
	private static final String USUARIO = "root";
	private static final String CLAVE = "admin";
	
	public int modificarRegistro(String consultaSQL) {
		Connection conexion = null;
		Statement sentencia = null;
		int filasAfectadas = 0;
		
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
			sentencia = conexion.createStatement();
			filasAfectadas = sentencia.executeUpdate(consultaSQL);
		}catch (ClassNotFoundException e) {
			System.out.println("Error de SQL "+e.getMessage());
		}catch (SQLException e) {
			System.out.println("Error de SQL "+e.getMessage());
		}finally {
			if (sentencia != null) {
				try {
					sentencia.close();
				}catch (SQLException e) {
					System.out.println("Error en sentencia de SQL "+e.getMessage());
				}
			}
			
			if (conexion != null) {
				try {
					conexion.close();
				}catch (SQLException e) {
					System.out.println("Error en conexion de SQL "+e.getMessage());
				}				
			}
		}
		
		return filasAfectadas;
	}
	
	public ResultSet seleccionarRegistros(String consultaSQL) {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet filas = null;
		
		try {
			Class.forName(DRIVER);
			
			conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
			
			sentencia = conexion.createStatement();
			
			filas = sentencia.executeQuery(consultaSQL);
		}catch (ClassNotFoundException e){
			System.out.println("Error Driver " + e.getMessage());
		}catch (SQLException e) {
			System.out.println("Error de SQL " + e.getMessage());
		}
		return filas;
	}
	
}

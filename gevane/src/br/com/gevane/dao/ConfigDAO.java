package br.com.gevane.dao;

import java.sql.*;

public class ConfigDAO {
	Connection conn = null;
	String banco = "gevane";
	String caminho = "jdbc:mysql://localhost:3306/";
	String usuario = "root";
	String senha = "";
	
	public Connection conectaMysql()
	{
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gevane?user=root&useTimezone=true&serverTimezone=UTC");
	            System.out.println("Connected database successfully...");           
				
			} catch (SQLException e){
				System.out.println("Caminho, senha ou usu�rios incorretos");
			}
		
		} catch (Exception e) {
				System.out.println("Tipo de Exce��o: " + e.getClass().getSimpleName() + "\n * Mensagem: " + e.getMessage()); 
			}
		return conn;
	}
	
    public void desconectaMysql() { // Fecha a conex�o com o banco de dados.
        try {
            conn.close();
        } catch (Exception e) {
        	// Caso ocorra exce��o, o tratamento ser� feito pelo m�todo chamador.
        	System.out.println(e.getMessage());
        }
    }
    
}

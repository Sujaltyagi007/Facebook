package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
	private static Connection con = null;
	
	public static Connection connect() throws ClassNotFoundException, SQLException {
		if(con == null) {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","root");
		System.out.println("Conncetion Build Successful ");
		}
		return con;
		} 

}

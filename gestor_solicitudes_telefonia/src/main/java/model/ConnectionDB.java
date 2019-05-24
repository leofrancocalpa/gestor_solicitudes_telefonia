package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
	
private static  Connection connection;
	
	public static Connection getConection() throws Exception {
		if(connection==null) {
			connection=connectToBD();
		}
		return connection;
	}
	private static Connection connectToBD() throws Exception {
		String ip="200.3.193.24";
		String puerto="1522";
		String insta="ESTUD";
		String user="P09551_1_16";
		String password="P09551_1_16_20191";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection contection=DriverManager.getConnection("jdbc:oracle:thin:@"+ip+":"+puerto+":"+insta,user,password);
		return contection;
	}

}

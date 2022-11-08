package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private  static Connection con;
  public static Connection getcon() {
	try {
		if (con==null) {
			//driverclass load
			Class.forName("com.mysql.jdbc.Driver");
			//create a connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newmycart","root","cherry"); 
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
return con;
}
}

package com.example.MallMember;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection
				("jdbc:mysql://localhost:3306","user","password");
		return con;
	}
}

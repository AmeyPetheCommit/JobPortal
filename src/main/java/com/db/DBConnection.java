package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String url = "jdbc:mysql://localhost:3306/jobPortal?useSSL=false&serverTimezone=UTC";
	private static final String user = "root";
	private static final String pass = "root";
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Found Successfully :)");
		}catch (ClassNotFoundException e) {
			System.err.println("Driver Not found T-T ! Add mysql_connector-j.jar file in WEB-INF/lib folder !!");
		}
	}
	
	public static Connection getConnection() {
        Connection con = null;

        try {
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Connected to Database Successfully.");
        } catch (SQLException e) {
            System.err.println("Database Connection Failed :(");
            e.printStackTrace();
        }

        return con;
    }
}

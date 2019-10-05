package com.poseidon.db;

import java.sql.Connection;
import java.sql.DriverManager;
//데이터베이스 접속 정보 -----> 싱글턴 패턴(static)
public class DBConnection {
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://localhost:3306/poseidon";
			con = DriverManager.getConnection(url, "poseidon", "01234567");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}

package com.poseidon.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.poseidon.db.DBConnection;
import com.poseidon.dto.BoardDTO;


public class BoardDAO {
public List<BoardDTO> select() {
	 List<BoardDTO> list = new ArrayList<BoardDTO>();
	 DBConnection dbCon = new DBConnection();
	 Connection conn= null;
	 Statement stmt = null;
	 ResultSet rs = null;
	 String sql = "SELCET * FROM user";
	 conn = dbCon.getConnection();
	 try {
		stmt = conn.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 try {
		rs = stmt.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 try {
		while (rs.next()) {
			 BoardDTO dto = new BoardDTO();
			  dto.setUser_no(rs.getInt("user_no"));
			  dto.setUser_name(rs.getString("user_name"));
			  dto.setUser_id(rs.getString("user_id"));
			  dto.setUser_pw(rs.getString("user_pw"));
			  dto.setUser_date(rs.getString("user_date"));
			  dto.setUser_auth(rs.getInt("user_auth"));
			  list.add(dto);
			 
		 }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 
	 if(rs != null)
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 if(stmt != null)
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 if(conn != null)
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
	 return list;
	 
	 
	
}
}

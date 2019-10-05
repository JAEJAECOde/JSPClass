package com.poseidon.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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

public List<HashMap<String, String>> select1(){
  
  ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
  DBConnection dbCon = new DBConnection();
  Connection conn= dbCon.getConnection();
  Statement stmt = null;
  String sql = "Select * FROM user";
  ResultSet rs = null;
  
  try {
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    while (rs.next()) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("user_no", rs.getString("user_no"));
      map.put("user_no", rs.getString("user_name"));
      map.put("user_no", rs.getString("user_id"));
      map.put("user_no", rs.getString("user_pw"));
      map.put("user_no", rs.getString("user_date"));
      map.put("user_no", rs.getString("user_auth"));
      
      list.add(map);
    }
  } catch (SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
  } finally {
    try {
      if(rs != null) {rs.close();}
      if(stmt != null) {stmt.close();}
      if(conn != null) {conn.close();}
  } catch (SQLException e) {
      e.printStackTrace();
  }
    
  }
  
  
  
  
  return list;
}
}

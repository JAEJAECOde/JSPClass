package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public String login(String id, String pw) {
      String name = null;
      DBConnection dbCon = new DBConnection();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "SELECT * FROM jae WHERE user_id = '?' AND user_pw='?';";
     // String sql1 = "SELECT * FROM jae WHERE user_id = '" +id+ "' AND user_pw='" +pw+ "';";
      //String sql2 = "str" + id + "' str";  그냥 쓰면 힘들어짐 그래서 정보가 들어가는곳을 ?으로 대채 
      //              str 'admin' str
      
      conn = dbCon.getConnection();
      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id); //첫번째 ?에 id값이 스트링으로 받는다
        pstmt.setString(2, pw); //두번째 ?에 pw값이 스트링으로 받는다
        
       rs = pstmt.executeQuery(); //select에만 excuteQuery로 받음 나머진 excute로
           if(rs.next()) {
           name = rs.getString("user_name");
           
  
           }
       
      } catch (SQLException e) {
       
        e.printStackTrace();
      }finally {
          try {
            if(rs != null) {rs.close();}
            if(pstmt != null) {pstmt.close();}
            if(conn != null) {conn.close();}
        } catch (SQLException e) {
            e.printStackTrace();
        }
          
      }
      return name;
  
   }

}


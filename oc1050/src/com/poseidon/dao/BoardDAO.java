package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.poseidon.db.DBConnection;
import com.poseidon.dto.BoardDTO;


public class BoardDAO {


public List<HashMap<String, String>> select(){
  
  ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
  DBConnection dbCon = new DBConnection();
  Connection conn= dbCon.getConnection();
  Statement stmt = null;
  String sql = "Select * FROM jae";
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
      String sql = "SELECT * FROM jae WHERE user_id = ? AND user_pw=?;";
     // String sql1 = "SELECT * FROM jae WHERE user_id = '" +id+ "' AND user_pw='" +pw+ "';";
      //String sql2 = "str" + id + "' str";  그냥 쓰면 힘들어짐 그래서 정보가 들어가는곳을 ?(따옴표 필요 없음)으로 대채 
      //              str 'admin' str
      
      conn = dbCon.getConnection();
      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id); //첫번째 ?에 id값이 스트링으로 받는다
        pstmt.setString(2, pw); //두번째 ?에 pw값이 스트링으로 받는다
        
       rs = pstmt.executeQuery(); //select에만 excuteQuery(인트나 불리언값들어옴)로 받음 나머진 excute로
           if(rs.next()) { //rs값을 열어봤는데 찍어줄게 있다면 << next()임 
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


public List<Map<String, String>> boardSelect(){
  List<Map<String, String>> board = new ArrayList<Map<String,String>>();
  DBConnection dbCon = new DBConnection();
  Connection conn = dbCon.getConnection();
  Statement stmt = null;
  String sql = "SELECT * FROM boardview";
  ResultSet rs = null;
  
  try {
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      while(rs.next()) {
          Map<String, String> map = new HashMap<String, String>();
          map.put("board_no", rs.getString("board_no"));
          map.put("board_title", rs.getString("board_title"));
          //map.put("board_content", rs.getString("board_content"));
          map.put("board_date", rs.getString("board_date"));
          map.put("board_count", rs.getString("board_count"));
          map.put("user_name", rs.getString("user_name"));
          board.add(map);
      }
  } catch (SQLException e) {
      e.printStackTrace();
  } finally {
      try {
          if(rs != null) {    rs.close();  }
          if(stmt != null) {  stmt.close();  }
          if(conn != null) {  conn.close();  }
      } catch (SQLException e) {
          e.printStackTrace();
      }
  }
  return board;
}

public void writeAction(BoardDTO dto) {
//저장만 해도되서 void
//글쓰기할 공간 필요요소 제목, 내용, 글쓴사람의 User_no 
  DBConnection dbCon = new DBConnection();
  Connection conn = null;
  PreparedStatement pstmt = null;
  String sql = "INSERT INTO board (board_title, board_content, user_no) "
      + "Values (?, ?, (SELECT user_no FROM jae WHERE user_id = ?))";
  
  conn = dbCon.getConnection();
  try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, dto.getBoard_title());
    pstmt.setString(2, dto.getBoard_content());
    pstmt.setString(3, dto.getUser_name()); //name이지만ID를 담겠다.
    
    pstmt.execute();
    
  } catch (SQLException e) {
    e.printStackTrace();
}
  
  
  
}


}


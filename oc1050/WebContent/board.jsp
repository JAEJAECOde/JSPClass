<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="com.poseidon.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.poseidon.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <% 
 BoardDAO dao = new BoardDAO();
 List<BoardDTO> list = dao.select();
	  

  
   %> 
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board</h1>

<table>
<tr> 
<td> 번호 </td>
<td> 이름 </td>
<td> 가입일 </td>
<td> 아이디 </td>
<td> 비밀번호 </td>
<td> 등급 </td>
</tr>
<%
  

%>


<tr>
 <td></td>

</tr>
</table>
<hr>
<c:forEach></c:forEach>  
</body>
</html>
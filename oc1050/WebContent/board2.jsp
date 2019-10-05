<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    BoardDAO dao = new BoardDAO();
    list<HashMap<String, String>> list = dao.select1();

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드2</title>
</head>
<body>
<!-- 여기에 로그인 -->
<a href="board.jsp">게시판</a>
<a href="board2.jsp">게시판</a>

길이 : <%=list.size() %> <br>


</body>
</html>
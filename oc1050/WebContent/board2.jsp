<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
    
<%
    BoardDAO dao = new BoardDAO();
    List<HashMap<String, String>> list = dao.select1();
    request.setAttribute("list1", list);
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

<% for(int i = 0; i < list.size(); i++){ %>
<%=list.get(i).get("user_no") %>
<%=list.get(i).get("user_name") %>
<%=list.get(i).get("user_id") %>
<%=list.get(i).get("user_pw") %>
<%=list.get(i).get("user_date") %>
<%=list.get(i).get("user_auth") %>
<% }%>



<hr>
<c:forEach items="${list1 } }" var="i"/>
    <tr>
        <td>${i.user_no }</td>
        <td>${i.user_name }</td>
        <td>${i.user_id }</td>
        <td>${i.user_pw }</td>
        <td>${i.user_date }</td>
        <td>${i.user_auth }</td>
      </tr>
</body>
</html>
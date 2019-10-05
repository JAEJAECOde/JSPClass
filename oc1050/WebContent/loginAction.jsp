<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <% String id = request.getParameter("name");
       String pw = request.getParameter("pw"); 
       
       System.out.println(id);
       System.out.println(pw);
       //값 확인 되면 db와 연동
       
       BoardDAO dao = new BoardDAO();
       dao.login(id, pw); //리턴타입이 스트링 스트링으로 잡아줘야함
       
       String name = dao.login(id, pw);
       
       %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %>님 반갑습니다. 
</body>
</html>
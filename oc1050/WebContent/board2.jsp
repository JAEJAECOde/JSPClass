<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDAO dao = new BoardDAO();
	List<Map<String, String>> board = dao.boardSelect();
	request.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드2</title>
<style type="text/css">
#boardbox{
	margin:0 auto;
	height: auto;
	width: 900px;
}
table {
	height: auto;
	width: 900px;
	border-collapse: collapse;
	padding-bottom: 5px;
}
th{
	background-color: #c0c0c0;
	height: 30px;
	border-bottom: 1px black solid;
}
tr{
	height: 30px;
	border-bottom: 1px gray solid;
}
tr:hover{
	background-color: #c1c1c1;
}
#t1{ width: 10%; text-align: center;}
#t2{ width: 40%;}
</style>
</head>
<body>

<c:if test="${sessionScope.name eq null }"><a href="index.jsp">로그인해주세요.</c:if>
<c:if test="${sessionScope.name ne null }">${sessionScope.name }님 반갑습니다.
      <!-- logout 확장자 없으니 서블릿 --> <a href="logout">로그아웃</a></c:if>
<hr>
<!--
교과목명		Spring 프로젝트 제작
능력단위명		Spring 프로젝트 제작
능력단위요소명	Spring 환경 구축 및 서블릿 실행환경 구축
-->
<!-- 이곳에 메뉴 만들어 넣기 -->
<div id="boardbox">
<table>	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
<c:forEach items="${board }" var="i">
	<tr>
		<td id="t1">${i.board_no }</td>
		<td id="t2">
              <a href="detail?bno=${i.board_no }">${i.board_title }</a>
              
        </td>
		<td id="t1">${i.user_name }</td>
		<td>${i.board_date }</td>
		<td id="t1">${i.board_count }</td>
	</tr>
</c:forEach>
</table>
<!-- 로그인 한 사용자만 보이게 하기 -->

<c:if test="${sessionScope.id ne null }">
	<a href="write.jsp"><img alt="글쓰기" src="write.png"> [글쓰기]</a>
	
</c:if>

</div>
</body>
</html>
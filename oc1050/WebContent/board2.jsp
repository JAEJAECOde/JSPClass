<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
    
<%
BoardDAO dao = new BoardDAO();
List<Map<String, String>> board = dao.boardSelect();
request.setAttribute("board", board);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">

table{
height: autu;
width: 900px;
border-collapse: separate;
}

tr{
height: 30px;
border-bottom:  1px gray solid;
}

#t1 :hover {
	background-color: #c0c0c0c;
}
#t2 {width: 40%]}
</style>




</head>
<body>

<!-- 로그인 했을때 안했을때 설정 -->
name : ${sessionScope.name } <br>
id : ${sessionScope.id } <br>
<c:if test="${sessionScope.name eq null }">로그인 해주세요</c:if>
<c:if test="${sessionScope.name ne null }">${sessionScope.name }님 반갑습니다.</c:if>

<!-- 여기에 로그인 -->
<c:if test="${sessionScope.id eq null }">
<a href="index.jsp">로그인</a> </c:if>
<a href="board2.jsp">다시보기</a>

<table>
  <tr>
     <td> 번호</td>
     <td> 제목</td>
     <td> 컨텐츠</td>
     <td> 날짜</td>
     <td> 조회수</td>
     <td> 회원수</td>
</tr>
<!--  메뉴바 만들곳 -->
<c:forEach items="${board }" var="i">
    <tr>
        <td id="t1">${i.board_no}</td>
        <td id="t2">${i.board_title }</td>
        <td id="t1">${i.board_content}</td>
        <td>${i.board_date }</td>
        <td id="t1">${i.board_count }</td>
        <td id="t1">${i.user_no }</td>
      </tr>
</c:forEach>
      </table>
      <!-- 로그인한 사용자만 보이게 하기 -->
      
      <c:if test="${sessionScope.id ne null }">
      <a href="write.jsp"><img alt="글쓰기" src="Img/write.png">[글쓰기]</a>
      </c:if>
      
      
</body>
</html>
<%@page import="java.util.Date"%>
<%@page import="com.poseidon.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
BoardDAO dao = new BoardDAO();
List<BoardDTO> list = dao.select();
request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>가입일</td>
			<td>등급</td>
		</tr>
<%
for(int i = 0; list.size() > i; i++){
	%>
	<tr>
		<td><%=list.get(i).getUser_no() %></td>
		<td><%=list.get(i).getUser_name() %></td>
		<td><%=list.get(i).getUser_id() %></td>
		<td><%=list.get(i).getUser_pw() %></td>
		<td><%=list.get(i).getUser_date() %></td>
		<td><%=list.get(i).getUser_auth() %></td>
	</tr>
<%
}
%>
	</table>
	
	<hr>
	
<table border="1">	
	<tr>
		<td>no</td>
		<td>name</td>
		<td>id</td>
		<td>pw</td>
		<td>date</td>
		<td>auth</td>
	</tr>
	<c:forEach items="${list }" var="i">
		<tr>
			<td>${i.user_no }</td>
			<td>${i.user_name }</td>
			<td>${i.user_id }</td>
			<td>${i.user_pw }</td>
			<td>${i.user_date }</td>
			<td>${i.user_auth }</td>
		</tr>
	</c:forEach>
</table>
<hr>
<pre>
JSTL 문법 eq, ne, lt, gt, le, ge 정리   
== 또는 eq
!= 또는 ne
< 또는 lt
> 또는 gt
<= 또는 le
>= 또는 ge
</pre>
<c:set var="number" value="123"/>
출력 : ${number }<br>
<c:out value="${number }"/>
<c:if test="${number gt 100 }">여기가 나와요</c:if>
<hr>
<c:set value="홍길동" var="str"/>
<c:if test ="${str eq '홍길동' }" >홍길동입니다.</c:if>
<hr>
<c:choose>
	<c:when test="${str ne '김길동' }"> 김길동이 아닙니다. </c:when>
	<c:when test="${str ne '이길도' }"> 이길동이 아닙니다. </c:when>
	<c:otherwise> 거짓일때 </c:otherwise>
</c:choose>
<hr>

<c:choose>
	<c:when test="${empty list }">찍을 값이 없습니다.</c:when>
	<c:otherwise>
		<c:forEach var="row" items="${list }">
			${row.user_no } /${row.user_name } / ${row.user_id } /${row.user_pw }
		</c:forEach>
	</c:otherwise>
</c:choose>
<hr>
<c:set var="date" value="<%=new Date() %>"></c:set>
<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		길이 : ${fn:length(list) }<br>
		테이블
		<fmt:formatDate value="${date }" type="date"/><br>
		<fmt:formatDate value="${date }" type="time"/><br> 
		<fmt:formatDate value="${date }" type="both"/><br> 
	</c:when>
	<c:otherwise>
		<h1>데이터가 없습니다.</h1>
	</c:otherwise>
</c:choose>

<hr>
<fmt:parseNumber var="pNum" value="3.14" integerOnly="true"/>
${pNum }
<br>
<fmt:setLocale value="ko_kr"/>
<fmt:formatNumber value="10000000" type="currency"></fmt:formatNumber>
<br>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber value="10000000" type="currency"></fmt:formatNumber>
<br>
<fmt:setLocale value="ja_jp"/>
<fmt:formatNumber value="10000000" type="currency"></fmt:formatNumber>
<br>
<fmt:formatNumber value="0.55" type="percent"></fmt:formatNumber>


</body>
</html>
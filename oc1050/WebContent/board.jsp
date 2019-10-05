<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="com.poseidon.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.poseidon.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"  %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>


 <% 
 BoardDAO dao = new BoardDAO();
 List<BoardDTO> list = dao.select();
 request.setAttribute("list", list);
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
</table>

<table border="1">
      <tr>
        <td>no</td>
        <td>name</td>
        <td>id</td>
        <td>pw</td>
        <td>date</td>
        <td>auth</td>
      </tr>
  <c:forEach items="${list }" var="i" >

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
<!-- set value를 var로 감싸는 것  -->
<!-- c에서 /마무리 안해도 되는방식   scope default : page 범위 -->
<c:set var="number" value="0123456789" scope="page"/>
출력 : $[number]<br>

<c:out value="${number }"/>
<!-- java의 if문 비슷 테스트의 값이 참이라면 텍스트가 나옴 
nuber가 100보다 크다면 '텍스트'가 출력-->
<c:if test="${number > 100 }"/>텍스트
<!-- 부등호가 태그를 마무리하는 꺽새랑 겹쳐서 다르게 사용함 
== 또는 eq
!= 또는 ne(not eq)
<  또는 lt
>  gt
<= le
>= ge
 -->
 
 <hr>
 
<c:set value="홍길동" var="str"/>
<c:if test="${str eq '홍길동' }"/> 홍길동입니다. 

<hr>
<!-- java의 ifelse 와비슷   when이 다 아니면 otherwise가 출력-->
<c:choose>
    <c:when test="${str ne '김길동' }"/> 김길동이 아닙니다.
    <c:when test="${str ne '이길도 '}"/> 이길도가 아닙니다.
    <c:otherwise/> 김길동입니다. 
</c:choose>
<hr>

<!--  choose 안에 foreach문이 들어가 list의 값을 찍어주거나 없다면 안보여줌 -->
<c:choose>
  <c:when test="${empty list }"> 찍을 값이 없습니다.</c:when>
  <c:otherwise> 
    <c:forEach var="row" items="${ list}">
      ${row.user.no }/${row.user.name }/${row.user.id }/${row.user.pw }
    </c:forEach>
  </c:otherwise>
</c:choose>


<!-- fn을 choose 안에 사용하여 length로 길이를 확인함 
그안에 formatDate를 사용하여 fmt로 날짜 대입 

 -->
<hr>
<c:set value=" <%=new Date() %>" var="date"></c:set>
<c:choose>
      <c:when test="${fn:length(list) > 0 }"> 
         테이블 
         <c:forEach items="${list }" var="i"></c:forEach>
         <fmt:formatDate value="${date }" type = "date"/>
         <fmt:formatDate value="${date }" type = "time"/><br>
         <fmt:formatDate value="${date }" type = "both"/><br>
         </c:when>
      <c:otherwise>
      <h1>데이터가 없습니다. </h1>
      </c:otherwise>
</c:choose>

<hr>
<fmt:parseNumber var="pNum" value="3.14" integerOnly="true"/>
${pNum }

<br>

<!--  지역을 정하고 돈을 원화, 달러 등 모양을 나타낼수 있음 currency로 -->

<fmt:setLocale value="ko_kr"/>
<fmt:formatNumber value="10000000" type="currency"/>
<br>
<fmt:setLocale value="en_us"/>
<fmt:formatNumber value="10000000" type="currency"/>




</body>
</html>
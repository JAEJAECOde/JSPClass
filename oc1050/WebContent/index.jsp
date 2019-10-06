<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#loginbox{
margin : 0 auto;
width: 500px;
height : 600px
}
input{

margin: 0px
padding: 0px
width : 245;
height: 30px
margin-bottom : 5px
text-align: center;
font-size: large;
color: green;
}
button{
width : 100%;
height: 50px
font-size: 16px }
button :hover {
background-color: blue;
color: white;	
}

</style>
</head>
<body>
   <div id="loginbox">
      <form action="loginAction.jsp" method="post">
        <img alt="key" src="key.png">
        <br>
        <input type="text" id="id" name="name" placeholder="아이디를 입력하세요" >
        <input type="password" name="pw" placeholder="암호를 입력하세요">
        <button type="submit">로그인</button>
     </form>
          <% if (request.getParameter("error") != null ){
            %>
            <h2 style="color:red;">잘못된 로그인입니다. 다시 시도하세요</h2>
            <%
             } 
            %>
          
   </div>
   
<a href = "board.jsp"> 게시판 </a>
<a href = "board2.jsp"> 게시판2 </a>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {
  var id = document.form.name.value; //스크립트는 다통일해서씀 문자든뭐든 //이 다큐멘트안에 폼안에 네임을 잡고있는 인풋을 가져오는것 인풋 값을 가져오는게아님! 잡는것
  //alert(id);                          // 여기서 .value까지 추가하면 값을 볼 수 있음 사용자의 입력값을 받음
  //alert(id.length);  //길이 반환
	if(id == "" || id.length <  3){ //변수가 비어있다면 또는 3보다 작다면 보여줌
	  alert("올바른 아이디를 입력해주세요");
	document.form.name.focus(); //focus는 name에 포커스 맞춘다 그창에 마우스 올려줌!
	return false;
	}
  
  var pw = document.form.pw.value;
  if(pw == "" || pw.length <  3){ //변수가 비어있다면 또는 3보다 작다면 보여줌
	  alert("올바른 암호를 입력해주세요");
	document.form.pw.focus(); //focus는 name에 포커스 맞춘다 그창에 마우스 올려줌!
	return false;
	}
}
</script>

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
      <form action="loginAction.jsp" method="post" name="form" >  <!-- form으로 로그인 눌렀을때 넘어가는거 방지 -->
        <img alt="key" src="key.png">
        <br>
        <input type="text" id="id" name="name" placeholder="아이디를 입력하세요" >
        <input type="password" name="pw" placeholder="암호를 입력하세요">
        <button type="submit" onclick="return check()">로그인</button>
        <!-- 자바스크립테서 check의 함수를 불러오게 하는것 onclick -->
     </form>
     <c:out value="${param.error}"/> <!-- error를 param으로 받으면됨  -->
     <c:if test="${ param.error ne null }">
     <h2 style="color:red;">잘못된 로그인입니다. 다시 시도하세요</h2>
     </c:if>
     <!--  위에 jstl로 하면 위처럼 밑처럼 if로 해도되지만 JSP에서 JSTL의 core를 활용하는게 더 좋음 -->
          <% //if (request.getParameter("error") != null ){ 
            %>
            
            <%
            // } 
            %>
        
   </div>
   
<a href = "board.jsp"> 게시판 </a>
<a href = "board2.jsp"> 게시판2 </a>

</body>
</html>
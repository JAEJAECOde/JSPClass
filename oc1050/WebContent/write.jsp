<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% if(session.getAttribute("id") == null || session.getAttribute("name") == null  ){ response.sendRedirect("index.jsp");
  
  
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
#writebox{
	margin: 0 auto;
	margin-top: 50px;
	height: auto;
	width: 600px;
}
input {
	margin:0;
	padding:0;
	width: 600px;
	height: 30px;
	margin-bottom: 5px;
}
textarea {
	margin:0;
	padding:0;
	width: 600px;
	height: 500px;
	margin-bottom: 5px;
}
button {
	width: 600px;
	height: 30px;
	font-size: large;
}
button:hover {
	background-color: blue;
	color: white;
}
</style>
</head>
<body>
	<div id="writebox">
		<form action="writeAction" method="post">
			<input type="text" name="title" placeholder="제목을 입력하세요"><br>
			<textarea name="content"></textarea><br>
			<button type="submit">글 쓰 기</button>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
#writebox{
height: auto;
width: 600px;
margin: 0 auto;
margin-top: 50px; 

}
input{
 width: 600px;
 height: 30px;
 padding-bottom: 5px;

}
textarea {
	width: 600px;
    height: 500px;
    margin-buttom: 5px; 
    
}
button {
	width: 600px;
    height: 30px;
}

</style>
</head>
<body>
  <div id = "writebox">
    <form action="" method="post"> <!--  action 데이터를 날라갈곳 정하기  << 서블릿 사용 -->
          <input type="text" name="title" placeholder="제목을 입력하세요"><br>
          <textarea name="content" cols=""></textarea><br>
          <button type="submit">글쓰기</button>
    </form>
  </div>
</body>
</html>
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
       //정상적인 로그인이 됬다면 html로 안서도되고 페이지 이동해줌
      //정상로그인(if)과 비정상로그인(else)를 나누어주고 페이지 설정을 response.sendRedirect로 지정해줌 
       
       if(name == null)
       { response.sendRedirect("index.jsp?error=1"); }//에러는1로 넘어감
       else {
         
         //세션을 넣어주고 게시판을 넘어가게 해줌 
         session.setAttribute("name", name); //서버에 저장되는 것 ex) 쇼핑몰 최근본상품 상품 추천하면 컴터 쿠키에 사이트가 저장되고 다른 사이에서도(구글 광고창등) 이 쿠키를 사용할 수 있음 >> 구매력 높아짐
         session.setAttribute("id", id); //이름이랑 아이디를 받아오ㅏ서 쿠키처럼 저장 
         response.sendRedirect("board2.jsp");
       }
       %>

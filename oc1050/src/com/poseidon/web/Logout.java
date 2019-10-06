package com.poseidon.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Logout() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션종료 > index.jsp로 보낼예정
	    HttpSession session = request.getSession();
	    session.invalidate(); // 모든세션 종료하는 함수 (로그인 되어있는 자신만)
	    session.removeAttribute("id");
	    session.removeAttribute("name");  //해당 세션을 종료합니다.
	    
	    //페이지 이동 
	    response.sendRedirect("index.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

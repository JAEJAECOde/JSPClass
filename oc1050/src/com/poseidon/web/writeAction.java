package com.poseidon.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/writeAction") //나에게 들어오면 서블릿을 진행하겠습니다 예전엔 x서블릿을 써야했음
public class writeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public writeAction() {
        super(); 
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doget 겟방식으로 들어왔을때 처리
	System.out.println(request.getParameter("title"));
	System.out.println(request.getParameter("content"));
	}
	//우린 데이터를 포스트로 던지니까 밑에가 먼저 됨

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  //doget 포스트방식으로 들어왔을때 처리
		doGet(request, response);
	}

}

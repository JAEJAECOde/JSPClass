package com.poseidon.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.BoardDTO;


@WebServlet("/dtail")
public class Dtail extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Dtail() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("bno")); //bno 데이터 작업 
		int number = Integer.parseInt( request.getParameter("bno"));
	  // Integer.parseInt는 23A2처럼 문자로 섞여오면 에러남 그래서 int로 바꿀때 에러가 없느냐 라는걸 따져줘야함 
		//DAO dtail 메소드 만들기 
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dto.dtail(number);
		
		 request.setAttribute("dtail", dto);
	  RequestDispatcher rd = request.getRequestDispatcher("dtail.jsp");
	  rd.forward(request, response);
	  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}

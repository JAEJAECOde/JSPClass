package com.poseidon.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.BoardDTO;


@WebServlet("/writeAction")
public class writeAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public writeAction() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("title"));
        System.out.println(request.getParameter("content"));
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter pw = response.getWriter();
        pw.println("<html>");
        pw.println("<head>");
        pw.println("<title>서블릿 통과</title>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<h1>서블릿에서 오는 값</h1>");
        pw.println("title : " + request.getParameter("title") + "<br>");
        pw.println("content : " + request.getParameter("content") + "<br>");
        pw.println("입니다.");
        pw.println("</body>");
        pw.println("</html>");
    }

	
	//데이터를 포스트로 던지니까 밑에가 먼저 됨
	
	

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      HttpSession session = request.getSession();//세션가져오기
      if( session.getAttribute("id") == null || session.getAttribute("name") == null && 
          request.getParameter("title") == null || request.getParameter("content") == null ) {
        response.sendRedirect("index.jsp");       
      }
      else {
      String title = request.getParameter("title");
      String content = request.getParameter("content");
       //doget 포스트방식으로 들어왔을때 처리하고 출력은 get방식으로 시작
      //DAO호출 -> DB작업시키기 -> 페이지이동 =>>>>> MVC 컨트롤러
      
      //DAO호출 = 데이터 입력하는 메소드 만들기
      //DAO 호출 > DB작업시키기 > 페이지 이동 으로 작업을 끝낼 수 있음 
      //이 환경은 MVC(model(dao DB접속,값주고받기), veiw(JSP와 비슷보여주기), controller(제어 ==서블릿) 프로젝트에서 MVC패턴 컨트롤러를 만들어서 사용하게됨
      //스프링에서 MVC로 구분하여 할일을 구분하고있음 
      //DAO 호출 메소드 제작 데이터입력하는 것
      BoardDAO dao = new BoardDAO();
      BoardDTO dto = new BoardDTO();
      dto.setBoard_title(title);
      dto.setBoard_content(content);
      //session사용하기 = getAtr~~
      //세션만들기
      
      
      dto.setUser_name((String) session.getAttribute("id"));
      //DAO호출해서 데이터 넘기기
      dao.writeAction(dto);
      //페이지 이동
      response.sendRedirect("board2.jsp");
      }
  }

}


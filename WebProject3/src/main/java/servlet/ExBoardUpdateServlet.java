package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BoardDao;
import Dto.BoardDto;


@WebServlet("/ExBoardUpdateServlet")
public class ExBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bdao = new BoardDao();
		BoardDto boardDto = null;
		try {
			boardDto = bdao.getBoardDtoByBno(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("boardDto", boardDto); 
		//action에서 객체를 request에 담아 보낼때 : request.setAttribute("객체명",객체);
		//즉 참조값 자체를 넘긴것인가 ? -> 맞음 
		
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardModify.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDao bDao = new BoardDao();
		try {
			bDao.modifyBoard(bno, title, content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardDetail.jsp?bno=" + bno);
		rd.forward(request, response);
		
		
		
				
	}
	

}

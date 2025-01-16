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


@WebServlet("/ExBoardUpdateServlet03")
public class ExBoardUpdateServlet03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao boardDao = new BoardDao();
		BoardDto boardDto= null;
		try {
			boardDto = boardDao.getBoardDtoByBno(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("boardDto", boardDto);
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardModify03.jsp");
		rd.forward(request,response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//update 하는 메서드를 실행 
		//form태그로 넘긴것도 다 파라미터로 받음 
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardDao boardDao = new BoardDao();
		
		try {
			boardDao.modifyBoard(bno, title, content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardList03.jsp");
		rd.forward(request, response);
	}

}

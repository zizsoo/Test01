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


@WebServlet("/ExBoardUpdateServlet04")
public class ExBoardUpdateServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	int bno = Integer.parseInt(request.getParameter("bno"));
    	BoardDao boardDao = new BoardDao();
    	BoardDto boardDto = null;
    	try {
			boardDto = boardDao.getBoardDtoByBno(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	request.setAttribute("boardDto", boardDto);
    	RequestDispatcher rd = request.getRequestDispatcher("ExBoardModify04.jsp");
    	rd.forward(request, response);
    	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		
		request.getRequestDispatcher("ExBoardList04.jsp").forward(request, response);
	}

}

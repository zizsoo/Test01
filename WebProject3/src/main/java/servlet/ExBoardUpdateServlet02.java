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


@WebServlet("/ExBoardUpdateServlet02")
public class ExBoardUpdateServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bno = Integer.parseInt(request.getParameter("bno"));
		//글작성하기와 같은 형식인 html에 제목, 내용 , 데이터 뿌려줘야함 . 
		//그러기위해서 우리는 bno 을 갖고있기에 메서드를 실행해 데이터 가져와주기 
		BoardDao boardDao = new BoardDao();
		BoardDto boardDto = null;
		try {
			boardDto = boardDao.getBoardDtoByBno(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("boardDto", boardDto);
		RequestDispatcher rd = request.getRequestDispatcher("ExBoardModify02.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

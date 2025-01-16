package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Dao.BoardDao;
import Dto.BoardDto;


@WebServlet("/ExAjaxServlet2")
public class ExAjaxServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		//System.out.println("서블릿에서 , bno = " + bno );
		BoardDao dao = new BoardDao();
		BoardDto dto = null;
		
		try {
			dto = dao.getBoardDtoByBno(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");//
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("bno", dto.getBno());
		obj.put("title", dto.getTitle());
		obj.put("content", dto.getContent());
		obj.put("writer", dto.getWriter());
		out.println(obj);
		
	}

}

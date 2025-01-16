package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

//ex " 컨텍스트패스 Ex08Servlet"  요청이 들어왔음 ( get 방식 )
@WebServlet("/Ex08Servlet") //서블릿의 주소값을 부여 : 웹브라우저의 요청을 반영하기 위해서 
public class Ex08Servlet extends HttpServlet { //HttpServlet 클래스 
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(request.getParameter("msg"));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//System.out.println(id + "," + pw);
		MemberDao mDao = new MemberDao();
		boolean result = false; //로그인 성공 여부 
		try {
			result = mDao.loginCheck(id, pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		//System.out.println(result);
		if(result == true) {
			//Ex08p2.jsp 로 이동 
			RequestDispatcher rd = request.getRequestDispatcher("Ex08p2.jsp");
			rd.forward(request, response);
		}else {
			//Ex08.jsp 로 이동 
		   request.getRequestDispatcher("Ex08.jsp?fail=true").forward(request,response);
		   //이렇게 바꿔쓸수있음 ! 
			
		}
		
		
	
	}

}

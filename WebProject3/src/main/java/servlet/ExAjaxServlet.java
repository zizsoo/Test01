package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/ExAjaxServlet")
public class ExAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("post가 들어옴");
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject(); //json-simple 라이브러리 
		obj.put("check" , "!!"); //데이터형식 
		obj.put("check2", "??");
		out.println(obj);
		
	
	
	}

}

package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext(); // 중요하지 않음
		String path = application.getRealPath("upload"); //파일이 저장될 폴더 ("upload") 의 절대경로 
		System.out.println("참고 절대경로 real path :" + path );
		
		// "upload" 폴더가 없으면 , 만들기 :
		File filePath = new File(path);
		if(!filePath.exists()) {
			//upload 폴더가 없으면
			filePath.mkdirs();
			
		}
		
		int fileLimit = 100 * 1024 * 1024; // 100 메가 바이트 : 파일 크기 제한 설정 
		MultipartRequest multi = new MultipartRequest(
				request, //요청객체 
				path, //파일 저장 경로 
				fileLimit, //파일 최대 크기 
				"UTF-8", // 파일명 한글깨짐 방지 
				new DefaultFileRenamePolicy() //기본적인 'rename' 정책 
				); // MultipartRequest 객체가 생성될 때 ! 파일저장 완료  
		
		//이제 저장된 파일에 대한 정보를 MultipartRequest 객체로 부터 뽑아냄 
		Enumeration<?> files = multi.getFileNames();
		String filename = null;
		while(files.hasMoreElements()) {
			String fileObject = (String)files.nextElement();
			filename = multi.getFilesystemName(fileObject);  // 서버에 저장된 파일 이름.
			System.out.println("filename : " + filename);
		}
		// (참고) multi.getOriginalFileName(fileObject);	// -> 웹브라우저에서 선택한 파일 이름.
		// (참고) multi.getFile(fileObject).length();	// -> 업로드한 파일 크기(바이트 단위).
		
		
		String description = multi.getParameter("desc");
		//[주의] NOT "request.getParameter .. " 
		//
		
		request.setAttribute("desc", description);
		request.setAttribute("filename", filename);
		request.getRequestDispatcher("ExUploadResult.jsp").forward(request, response);
	
	}


}

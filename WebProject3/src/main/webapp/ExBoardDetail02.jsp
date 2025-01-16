<%@page import="Dto.BoardDto"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int bno = Integer.parseInt(request.getParameter("bno"));
BoardDao boardDao = new BoardDao();
BoardDto boardDto = boardDao.getBoardDtoByBno(bno);

%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
	<script>
	function BoardList(){
		location.href="ExBoardList02.jsp";
		
	};
	function Modify(){
		location.href="ExBoardModify02.jsp?bno=<%=boardDto.getBno()%>";
	};
	function DeleteBtn(){
		let ym = confirm("정말 삭제 하시겠습니까 ?");	
		if(ym == true){
			location.href="ExBoardDeleteAction02.jsp?bno=<%=boardDto.getBno()%>"
		}
	};
	
	</script>
	</head>
<body>
<p>글 제목 : <%=boardDto.getTitle() %></p>
<p>글 내용 : <%=boardDto.getContent() %></p>
<p>글 작성자 : <%=boardDto.getWriter() %></p>
<button onclick="BoardList()">목록보기</button>
<button onclick="Modify()">수정하기</button>
<button onclick="DeleteBtn()">삭제하기</button>

</body>
</html>
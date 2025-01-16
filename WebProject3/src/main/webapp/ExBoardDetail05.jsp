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
	function clickList(){
		location.href="ExBoardList05.jsp";
	}
	function clickModify(){
		location.href="ExBoardUpdateServlet05?bno=<%=boardDto.getBno()%>";
	}
	function deleteBno(){
		let ym = confirm("정말로 삭제하실건가요 ?");
		if(ym == true){
			location.href="ExBoardDeleteAction5.jsp?bno=<%=boardDto.getBno()%>";
		}
	}
	</script>
	</head>
<body>
<h2>글 보여주기</h2>
<p><%=boardDto.getTitle() %></p>
<p><%=boardDto.getContent() %></p>
<p><%=boardDto.getWriter() %> </p>

<button onclick="clickList()">목록보기</button>
<button onclick="clickModify()">글 수정하기 </button>
<button onclick="deleteBno()">글 삭제하기 </button>

</body>
</html>
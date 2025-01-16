<%@page import="Dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

BoardDao boardDao = new BoardDao();
ArrayList<BoardDto> boardDtolist = boardDao.getAllBoardList();

%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
	<script>
	$(function(){
		$("td").click(function(){
			
			let bno = $(this).parent().find(".Bno").text();
			location.href="ExBoardDetail05.jsp?bno=" + bno;
		});
		
	});
	
	</script>
	<style>
	table {
				border-collapse: collapse;
			}
			th, td {
				padding: 8px;
				font-size: 19px;
				border: 1px solid grey;
			}
	
	
	
	</style>
	</head>
<body>
	<table>
		<tr>
			<th>글 번호 </th>
			<th>글 제목 </th>
			<th>글 작성자</th>
		</tr>
		<%for(BoardDto dto : boardDtolist){ %>
			<tr>
				<td class="Bno"><%=dto.getBno() %></td>
				<td><%=dto.getTitle() %></td>
				<td><%=dto.getWriter() %></td>
			</tr>
			
		<%}%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>

</body>
</html>
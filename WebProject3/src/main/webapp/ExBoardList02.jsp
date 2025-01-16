<%@page import="Dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	BoardDao boardDao = new BoardDao();
 	ArrayList<BoardDto> boardDtoList = boardDao.getAllBoardList();
 	
 
 
 %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
	$(function(){
		$("td").click(function(){
			let btn = $(this).parent().find(".btn").text();
			location.href="ExboardDetail02.jsp?bno="+ btn;
		});
	});
	
	function writeBtn(){
		location.href="ExBoardWrite02.jsp";
	};
	
	
	
	
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
		<th>글 번호</th>
		<th>글 제목 </th>
		<th>작성자</th>
	</tr>
	<%for(BoardDto dto : boardDtoList){
		%>
	<tr>
		<td class="btn"><%=dto.getBno() %></td>
		<td><%=dto.getTitle() %></td>
		<td><%=dto.getWriter() %></td>
	</tr>
		
	<%} %>
	
	<button onclick="writeBtn()">글 쓰기</button>
	
</table>

</body>
</html>
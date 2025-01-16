<%@page import="Dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDto boardDto = (BoardDto)request.getAttribute("boardDto");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 수정하기</h1>
	<form action="ExBoardUpdateServlet05?bno=<%=boardDto.getBno() %>" method="post">
		<input type="text" name="title" value="<%=boardDto.getTitle()%>"/> <br/>
		<textarea name="content"><%=boardDto.getContent() %></textarea>
		<input type="submit" value="작성완료"/>
	</form>

</body>
</html>
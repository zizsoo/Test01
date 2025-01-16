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
</head>
<body>
<form action="ExBoardUpdateServlet06?bno=<%=boardDto.getBno()%>" method="post">
	<input type="text" name = "title" value="<%=boardDto.getTitle()%>"/>
	<textarea type="text" name = "content"><%=boardDto.getContent() %></textarea>
	<input type="submit" value="수정하기"/>
</form>

</body>
</html>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int bno = Integer.parseInt(request.getParameter("bno"));
BoardDao boardDao = new BoardDao();
boardDao.deleteBoardByBno(bno);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("삭제되었습니다.")
location.href="ExBoardList05.jsp";

</script>
</head>
<body>

</body>
</html>
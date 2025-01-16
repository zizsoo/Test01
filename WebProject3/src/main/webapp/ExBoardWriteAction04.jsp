<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDao boardDao = new BoardDao();
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer ="js2";

boardDao.registerBoard(title, content, writer);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("저장 되었습니다.");
location.href="ExBoardList04.jsp";
</script>
</head>
<body>

</body>
</html>
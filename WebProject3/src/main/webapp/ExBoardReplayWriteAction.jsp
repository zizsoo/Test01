<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int bno = Integer.parseInt(request.getParameter("bno"));
String content = request.getParameter("content");
String writer = (String)session.getAttribute("loginId");


BoardDao boardDao = new BoardDao();
boardDao.registerReply(bno, writer, content);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("댓글이 등록되었습니다.");
location.href="ExBoardDetail.jsp?bno=<%=bno%>";

</script>
</head>
<body>

</body>
</html>
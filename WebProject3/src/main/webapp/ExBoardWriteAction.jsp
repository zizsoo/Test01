<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //post 요청에서 한글이깨지지 않게 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = "YG";  // 가정
	
	BoardDao bDao = new BoardDao();
	bDao.registerBoard(title, content, writer);
%>
<script>
	alert("게시글이 등록되었습니다.");
	location.href = "ExBoardList.jsp";
</script>
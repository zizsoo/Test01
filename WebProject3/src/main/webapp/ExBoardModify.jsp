<%@page import="Dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    BoardDto dto = (BoardDto)request.getAttribute("boardDto");
    //BoardDto 클래스의 참조값을 받아옴 
    
    if(session.getAttribute("loginId")==null){
	%>
	<script>
	alert("로그인하세요");
	location.href="ExLogin.jsp";
	</script>
	<%}%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정하기 </h1>
	<form action="" method="post">
		<input type="text" name="title" value="<%=dto.getBno()%>"/> <br/>
		<input type="text" name="title" value="<%=dto.getTitle()%>"/> <br/>
		<textarea name="content"><%=dto.getContent() %></textarea>
		<input type="submit" value="작성완료"/>
	</form>

</body>
</html>
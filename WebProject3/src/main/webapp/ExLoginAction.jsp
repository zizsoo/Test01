<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberDao memberDao = new MemberDao();
boolean result = memberDao.loginCheck(id, pw);
if(result){
	session.setAttribute("loginId",id); //맵 자료구조 키 : 벨류  
%>
	
	
	<script>
	alert("로그인되었습니다.")
	location.href="ExBoardList.jsp";
	</script>
	
	

<% 
}else{
%>
<script>
alert("로그인 실패 ");
history.back();

</script>

<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate(); //모두 지우기 
//또는 
//session.removeAttribute("loginId"); 해당 키 값만 지우기 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("로그아웃 되었습니다. 다시 로그인해주세요 ");
location.href="ExLogin.jsp";
</script>
</head>
<body>

</body>
</html>
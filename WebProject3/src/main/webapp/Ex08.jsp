<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String fail = request.getParameter("fail"); // "true"
 //이 조건문이 무조건 실행되니깐
 //fail이 null이라면 아예 두번째 조건도 따지지 않으니깐 ?
 if(fail != null && fail.equals("true")){ //fail != null ? String fail 에 null 값이 들어간다면 Exception 뜨니깐 처음부터 널을 허용하지 않겠다 ?
	 %>
	 <script>alert("로그인 정보가 잘못되었습니다.")</script> 
	 <% 
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex08Servlet" method="post">
		ID : <input type="text" name ="id"/><br/>
		PW : <input type="password" name="pw"/><br/>
		<input type="submit" value="로그인"/>
	</form>

</body>
</html>
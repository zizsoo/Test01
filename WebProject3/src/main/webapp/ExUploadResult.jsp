<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String desc = (String)request.getAttribute("desc");
	String filename = (String)request.getAttribute("filename");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<h1>이미지 설명 : ${desc }</h1>
		<%-- <%for  %> --%>
		<img src="upload/${filename}"></img>
	
	
</body>
</html>
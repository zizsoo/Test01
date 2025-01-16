<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String s1 = "Hello";
 	String s2 = "world!";
 %>
 <%
 	String s3 = "지수";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=s1 %></h2>
	<h3><%=s2 %></h3>
	<h1><%=s1+s2 %></h1>
	<h2><%=s3 %></h2>
	<%
		out.println("<h1>" + s1 + s2 + "</h1>");
	%>
</body>
</html>
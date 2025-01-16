<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//RequestDispatcher rd = request.getRequestDispatcher("b.jsp");
	//rd.forward(request, response);
	request.setAttribute("result", true);
	response.sendRedirect("b.jsp"); //웹브라우저에서 재요청하는 방식 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%-- <script>
		location.href="b.jsp";
	</script>  jsp 주석 --%> 
	<%-- <a href="b.jsp">클릭하면 ? </a>--%>
	

</body>
</html>
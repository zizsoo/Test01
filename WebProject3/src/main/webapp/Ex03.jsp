<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%//자바 코드를 쓰는 부분 
		int sum = 0;
		for(int i=0; i<=10; i++){
			out.print(i+ " ");
			if(i<10)
				out.print("+");
			else
				out.print("=");
			sum +=i;
		}
	%>
	
	<%=sum%>
	<!-- 익스프레션 자바코드의 sysout 과 같음  -->

</body>
</html>
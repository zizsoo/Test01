<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="ExBoardWriteAction.jsp" method="post">
		<input type="text" name="title"/> <br/>
		<textarea name="content"></textarea>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>





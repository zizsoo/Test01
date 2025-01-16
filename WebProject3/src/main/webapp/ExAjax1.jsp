<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
	
	$(function(){
		$("#btn1").click(function(){
			$.ajax({ 
				type:'post', 
				url : 'ExAjaxServlet' , 
				success : function(data) {
					console.log(data);
					alert(data.check); //!!
					alert(data.check2); // ??
					//alert("성공");
					},
				error :function(r,s,e) {alert("에러");}
			});
		});
	});
	</script>
</head>
<body>
	<button id="btn1">버튼 1</button>

</body>
</html>
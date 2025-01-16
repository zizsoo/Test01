<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Dao.BoardDao"%>
<%@ page import="Dto.BoardDto"%>
<%@ page import="java.util.ArrayList"%>
<%
	//int pageNum = Integer.parseInt(request.getParameter("page"));
	int pageNum=1;		
    try{
    	pageNum = Integer.parseInt(request.getParameter("page"));
    }catch(NumberFormatException e){}
    // 생각 1 : 왜 catch 영역이 빈 중괄화 { } 지 ? 비어있지 ?
    // 생각 2 : dho pageNum의 초기값을 1로 정했을까 ? 왜 0으로 안 했지 ?
    		
	BoardDao bDao = new BoardDao();
	ArrayList<BoardDto> listBoard = bDao.getBoardListByPageNumber(pageNum);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 목록보기(<%=pageNum %>) 페이지 </title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			$("td").click(function() {
				let bno = $(this).parent().find(".bno").text(); //bnoIdx 를 찾을수있음 
				//alert("상세보기 bno : " + bno);
				location.href = "ExBoardDetail.jsp?bno=" + bno; //bnoIdx를 받아 해당 상세 페이지로 이동 
			});
			$("#btn_write").click(function() {
				location.href = "ExBoardWrite.jsp";
			});
			$(".btn_logout").click(function(){
				location.href = "Exlojout.jsp";
			})
		});
		
		let current_page =1 ;// 현재 페이지 기억 
		window.onscroll = function () {
		    // @var int totalPageHeight
		    const totalPageHeight = document.body.scrollHeight;
		    // @var int scrollPoint
		    const scrollPoint = window.scrollY + window.innerHeight;
		    // check if we hit the bottom of the page
		    if (scrollPoint >= totalPageHeight) {
		        //alert("요청 페이지 : " + ++current_page);
		        current_page++;
		        
		        $.ajax({
		        	type:'post',
		        	url:'ExAjaxBoardListServlet',
		        	data : {"page_num" : current_page},
		        	success:function(obj){
		        		console.log(obj);
		        		for(let i=0; i<=obj.length-1; i++){
		        			let str = 
		        			'<tr>' + 
				    		'	<td class="bno">' + obj[i].bno + '</td>' +
				    		'		<td>' + obj[i].title + '</td>' +
				    		'		<td>' + obj[i].content + '</td>' +
				    		'</tr>';
				    		$("#table1").append(str);
		        		}
		        	},
		        	error : function(r,s,e){
		        		alert("에러 code : " + r.status + " , message : " + r.responseText + ",error: " + e); 
		        	}
		        	
		        });
		      
		    }
		}
	</script>
	<style>
		table {
			border-collapse: collapse;
		}
		th, td {
			padding: 8px;
			font-size: 19px;
			border: 1px solid grey;
		}
		#div_pagination{
			padding-left: 80px;
		}
		.no_underline{
			text-decoration:none;
		}
		.reply_cnt{
			color:red;
		}
		
	</style>
</head>
<body>
	<h1>게시글 목록보기(무한 스크롤)</h1>
	<table id="table1">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<% for(BoardDto dto : listBoard) { %>
			<tr>
				<td class="bno"><%=dto.getBno() %></td>
				<td><%=dto.getTitle()%></td>
				<td><%=dto.getWriter() %></td>
			</tr>
		<% } %>
	</table>
	
	<button id="btn_write">글쓰기</button>
	
</body>
</html>









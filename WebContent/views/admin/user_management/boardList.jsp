<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="board.model.vo.PageInfo, board.model.vo.Board, java.util.ArrayList" %>
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("bList");
	
	PageInfo pInf = (PageInfo)request.getAttribute("pInf");

	int userCount = pInf.getBoardCount();
	int currentPage = pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage = pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
%>       
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	
	   
	/* 
		.BoardListArea {
			width: 1200px;
			height: 800px;
			position: absloute;
			padding: 40px;
			margin-left: 100px;
			margin-top: 40px;
		}
 */
		.boardListTable, .boardListTable td, .boardListTable th {
		    border: 1px solid black;  
		    border-collapse: collapse;
		
		}
		.boardListTable td {
		    width: 200px;
		    height: 40px;
		    padding: 10px;
		    font-size: 17px;
		    
		}
		
		.boardListTable th {
			background-color: lightgray;
			height: 50px;
			font-weight: bold;
			font-size: 18px;
			text-align: center;
		}
		
		.pagingArea {
			margin: 30px;
		}	
		.pagingBtn{
			text-decoration: none;
			color : black;
			display : inline-block;
			width : 25px;
			height : 25px;
			font-size: 15px;
		}
		
	</style>



</head>
<body>


	<div class=BoardListArea serction_wrap">
	    <table class="boardListTable">
	        <thead>
	            <th class="boardTypeArea">게시판 이름</td>
	            <th class="titleArea">게시글 제목</td>
	            <th class="contentArea">내용</td>
	            <th class="writerArea">작성자</td>
	            <th class="createDateArea">게시일</td>
	        </tr>
			<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="5">작성된 게시글이 없습니다.</td>
			</tr>
			<% }else { %>
			
				<% for(Board b : list) { %>
				<tr>
					<td><input type="hidden" value="<%= b.getbNo()%>">
							<%= b.getbType().split(",")[1] %></td>
					<td><%= b.getbTitle() %></td>
					<td>
						<% String content = b.getbContent();
						if(content.length() > 15) { %>
						<%= content.subSequence(0, 15) %>
						<% } else { %>
						<%= content%>
						<% } %>
					</td>
					<td><%= b.getwriter().split(",")[1] %></td>
					<td><%= b.getCreateDate() %></td>
				</tr>
				<% } %>
			<% } %>
	    
	
	    </table>
	
	
		<!------- 페이징 바 ------->
		<!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/userList.ad?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(startPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/userList.ad?currentPage=<%= startPage-pagingBarSize %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/boardList.ad?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(endPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/boardList.ad?currentPage=<%= startPage+pagingBarSize %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/boardList.ad?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
		
			<script>
		$(function(){
			$("#nav_user_management a").css("color", "rgb(235, 199, 91)");
			
			
			// 유저정보 상세보기
			$(".boardListTable td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var uno = $(this).parent().children().eq(0).children().eq(0).val();
				location.href="<%= request.getContextPath() %>/detailUser.ad?uno="+uno;
			});
			
			
			// 페이징바 마우스오버 이벤트
			$(".clickBtn").mouseenter(function(){
				$(this).css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			});
		});
		
	</script>

</body>
</html>
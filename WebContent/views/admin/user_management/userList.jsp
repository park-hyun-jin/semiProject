<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="board.model.vo.PageInfo, user.model.vo.User, java.util.ArrayList"%>
    
    
<%
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	
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
	
	   .page_content {
	        width: 700px;
	        height: 900px;
	        padding: 40px;
	        padding-top: 8rem;
	        position: absloute;
	        margin-left: 350px;
	    }
	
		.userListArea {
			width: 1200px;
			height: 800px;
			position: absloute;
			padding: 40px;
			margin-left: 100px;
			margin-top: 40px;
		}

		.userListTable, .userListTable td {
		    border: 1px solid black;  
		    border-collapse: collapse;
		
		}
		.userListTable td {
		    width: 200px;
		    height: 40px;
		    padding: 10px;
		    font-size: 17px;
		    
		}
		
		.userListTable th {
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

	<%@ include file="../adminNav.jsp" %>
	
	<div class="page_content">
	<div class="userListArea">
	    <table class="userListTable">
	        <thead>
	            <th class="nicknameArea">닉네임</td>
	            <th class="nameArea">이름</td>
	            <th class="statusArea">구분</td>
	            <th class="pointArea">보유 포인트</td>
	            <th class="cashArea">보유 캐시</td>
	        </tr>
			<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="6">가입된 유저가 없습니다.</td>
			</tr>
			<% }else { %>
			
				<% for(User u : list) { %>
				<tr>
					<td><input type="hidden" value="<%= u.getuNo()%>">
							<%= u.getNickName() %></td>
					<td><%= u.getUserName() %></td>
					<td><%= u.getArtist().equals("Y")?"아티스트": "일반" %></td>
					<td><%= u.getUserPoint() %></td>
					<td><%= u.getUserCash() %></td>
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
						onclick="location.href='<%= request.getContextPath() %>/userList.ad?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(endPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/userList.ad?currentPage=<%= startPage+pagingBarSize %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/userList.ad?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
	</div>
	
	

	
	
	<script>
		$(function(){
			// 유저정보 상세보기
			$(".userListTable td").mouseenter(function(){
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.model.vo.PageInfo"%>
<%
	ArrayList<Board> SheetList = (ArrayList<Board>)request.getAttribute("SheetList");
	
	PageInfo pInf = (PageInfo)request.getAttribute("pInf");
	
	int boardCount = pInf.getBoardCount();
	int currentPage =pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage=pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
	
	
	String headValue = request.getParameter("headValue");
	String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/views/style/navNcommunity.css">
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <style>
	.table_header th:nth-of-type(1), .table_header td:nth-of-type(1){
		width: 10%;
	}
	.table1 th:nth-of-type(2), .table_header td:nth-of-type(2){
	    width: 45%;
	}
	.table_header th:nth-of-type(3), .table_header td:nth-of-type(3){
	    width: 10%;
	}
	.table_header th:nth-of-type(4), .table_header td:nth-of-type(4){
	    width: 10%;
	}
	.table_header th:nth-of-type(5), .table_header td:nth-of-type(5){
		width: 10%;
	}
	.table_header th:nth-of-type(6), .table_header td:nth-of-type(6){
		width: 15%;
	}
	
	* {
    	margin: 0;
    	padding: 0;
    }
    .pagingBtn{
		text-decoration: none;
		color : white;
		display : inline-block;
		width : 25px;
		height : 25px;
	}
	
	section {
		position: relative;
		top: 8rem;
		left: 14rem;
		width: 74%;
		height: 900px;
	}
	.pagingBtn{
		text-decoration: none;
		background-color:white;
		color:black;
		display : inline-block;
		width : 25px;
		height : 25px;
	}
	.pagingArea{
		margin : 50px 0 20px 0;
		padding-right: 100px;
	}
 
 </style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
 <!-- 본문 영역 -->
        <section class="community_content">
            <!-- 커뮤니티 게시판 -->
            <div class= "community_wrap">

                <!-- 페이지 이름 영역 -->
               <!--  <div class="commuity_header">
                    <span class="community_label"> 공지사항 </span>
                </div> -->
                <!-- 게시글 목록 -->
                <div class = "community_board_area">
                    <table align="center" class="community_table">
                        <tr class="table_header">
                            <th>말머리</th>
                            <th>제목</th>
                            <th>가격</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                         <% if(SheetList.isEmpty()){ %>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
				
					<%for(Board b : SheetList){ %>
					
						  <tr class="table_header" id="<%=b.getbNo()%>">
							<td>[<%=b.getheader() %>]</td>
							<td><%=b.getbTitle() %></td>	
							<% if(b.getDivide().equals("P")){ %>						
							<td><%=b.getnPrice()%>P</td>
							<%} else{ %>
							<td><%=b.getnPrice()%>원</td>
							<% } %>
							<td><%=b.getwriter() %></td>
							<td><%=b.getbCount() %></td>
							<td><%=b.getCreateDate() %></td>
						</tr>
					<%} %>

				<% } %> 
                    </table>
                </div>
                
                
                <!-------- 페이징 바 -------->
		<!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/sheetShare.bo?currentPage=1&headValue=<%=headValue%>&keyword=<%=keyword%>'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/sheetShare.bo?currentPage=<%= currentPage-1 %>&headValue=<%=headValue%>&keyword=<%=keyword%>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/sheetShare.bo?currentPage=<%= p %>&headValue=<%=headValue%>&keyword=<%=keyword%>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/sheetShare.bo?currentPage=<%= currentPage+1 %>&headValue=<%=headValue%>&keyword=<%=keyword%>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/sheetShare.bo?currentPage=<%= maxPage %>&headValue=<%=headValue%>&keyword=<%=keyword%>'">&gt;&gt;</span>
		</div>
                

                
                <!-- 글쓰기 버튼 -->
                <div class="community_footer">
                 <% if(loginUser != null){ %>
                    <button type = "button"class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/sheetShareWrite.fo'">글쓰기</button> 
                <%} %>
                </div>
               <!-- 검색 영역 -->
            <div class = "search_area">
                <form class = "searchForm" method="get" action="<%= request.getContextPath()%>/sheetShare.bo" name="searchForm">
					<select id="searchCondition" name="headValue">
						<option value="100">통합</option>
						<option value="1">피아노</option>
						<option value="2">기타</option>
						<option value="3">바이올린</option>
						<option value="4">플루트</option>
						<option value="5">하모니카</option>
						<option value="6">ETC</option>
					</select>
                    <input type="text" class="searchInput" name="keyword">
                    <span><button type="submit" class = "searchSubmit">검색</button></span>
                </form>
            </div>
            
            </div>
        
            

        </section>

<script>
$(function(){
	
	// 페이지 로드시 검색옵션값 설정
	<% if(headValue != null) {%>
		$("option[value=<%=headValue%>]").attr("selected", "selected");
	<% }
		if(keyword != null) { %>
		$("input[name=keyword]").val("<%=keyword%>");
	<% } %>
	
	
	// 게시판 상세보기
	$(".table_header td").mouseenter(function(){
		$(this).parent().css({"color":"black", "cursor":"pointer"});
	}).click(function(){
		var bNo = $(this).parent().attr("id");
		
		// 로그인 한 사람만 게시글 상세보기 가능
		<% if(loginUser != null){ %>
			location.href="<%= request.getContextPath() %>/sheetShareDetail.de?bNo="+bNo;
		<% } else{ %>
			alert("로그인해야만 상세보기가 가능합니다!");
		<% } %>
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
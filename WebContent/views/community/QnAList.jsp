<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.PageInfo"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Board> qnaList = (ArrayList<Board>)request.getAttribute("qnaList");
	
	PageInfo pInf = (PageInfo)request.getAttribute("pInf");
	
	int boardCount = pInf.getBoardCount();
	int currentPage =pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage=pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
%>
<!DOCTYPE html>
<html lang = "ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/views/style/community.css">
    <style>
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
	.lockImg{
		width: 20px;
		height : 20px;
	}
</style>
    </head>
    <body>
    <%@ include file="../common/nav.jsp" %>
            <aside>
                    <div class="vertical-menu">
                        <a href="#" >공지사항</a>
                        <a href="#">자유게시판</a>
                        <a href="#" class="active">Q & A</a>
                    </div>
                </aside>
        <section class="community_content">
            <!-- 커뮤니티 게시판 -->
            <div class= "community_wrap">

                <!-- 페이지 이름 영역 -->
                <div class="commuity_header">
                    <span class="community_label"> Q & A </span>
                </div>
                <!-- 게시글 목록 -->
                <div class = "community_board_area">
                    <table align="center" class="community_table">
                        <tr class="table_header">
                            <th width="10%">번호</th>
                            <th width="60%">제목</th>
                            <th width="10%">작성자</th>
                            <th width="5%">조회수</th>
                            <th width="15%">작성일</th>
                        </tr>
                <% if(qnaList.isEmpty()){ %>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
					<%for(Board b : qnaList){ %>
						  <tr class="table_header">
							<td width="10%"><%=b.getbNo() %></td>							
							<td width="60%"><img class = "lockImg" src="views/image/lock.png"><%=b.getbTitle() %></td>
							<td width="10%"><%=b.getwriter() %></td>
							<td width="5%"><%=b.getbCount() %></td>
							<td width="15%"><%=b.getCreateDate() %></td>
						</tr>
					<%} %>

				<% } %> 
                    </table>
                </div>
                <!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/qnaWrite.li?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/qnaWrite.li?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/qnaWrite.li?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/qnaWrite.li?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/qnaWrite.li?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
               <!-- 글쓰기 버튼 -->
               <div class="community_footer">
                    <button type = "button"class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/qnaWrite.fo'">글쓰기</button> 
                </div>
                  <!-- 검색 영역 -->
               <div class = "search_area">
                   <form class = "searchForm">
                       <input type="text" class="searchInput">
                       <span><button type="submit" class = "searchSubmit">검색</button></span>
                   </form>
               </div>
            </div>

        </section>
        <script>
        $(function() {
        	$(".cashCharge").addClass("active");
            
            
            $(".table_header td").mouseenter(function(){
    			$(this).parent().css({"color":"black", "cursor":"pointer"});
    		}).click(function(){
    			var bNo = $(this).parent().children().eq(0).text();
    		
    			// 로그인 한 사람, 관리자만 게시글 상세보기 가능
    			var writer = $(this).parent().children().eq(2).text();

    			<% if(loginUser != null){%>
	    			var nickname = "<%=loginUser.getNickName()%>";
	    			var uno = "<%=loginUser.getuNo()%>";
	    			if((uno == "3" || nickname == writer)) {
	    				location.href="<%= request.getContextPath() %>/qnaWrite.de?bNo="+bNo;
	    			}else{ 
	    				alert("관리자만 열람 가능합니다.");
	    			}
	    		<% } else {%>
	    		
	    			alert("관리자만 열람 가능합니다.");
	    		<% } %>
    		});
         // 페이징바 마우스오버 이벤트
    		$(".clickBtn").mouseenter(function(){
    			$(this).css({"background":"darkgray", "cursor":"pointer"});
    		}).mouseout(function(){
    			$(this).css({"background":"lightgray"});
    		}); 
        
        
        });

        </script>
    </body>
</html>

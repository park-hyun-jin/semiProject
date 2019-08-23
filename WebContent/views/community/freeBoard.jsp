<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.PageInfo"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>      
    
<%

   	ArrayList<Board> list =(ArrayList<Board>)request.getAttribute("list"); // 그냥 게시물에 대한 정보
     
    PageInfo pInf = (PageInfo)request.getAttribute("pInf");
    
    int boardCount = pInf.getBoardCount();
    int currentPage = pInf.getCurrentPage();
    int maxPage = pInf.getMaxPage();
    int startPage = pInf.getStartPage();
    int endPage = pInf.getEndPage();
    int limit = pInf.getLimit();
    int pagingBarSize = pInf.getPagingBarSize();
    
  
    %>    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>


<link rel="stylesheet" href="views/style/navNcommunity.css">
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
   
	   
	aside{
	    display: inline-block;
	    width: 15%;
	    height: 60%;
	    position: absolute;
	    top: 18rem;
	}
	
	 .vertical-menu {
	    width: 100%;
	    height: 100%;
	    margin:20px 20px 0 50px;
	}
	
	.vertical-menu>a {
	background-color: #eee;
	color: black;
	display: block;
	padding: 12px;
	text-decoration: none !important;
	font-size: 16px;
	}
	
	.vertical-menu a:hover {
	background-color: rgb(241, 196, 15);
	}
	
	.vertical-menu a.active {
	background-color: rgb(241, 196, 15);
	color: white;
	}
	@charset "UTF-8";
	
	
	.community_content {
	position: relative;
	top: 8rem;
	left: 14rem;
	width: 74%;
	height: 1000px;
	/* border: 1px solid red; */
	margin-left: 15px;
	}
	
	
	/* writeForm */
	
	/* 커뮤니티 게시판 */
	
	/* * {
	border: 1px solid red;
	box-sizing: border-box;
	
	}
	*/
	
	.community_wrap{
	width: 1200px;
	height: 800px;
	/* border: 1px solid black; */
	margin: 0 auto;
	position: relative;
	margin-top: 20px;
	}
	
	.commuity_header {
	width: 900px;
	height: 70px;
	margin: 0 auto;
	
	}
	
	.community_label {
	display: inline-block;
	font-size: 20px;
	}
	.community_table{
	width : 100%;
	
	}
	
	/* 게시글 영역(목록) */
	.community_board_area {
	width: 1200px;
	height: 650px;
	margin-left: 50px;
	/* margin: 0 auto;
	position: relative; */
	}
	
	
	.table_header {
	width: 100%;
	height: 60px;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	
	}
	
	.table_header th {
	font-size: 15px;
	text-align: center;
	background-color: #e3e3e3;
	
	}
	
	.table_header td {
	font-size: 15px;
	text-align: center;
	}
	.table_header:hover{
	background-color: #e3e3e3;
	}
	
	
	
	/* 글쓰기 버튼 영역*/
	/* .community_footer{
	
	height: 50px;
	margin: 0 auto;
	
	} */
	
	/* 글쓰기 버튼 */
	.writeBtn{
	float: right;
	margin-right: auto;
	margin-left: auto;
	border-radius: 5px 5px 5px 5px;
	background-color: rgba(0,0,0,0);
	width: 100px;
	height: 40px;
	}
	
	.writeBtn:hover{
	background-color: rgb(241, 196, 15);
	}
	
	/* 페이징 처리 영역 */
	.pagWrap{
	/* border: 1px solid black; */
	margin: auto;
	width:900px;
	height: 50px;
	text-align: center;
	border-bottom: 1px solid lightgrey;
	
	}
	
	.search_area{
	margin: auto;
	width:900px;
	height: 50px;
	
	position: relative;
	text-align: center;
	
	margin-bottom: 100px;
	}
	/* .searchForm{
	position: absolute;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	
	} */
	.searchInput{
	width: 45%;
	height: 40px;
	box-sizing: border-box;
	border: none;
	background-color:  rgba(241, 196, 15,0.5);
	margin-right: 10px;
	}
	.searchSubmit{
	border-radius: 5px 5px 5px 5px;
	background-color: rgba(0,0,0,0);
	width: 80px;
	height: 35px;
	}   
	.searchSubmit:hover{
	background-color: rgb(241, 196, 15);
	}
	   
	   
</style>


</head>
<body>

	<%@ include file="../common/nav.jsp" %>
	
	<aside>
        <div class="vertical-menu">
        <a href="<%= request.getContextPath() %>/notice.me" >공지사항</a>
        <a href="#" class="active">자유게시판</a>
        <a href="#">Q & A</a>
       </div>
   		</aside>


	    <!-- 본문 영역 -->
	    <div class="content">
        <section class="community_content">
            <!-- 커뮤니티 게시판 -->
            <div class= "community_wrap">

                <!-- 페이지 이름 영역 -->
                <div class="commuity_header">
                    <span class="community_label"> </span>
                </div>
                <!-- 게시글 목록 -->
                <div class = "community_board_area">
                    <table align="center" class="community_table">
                        <tr class="table_header">
                            <th width="100px">번호</th>
                            <th width="500px">제목</th>
                            <th width="100px">작성자</th>
                            <th width="100px">조회수</th>
                            <th width="200px">작성일</th>
                        </tr>
                   <% if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
					<%for(Board b : list){ %>
						  <tr class="table_header">
							<td width="10%"><%=b.getbNo()%></td>						
							<td width="50%"><%=b.getbTitle() %></td>
							<td width="10%"><%=b.getwriter() %></td>
							<td width="5%"><%=b.getbCount() %></td>
							<td width="15%"><%=b.getCreateDate()%></td>

						</tr>
					<%} %>

				<% } %> 
                    </table>
                </div>
               
            
                    <!------- 페이징 바 ------->
			<!-- 페이징 처리 시작! -->
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로(<<) -->
				<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/freeBoard.bo?currentPage=1'">&lt;&lt;</span>
			
				<!-- 이전 페이지로(<) -->
				<% if(currentPage <= 1) { %>
					<span class="pagingBtn">&lt;</span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/freeBoard.bo?currentPage=<%= currentPage-1 %>'">&lt;</span>
				<% } %>
				
				<!-- 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage) { %>
						<span class="pagingBtn selectBtn"><%= p %></span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" 
							onclick="location.href='<%= request.getContextPath() %>/freeBoard.bo?currentPage=<%= p %>'"><%=p%></span>
					<% } %>
				<%} %>
				
				<!-- 다음 페이지로(>) -->
				<% if(currentPage >= maxPage){ %>
					<span class="pagingBtn"> &gt; </span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/freeBoard.bo?currentPage=<%= currentPage+1 %>'">&gt;</span>
				<% } %>
				
				<!-- 맨 끝으로(>>) -->
				<span class="pagingBtn clickBtn"
					onclick="location.href='<%= request.getContextPath() %>/freeBoard.bo?currentPage=<%= maxPage %>'">&gt;&gt;</span>
			</div>      
               
         
        	<!-- 글쓰기 버튼 -->
                <div class="community_footer">
                 <% if(loginUser != null){ %>
                    <button type = "button"class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/freeBoardWrite.fo'">글쓰기</button> 
                <%} %>
                    <%-- <button class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/playgroupWrite.fo'">글쓰기</button>  --%>
                </div>
            <!-- 검색 영역 -->
            <div class = "search_area">
                <form class = "searchForm">
                    <input type="text" class="searchInput">
                    <span><button type="submit" class = "searchSubmit">검색</button></span>
                </form>
            </div>

        </section>
        
        <script>
			$(function(){
				// 게시판 상세보기
				$(".table_header td").mouseenter(function(){
					$(this).parent().css({"color":"black", "cursor":"pointer"});
				}).click(function(){
					var bNo = $(this).parent().children().eq(0).text();
					
					// 로그인 한 사람만 게시글 상세보기 가능
					<% if(loginUser != null){ %>
						location.href="<%= request.getContextPath() %>/boardgroupWrite.de?bNo="+bNo;
					<% } else{ %>
						alert("로그인해야만 상세보기가 가능합니다!");
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
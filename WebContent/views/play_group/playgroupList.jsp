<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Board> playgroup = (ArrayList<Board>)request.getAttribute("playgroup");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>



<link rel="stylesheet" href="<%=request.getContextPath()%>views/style/navNcommunity.css">
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
	section{
	position: relative;
	top:8rem;
	left: 12rem;
	width:74%;
	height:900px;
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
                            <th width="10%">글 번호</th>
                            <th width="10%">말머리</th>
                             <th width="50%">제목</th>
                            <th width="10%">작성자</th>
                             <th width="5%">조회수</th>
                            <th width="15%">작성일</th>
                        </tr>
                         <% if(playgroup.isEmpty()){ %>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
					<%for(Board b : playgroup){ %>
						<tr>
							<td><%=b.getbNo() %></td>
							<td><%=b.getheader() %></td>							
							<td><%=b.getbTitle() %></td>
							<td><%=b.getwriter() %></td>
							<td><%=b.getwriter() %></td>
							<td><%=b.getCreateDate() %></td>
						</tr>
					<%} %>

				<% } %> 
                    </table>
                </div>
                
                <!-- 글쓰기 버튼 -->
                <div class="community_footer">
                    <button class="writeBtn" onclick="location.href='<%=request.getContextPath()%>/playgroupWrite.fo'">글쓰기</button> 
                </div>
               
            
            </div>
        
            <!-- 검색 영역 -->
            <div class = "search_area">
                <form class = "searchForm">
                    <input type="text" class="searchInput">
                    <span><button type="submit" class = "searchSubmit">검색</button></span>
                </form>
            </div>

        </section>

</body>
</html>
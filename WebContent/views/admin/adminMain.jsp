<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="board.model.vo.Board, java.util.ArrayList, board.model.vo.Report, cash.model.vo.Imp"%>    
<%

	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");
	ArrayList<Imp> impList = (ArrayList<Imp>)request.getAttribute("impList");
	ArrayList<Report> reportList = (ArrayList<Report>)request.getAttribute("reportList");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>


</head>

<style>
	 .section_wrap {
	    padding-top: 8rem;
	    width: 1400px;
	    height: 850px;
	    margin-left: 350px;
	    position: relative;
	    
	
	}
	.main_money,.main_board,.main_report{
	    width: 390px;
	    /* height: 800px; */
	    float: left;
	    box-sizing: border-box;
	    margin:20px 0 0  40px;
	    border: 1px solid black;
	}
	
	
	.section_wrap th, .section_wrap td{
	    font-size: 13px;
	    text-align: center;
	    border-bottom: 1px solid black;
	    padding: 3px;
	    height: 40px;
	}
	.section_wrap table{
	    border-collapse: collapse;
	    border-style: none;
	}
	
	.section_wrap th{
	    background-color: rgb(57, 109, 219);
	    color: white;
	}
	
	caption {
		margin-bottom : 10px;
	}
	
	   

</style>


<body>

	<%@ include file="adminNav.jsp" %>
	
	
	
	<div class= "section_wrap">
	    <div class = "main_money">
	        
	        <table style="border: 0" id="main_money">
	        	<caption>최근 충전내역</caption>
	            <thead>
	            <tr>
	                <th width="97.5px" height="30px">날짜</th>
	                <th width="97.5px" height="30px">유저네임</th>
	                <th width="97.5px" height="30px">캐시충금액</th>
	                <th width="97.5px" height="30px">상세보기 링크</th>
	            </tr>
	            </thead>
	            <tbody>
	            <% if(impList == null || impList.isEmpty()){ %>
				<tr>
					<td colspan="4">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
				
					<% for(Imp i : impList) { %>
					<tr>
						<td><%= i.getChargeDate() %></td>
						<td><%= i.getImpUid().split(",")[1] %></td>
						<td><%= i.getAmount() %></td>
						<td><a href='<%= i.getReceiptUrl() %>'> 이동하기 </a></td>
					</tr>
					<% } %>
				<% } %>
				</tbody>
	        </table>
	    </div>
	        
	    <div class= "main_board">
	        <table id="main_board">
	        	<caption>최근 게시글</caption>
	        	<thead>
	            <tr>
	                <th width="97.5px" height="30px">날짜</th>
	                <th width="97.5px" height="30px">작성자</th>
	                <th width="97.5px" height="30px">게시판</th>
	                <th width="97.5px" height="30px">게시글 제목</th>
	            </tr>
	            </thead>
	            <tbody>
	              <% if(boardList == null || boardList.isEmpty()){ %>
				<tr>
					<td colspan="4">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
				
					<% for(Board b : boardList) { %>
					<tr>
						<td>
							<input type='hidden' name='bno' value='<%= b.getbNo() %>'>
							<input type='hidden' name='bType' value='<%= b.getbType().split(",")[0] %>'> 
							<%= b.getCreateDate() %>
						</td>
						<td><%= b.getwriter().split(",")[1] %></td>
						<td><%= b.getbType().split(",")[1] %></td>
						<td><%= b.getbTitle() %></td>
					</tr>
					<% } %>
				<% } %>
				</tbody>
	        </table>
	    </div>
	
	    <div class= "main_report">
	        <table id="main_report">
	        	<caption>최근 신고내역</caption>
	        	<thead>
	            <tr>
	                <th width="97.5px" height="30px">유저네임</th>
	                <th width="97.5px" height="30px">게시판</th>
	                <th width="97.5px" height="30px">게시글제목</th>
	                <th width="97.5px" height="30px">신고내역</th>
	            </tr>
	            </thead>
	            <tbody>
	              <% if(reportList == null || reportList.isEmpty()){ %>
				<tr>
					<td colspan="4">등록된 게시글이 없습니다.</td>
				</tr>
				<% }else { %>
				
					<% for(Report r : reportList) { %>
					<tr>
						<td>
							<input type='hidden' name='bno' value='<%= r.getbNo() %>'>
							<input type='hidden' name='bType' value='<%= r.getbType().split(",")[0] %>'>
							<%= r.getNickName() %>
						</td>
						<td><%= r.getbType().split(",")[1] %></td>
						<td><%= r.getbType().split(",")[2] %></td>
						<td><%= r.getRpContent() %></td>
					</tr>
					<% } %>
				<% } %>
				</tbody>
	        </table>
	    </div>
	</div>
	
	<script>
	

	
		$(document).ready( function () {
		    $('#main_money').DataTable();
		    $('#main_board').DataTable();
		    $('#main_report').DataTable();
		} );
	
		$(function() {
			$("#nav_go_main a").css("color", "rgb(235, 199, 91)");
			
			
			// 유저정보 상세보기
			$(".main_board td, .main_report td").mouseenter(function(){
				$(this).parent().css({"background":"#EFDD8A", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var bno = $(this).parent().children().eq(0).children().eq(0).val();
				var bType = $(this).parent().children().eq(0).children().eq(1).val();
				location.href="<%= request.getContextPath() %>/detailBoard.ad?bno="+bno+"&bType="+bType;
			});			
			
			
		});
	
	</script>


</body>
</html>
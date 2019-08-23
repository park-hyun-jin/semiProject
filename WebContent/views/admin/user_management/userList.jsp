<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="board.model.vo.PageInfo, user.model.vo.User, java.util.ArrayList"%>
    
    
<%
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	
%>      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보 목록</title>

	<style>
	
		#nav_user_management a{
			/* background-color: rgb(121, 149, 232);  */
			/* color: orangered; */
		}

	   .section_wrap {
	        width: 1400px;
	        height: 900px;
	        padding-top: 8rem;
	        position: relative;
	        margin-left: 350px;
	        
	    } 
	
		.userListArea {
			width: 1200px;
			height: 800px;
			/* position: relative;  */
			padding: 30px;
			margin-left: 100px;
			margin-top: 40px;
			float: left;
		}
		/*  
		.userListTable {
			width: 1200px;
			float: left;
		} */

		.userListTable td {
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
			background-color: rgb(57, 109, 219);
			height: 50px;
			font-weight: bold;
			font-size: 18px;
			text-align: center;
			color: white;
		}
	
		
	</style>

</head>
<body>

	<%@ include file="../adminNav.jsp" %>
	
	<div class="section_wrap">
	<div class="userListArea">
	    <table class="userListTable">
	        <thead>
	        <tr>
	            <th class="nicknameArea">닉네임</td>
	            <th class="nameArea">이름</td>
	            <th class="statusArea">구분</td>
	            <th class="pointArea">보유 포인트</td>
	            <th class="cashArea">보유 캐시</td>
	        </tr>
	        </thead>
	        <tbody>
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
	    
			</tbody>
	    </table>
	
	</div>
	
	

	
	
	<script>
	
		
		$(document).ready( function () {
		    $('.userListTable').DataTable();
		   
		} );
		
		$(function(){
			
			$("#nav_user_management a").css("color", "rgb(235, 199, 91)");

			
			// 유저정보 상세보기
			$(".userListTable td").mouseenter(function(){
				$(this).parent().css({"background":"#EFDD8A", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var uno = $(this).parent().children().eq(0).children().eq(0).val();
				location.href="<%= request.getContextPath() %>/detailUser.ad?uno="+uno;
			});
			
			/* 
			// 페이징바 마우스오버 이벤트
			$(".clickBtn").mouseenter(function(){
				$(this).css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}); */
		});
		
	</script>
	
	

</body>
</html>
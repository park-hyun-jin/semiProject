<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

		Calendar tDay = Calendar.getInstance();



		int y = tDay.get(Calendar.YEAR);

		int m = tDay.get(Calendar.MONTH);

		int d = tDay.get(Calendar.DATE);



		Calendar dSet = Calendar.getInstance();

		dSet.set(y, m, 1);

		int yo = dSet.get(Calendar.DAY_OF_WEEK);



		int last_day = tDay.getActualMaximum(Calendar.DATE);

	%>

<style>
section {
	position: relative;
	top: 8rem;
	left: 14rem;
	width: 74%;
	height: 900px;
}

header {
	width: 100%;
	height: 20%;
}

aside {
	display: inline-block;
	width: 15%;
	height: 60%;
	position: absolute;
	top: 18rem;
}

.vertical-menu {
	width: 100%;
	height: 100%;
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

.content {
	position: absolute;
	top: 14rem;
	left: 19rem;
	width: 78.5%;
	height: 800px;
}

.content-list {
	width: 100%;
	height: 15%;
}

.user-info {
	width: 100%;
	height: 85%;
	border: 1px solid black;
}

.header-left {
	width: 18%;
	height: 100%;
	float: left;
	background-color: darkgrey;
	text-align: center;
	display: table;
}

.header-left>span {
	display: table-cell;
	vertical-align: middle;
	font-size: 1.5rem;
	color: whitesmoke;
}

.bg-primary {
	z-index: 2;
}

.header-right {
	float: left;
	width: 82%;
	height: 100%;
}

.header-right div {
	float: left;
	text-align: center;
	display: table;
}

.header-right div span {
	display: table-cell;
	vertical-align: middle;
}

.header-right>div>span>p {
	margin: 0.5rem;
}

.header-right>div:nth-child(1) {
	width: 23%;
	height: 100%;
	font-size: 1.5rem;
}

.header-right>div:nth-child(2) {
	width: 23%;
	height: 100%;
	font-size: 1.1rem;
}

.header-right>div:nth-child(3) {
	width: 23%;
	height: 100%;
	font-size: 1.1rem;
}

.header-right>div:nth-child(4) {
	width: 31%;
	height: 100%;
	font-size: 1.2rem;
}

.calendar-month {
	width: 100%;
	height: 4rem;
	font-size: 3rem;
	text-align: center;
	line-height: 4rem;
}

.calendar-div {
	width: 100%;
	height: 600px;
	border: 2px solid black;
}

.calendar {
	width: 100%;
	height: 100%;
	
}

.calendar tr {
	height: 14.28%;
}

.calendar tr th {
	text-align: center;
	font-size: 1.3rem;
	border: 1px solid #adb5bd;
	padding-top: 0;
	padding-bottom: 0;
	background-color: #eee;
	color: #1a1a1a;
}

.calendar tr td {
	font-size: 1.2rem;
	padding-top: 0;
	padding-bottom: 0;
	pointer-events: none;
	position: relative;
	border: 1px solid #adb5bd;
}

.cake {
	width: 40px;
	height: 40px;
	background-image: url("../image/grey-cake.png");
	background-size: contain;
	margin-right: 25%;
	background-color: white;
	display: inline-block;
	opacity: 0.2;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>

	<section>
		<header>
			<div class="content-list">
				<h5>마이페이지 > 출석체크</h5>
			</div>
			<div class="user-info">
				<div class="header-left">
					<span>User ID</span>
				</div>
				<div class="header-right">
					<div>
						<span>닉네임</span>
					</div>
					<div>
						<span>
							<p>보유 포인트</p>
							<p style="color: rgb(37, 223, 161)">4060p</p>
						</span>
					</div>
					<div>
						<span>
							<p>보유 캐시</p>
							<p style="color: rgb(37, 223, 161)">5010cash</p>
						</span>
					</div>
					<div>
						<span><button class="modified-btn">정보 수정</button></span>
					</div>
				</div>
			</div>
		</header>

		<aside>
			<div class="vertical-menu">
				<a href="#" class="active">출석체크</a> <a href="#">내가 쓴 글 확인</a> <a href="#">다운로드 악보/찜한 악보</a> <a href="#">업로드 악보</a> <a href="#">캐시 충전</a> <a href="#">인증하기</a> <a href="#">탈퇴</a>
			</div>
		</aside>

		<div class="content">
			<div class="calendar-month">
				<span><%=(m+1)%>월</span>
			</div>
			<div class="calendar-div">
				<table class="calendar">
					<thead>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
						<%
							for (int k = 1; k < yo; k++) {
						%>

						<td></td>

						<%
							}
						%>

						<%
							for (int j = 1; j <= last_day; j++) {
						%>

						<td><span><%=j%><div id="<%=j%>" class="cake"></div></span>

							<%
								if ((yo + j - 1) % 7 == 0) {
									if(j==last_day){
							%>
								</td>
							<% }else{ %>	
						</td>
						</tr>
						<tr>
							
							<%
								}
								}
								}							
							%>
						
						
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</section>

	<script>
		$(document).ready(function(){
			$("#<%=d%>").css({"pointer-events":"auto","cursor":"pointer"});
			$("#<%=d%>").parent().parent().css("background-color","rgb(241, 196, 15,0.25)");
			
		});
		$(".cake").click(function() {
			alert("우효~ 50포인트 겟또다제!");
			$(this).css({
				"background-image" : "url('../image/red-cake.png')",
				"opacity" : "1",
				"pointer-events" : "none"
			});
		});
	</script>



</body>
</html>
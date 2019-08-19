<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="user.model.vo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	
	User user = (User)request.getAttribute("user");
	int uNo = user.getuNo();
	String email = user.getEmail();
	String userName = user.getUserName();
	String nickName = user.getNickName();
	String userPwd = user.getUserPwd();
	int userPoint = user.getUserPoint();
	int userCash = user.getUserCash();

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

.content {
	position: absolute;
	top: 14rem;
	left: 19rem;
	width: 78.5%;
	height: 800px;
}

</style>
</head>
<body>
	
	
		<header>
			<div class="content-list">
				<h5>마이페이지 > 출석체크</h5>
			</div>
			<div class="user-info">
				<div class="header-left">
					<span><%=nickName %></span>
				</div>
				<div class="header-right">
					<div>
						<span><%=userName %></span>
					</div>
					<div>
						<span>
							<p>보유 포인트</p>
							<p style="color: rgb(37, 223, 161)" class="p-userPoint"><%=userPoint %>p</p>
						</span>
					</div>
					<div>
						<span>
							<p>보유 캐시</p>
							<p style="color: rgb(37, 223, 161)"><%=userCash %>cash</p>
						</span>
					</div>
					<div>
						<span><button class="modified-btn" onclick="location.href='<%=request.getContextPath()%>/userInfo.me'">정보 수정</button></span>
					</div>
				</div>
			</div>
		</header>

	<aside>
		<div class="vertical-menu">
			<a href="<%=request.getContextPath() %>/myPage.me" class="absence">출석체크</a> 
			<a href="<%= request.getContextPath() %>/myPageList.me" class="myBoard">내가 쓴 글 확인</a> 
			<a href="<%= request.getContextPath() %>/myPageDownNote.me" class="download">다운로드 악보/찜한 악보</a> 
			<a href="#" class="upload">업로드 악보</a> 
			<a href="<%= request.getContextPath() %>/myPageCashCharge.me" class="cashCharge">캐시 충전</a> 
			<a href="#" class="identify">인증하기</a> 
			<a href="<%=request.getContextPath() %>/myPageQuit.me" class="quit">탈퇴</a>
		</div>
	</aside>


  
  
</body>
</html>
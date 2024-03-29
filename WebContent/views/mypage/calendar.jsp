<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	ArrayList<Integer> pointList = (ArrayList<Integer>)request.getAttribute("pointList");

	int size = pointList.size();

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
	background-image: url("<%=request.getContextPath()%>/views/image/grey-cake.png");
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
		<%@ include file="myPageFrame.jsp"%>
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
			
			$(".absence").addClass("active");
			
			$("#<%=d%>").css({"pointer-events":"auto","cursor":"pointer"});
			$("#<%=d%>").parent().parent().css("background-color","rgb(241, 196, 15,0.25)");

			<% for(int i=0; i<size;i++){ %>
				$("#<%=pointList.get(i)%>").css({
					"background-image" : "url('<%=request.getContextPath()%>/views/image/red-cake.png')",
					"opacity" : "1",
					"pointer-events" : "none"
				});
			<% } %>
		});
		$(".cake").click(function() {
			var point = 50;
			var summary = "A";
			
			$.ajax({
				url : "pointUpdate.me",
				type : "GET",
				data : { point : point, summary : summary, uNo : '<%=uNo%>'},
				success:function(result){
					if(result>0){
						alert("☆50포인트 적!립!☆");
						$("#<%=d%>").css({
							"background-image" : "url('<%=request.getContextPath()%>/views/image/red-cake.png')",
							"opacity" : "1",
							"pointer-events" : "none"							
						});
						var userPoint = <%=userPoint%>+49+Number(result);
						$(".p-userPoint").text(userPoint+"p");
					}else{
						alert("난! 단한번만이라도 적리파고시푼데! 포인트를! 적립할수가! 없어!");
					}
				},
				error: function(){
					console.log("Ajax 통신실패");
				}
				
				
			});
			
		});
	</script>



</body>
</html>
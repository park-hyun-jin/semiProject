<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

  html{
            resize: both;
            width: 1910px;            
        }

        .navbar{
            font-size: 1.2rem;
            padding: 0rem 3rem;
        }

        .bg-primary{
            z-index: 2;
            position: fixed !important;
            width: 1910px;
            background-color: rgb(1,11,20) !important;
            top: 0;
        }
        
        .sign_in_btndiv {
        	width: 10%;
            float: right;
            /* margin-right: 2rem; */
            
        }

        .sign_in_btn{
            margin: 0 auto;
            display: inline-block;
            font-weight: 600;
            color: #919aa1;
            text-align: center;
            vertical-align: middle;
            width: 74px;
            background-color: transparent;
            border: 0px solid transparent;
            padding: 0.4rem 1.0rem;
            font-size: 0.875rem;
            line-height: 1.5rem;
            border-radius: 0;
            color: rgb(1,11,20);
            background-color: #fff;
            border-color: #fff;
            
        }
        
        .userFuncArea {
			width: 50px;
			height: 50px;
			float: left;
			margin-left: 10%;
			
		}
		
		.userFuncArea img {
			width: 100%;
			height: 100%;
			cursor:pointer;
		}
		
        footer{
            background-color: rgb(1,11,20);
            width: 100%;
            height: 3rem;
            bottom: 0;
            position: fixed;
            z-index: 2;
        }
        
        .form-control{
            width: 5rem;
        }

        .nav-hover{
            border-bottom: 4px solid rgb(1,11,20);
            border-top: 4px solid rgb(1,11,20);
            width: 96.88px;
            height: 58.88px;
        }

        .nav-hover:hover{
            border-bottom: 4px solid yellow;
        }

        .nav-link:hover, .nav-link:focus {
            text-decoration: none;
        }

        .detailList{
            display: none;
            border-bottom: 1px solid #adb5bd;
            
            box-sizing: border-box;
        }

        .detailList>li{
            display: inline;
            font-size: 1.2rem;
            padding: 0.715rem 1.2rem;
            margin: 0 1.4rem 0 0;
            
        }
        .detailList>li a{
            color: rgb(1,11,20);
        }

        .detailList>li:hover a{
            border-bottom: 3px solid yellow;
        }

        .nav-margin{
            margin-right: 10rem !important;
        }

        .nav-margin:hover > .detailList{
            position: absolute;
            display: block;
            width: 760px;
            height: 40px;
            margin-top: 10px;
            padding: 0;
        } 

        .nav-margin:hover > .detailList2{
            width: 500px;
        }

        .detailList2>li>a{
            text-decoration: none;
            
        }
        .detailList2>li{
            padding-left: 0.5rem;
            margin-right: 3rem;
        }



</style>

<!-- 모달설정 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<!-- 로그인 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/loginModal.css"></link>



<!-- 회원가입 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/joinForm.css"></link>



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
						alert("아아, 이것은 포인트라는것이다. 이걸로 악보를 구매할수 있지(웃음)");
						$("#<%=d%>").css({
							"background-image" : "url('<%=request.getContextPath()%>/views/image/red-cake.png')",
							"opacity" : "1",
							"pointer-events" : "none"							
						});
						var userPoint = <%=userPoint%>+49+Number(result);
						$(".p-userPoint").text(userPoint+"p");
					}else{
						alert("난! 단한번만이라도 적립카고시푼데! 포인트를! 적립할수가! 없어!");
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
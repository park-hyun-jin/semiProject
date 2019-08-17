<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
	.quit-user{
            position: absolute;
            top: 20%;
            left: 0;
            right: 0;
            width: 280px;
            height: 80%;
            margin: auto;
            font-size: 20px;
        }


        .quit-password{
            background-color: rgb(224, 224, 224);
            width: 100%;
        }
          
        .quit-div{
            width: 100%;
            height: 100%;
            position: relative;
        }  
            
        .quit-form {
            text-align: center;
        }   


</style>
<script>

if(msg != "null") { // msg 값이 있을 경우
	alert(msg);	
	<% session.removeAttribute("msg"); %>
}
</script>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>
	
	<section>
		<%@ include file="myPageFrame.jsp"%>
		<div class="content">
            <div class=quit-div>
                <div class="quit-user">
                    <p>본인이 올린 악보, 동영상등은 삭제되지 않고
			                        보존됩니다. <br><br>
			                        그래도 탈퇴하시겠습니까?
                    </p>
                    <br><br>

                    <label>비밀번호를 입력하세요</label>
                    <form action="<%=request.getContextPath() %>/quit.me" method="post" class="quit-form" onsubmit="return quit();">
                        <input type="password" class="quit-password">
                        <br><br>                    
                        <input type="submit" value="탈퇴하기">
                    </form>

                </div>
            </div>
        </div>	
		
	</section>
	
	<script>
	$(document).ready(function(){
		
		$(".quit").addClass("active");

	});
	function quit(){
		var pwd = $(".quit-password").val().trim();
		console.log("<%=userPwd%>");
		if("<%=userPwd%>" == pwd){
			return true;
		}else{
			return false;
		}
	}
	
	</script>

</body>
</html>
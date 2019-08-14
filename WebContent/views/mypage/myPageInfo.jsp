<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.password{
          position: relative;
          width: 100%;
          height: 80%;
          border: 1px solid black;
          font-size: 1.3rem;
      }

      .password1{
          width: 100%;
          background-color: rgb(224, 224, 224);
      }

      .modify{
          position: relative;
          width: 100%;
          height: 100px;
          text-align: center;
      }

      .user-form{
          position: absolute;
          top: 5%;
          left: 0;
          right: 0;
          bottom: 0;
          margin: auto;
          width: 20rem;
      }

</style>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>
	
	<section>
		<%@ include file="myPage.jsp"%>
		<div class="content">
			<div class="password">
                <form action="#" method="post" class="user-form">
                <label>닉네임</label><br>
                <input type="text" class="password1" value="<%=nickName%>" readonly>
                <br><br>
                <label>password</label><br>
                <input type="password" class="password1">
                <br><br>
                <label>password 확인</label><br>
                <input type="password" class="password1">
                <br><br>
                <label>본인email</label><br>
                <input type="text" class="password1" value="<%=email%>" readonly>
                <br><br>
                <div class="modify">
                <input type="submit" value="수정"> 
                </div>
                </form>
           </div>
		</div>

	</section>

	<script>
		
	</script>



</body>
</html>
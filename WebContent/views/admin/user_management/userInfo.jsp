<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, user.model.vo.User, user.model.vo.Artist"%>
<%

	User user = (User)request.getAttribute("user");
	Artist artist = (Artist)request.getAttribute("artist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 세부정보</title>

<style>

    .section_wrap{
        width: 600px;
        margin: 0 auto;
        position: relative;
        
    }

    .table_wrap{
        width: 500px;
        
        margin-top: 100px;
        float: left;
    }
    .profile_Img{
        width: 80px;
        margin-top: 100px;
        float: left;
        /* border: 1px solid black; */

    }
    .profile_Img>img{
        width: 50px;
        height: 50px;
    }

    th{
        width: 200px;
        height: 30px;
        text-align: center;
        background-color: rgba(211, 211, 211, 0.836);
        
    }
    td{
        width: 300px;
        height: 30px;
        text-align: center;
    }
    
    .user_profile>p {
        font-size: 20px;
        padding-left: 100px;
    }

</style>


</head>
<body>
	
	
	<div class= "section_wrap">
	    <div class="profile_Img">
	        <img src="<%=request.getContextPath() %>/views/admin/images/admin_user_profile.png">
	    </div>
	    <div class="table_wrap">
	        <table>
	            <tr>
	                <th>userNo</th>
	                <td><%= user.getuNo() %></td>
	            </tr>
	            <tr>
	                <th>닉네임</th>
	                <td><%= user.getNickName() %></td>
	            </tr>
	            <tr>
	                <th>이메일</th>
	                <td><%= user.getEmail() %></td>
	            </tr>
	            <tr>
	                <th>포인트</th>
	                <td><%= user.getUserPoint() %></td>
	            </tr>
	            <tr>
	                <th>캐시</th>
	                <td><%= user.getUserCash() %></td>
	            </tr>
	            <tr>
	                <th>가입일자</th>
	                <td><%= user.getEnrollDate() %></td>
	            </tr>
	            <tr>
	                <th>등급</th>
	                <td>
	                <%= (user.getArtist().equals("Y"))?"아티스트":"일반" %>
	                </td>
	            </tr>
	            <% if(artist != null) { %>
	            <tr>
	                <th>부여날짜</th>
	                <td><%= artist.getaDate() %></td>
	            </tr>
	            <tr>
	                <th>입금은행</th>
	                <td><%= artist.getAccount().split(",")[0] %></td>
	            </tr>
	            <tr>
	                <th>계좌번호</th>
	                <td><%= artist.getAccount().split(",")[1] %></td>
	            </tr>
	            <tr>
	                <th>총 수익</th>
	                <td><%= artist.getTorofit() %></td>
	            </tr>
	            <% } %>
	        </table>
	    </div>
	</div>
	
	<script>
		$(function() {
			$("#nav_user_management a").css("color", "rgb(235, 199, 91)");
		});
	
	</script>
	

</body>
</html>
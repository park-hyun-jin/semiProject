<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	 .admin_main{
	    padding-top: 8rem;
	    /* width: 1200px; */
	    height: 850px;
	    margin: 0 auto;
	    position: relative;
	
	}
	.main_money,.main_artist,.main_report{
	    width: 390px;
	    /* height: 800px; */
	    float: left;
	    box-sizing: border-box;
	    margin:20px 0 0  60px;
	    border: 1px solid black;
	}
	
	
	.admin_main th,.admin_main td{
	    font-size: 13px;
	    text-align: center;
	    border-bottom: 1px solid black;
	    padding: 3px;
	}
	.admin_main table{
	    border-collapse: collapse;
	}
	
	.admin_main th{
	    background-color: rgb(57, 109, 219);
	    color: white;
	}
	
	   

</style>


<body>

	<%@ include file="adminNav.jsp" %>
	
	<div class= "admin_main">
	    <div class = "main_money">
	        <table>
	            <tr>
	                <th width="97.5px" height="30px">날짜</th>
	                <th width="97.5px" height="30px">유저네임</th>
	                <th width="97.5px" height="30px">캐시충금액</th>
	                <th width="97.5px" height="30px">충전내역</th>
	            </tr>
	            <tr>
	                <td width="97.5px" height="30px">2019.08.29</td>
	                <td width="97.5px" height="30px">정다운</td>
	                <td width="97.5px" height="30px">2500</td>
	                <td width="97.5px" height="30px">신요카드</td>
	            </tr>
	            
	
	        </table>
	    </div>
	        
	    <div class= "main_artist">
	        <table>
	            <tr>
	                <th width="97.5px" height="30px">날짜</th>
	                <th width="97.5px" height="30px">유저네임</th>
	                <th width="97.5px" height="30px">게시글번호</th>
	                <th width="97.5px" height="30px">신고내역</th>
	            </tr>
	            <tr>
	                <td width="97.5px" height="30px">2019.08.29</td>
	                <td width="97.5px" height="30px">정다운</td>
	                <td width="97.5px" height="30px">3</td>
	                <td width="97.5px" height="30px">이상한 내용임</td>
	            </tr>
	        </table>
	    </div>
	
	    <div class= "main_report">
	        <table>
	            <tr>
	                <th width="130px" height="30px">날짜</th>
	                <th width="130px" height="30px">유저네임</th>
	                <th width="130px" height="30px">글 제목</th>
	            </tr>
	            <tr>
	                <td width="130px" height="30px">2019.08.29</td>
	                <td width="130px" height="30px">정다운</td>
	                <td width="130px" height="30px">번지점프-오마이걸</td>
	            </tr>
	        </table>
	    </div>
	</div>
	


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	request.setAttribute("user", request.getAttribute("user"));
	request.setAttribute("artist", request.getAttribute("artist"));

%>

</head>

<style>
   .page_content {
        width: 700px;
        height: 900px;
        padding: 40px;
        padding-top: 8rem;
        position: absloute;
        margin-left: 350px;
    }


    /* p {
        margin: 0 0 20px;
        line-height: 1.5;
    } */

    .main {
        min-width: 320px;
        max-width: 1200px;
        /* padding: 50px; */
        margin: 0 auto;
        background: #ffffff;
    }

    section {
        height: 600px;
        display: none;
        padding: 20px 0 0;
        border: 1px solid #ddd;
        width: 1200px;
    }


    /*라디오버튼 숨김*/
      input {
          display: none;
     }

    label {
        display: inline-block;
        margin: 0 0 -1px;
        padding: 10px 49px;
        font-weight: 600;
        text-align: center;
        color: #bbb;
        border: 1px solid transparent;
    }

    label:hover {
        color: rgb(57, 109, 219);
        cursor: pointer;}
    
    /* label[for="tab6"]{
        padding: 10px 70px; 
    } */

    /*input 클릭시, label 스타일*/
    input:checked + label {
          color: #555;
          border: 1px solid #ddd;
          border-top: 2px solid rgb(57, 109, 219);
          border-bottom: 1px solid #ffffff;
          }

    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2,
    #tab3:checked ~ #content3,
    #tab4:checked ~ #content4,
    #tab5:checked ~ #content5,
    #tab6:checked ~ #content6 {
        display: block;
    }

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

<body>

	<%@ include file="../adminNav.jsp" %>

	<!-- 본문 -->
	<div id="page_content">
	    <div class="user_profile">
	        <p> [ 아이디 / 포인트 / 캐시 ]</p>
	        <!-- <span class="user_Id">[ 아이디</span>
		<span class= "user_Point"> / 포인트 /</span>
		<span class= "user_Cash">캐시 ]</span> -->
		</div>
		<div class="main">
		    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	            <label for="tab1">유저정보</label>
	        
	            <input id="tab2" type="radio" name="tabs">
	            <label for="tab2">업로드 악보</label>
	        
	            <input id="tab3" type="radio" name="tabs">
	            <label for="tab3">디운로드악보</label>
	        
	            <input id="tab4" type="radio" name="tabs">
	            <label for="tab4">작성한 게시글</label>
	        
	            <input id="tab5" type="radio" name="tabs">
	            <label for="tab5">작성한 댓글</label>
	        
	            <input id="tab6" type="radio" name="tabs">
	            <label for="tab6">보유 포인트 / 캐시</label> 
	        
	            <section id="content1">
	            	<jsp:include page="userInfo.jsp" /> 
	            
	                <!-- <div class= "section_wrap">
	                    <div class="profile_Img">
	                        <img src="images/admin_user_profile.png">
	                    </div>
	                    <div class="table_wrap">
	                        <table>
	                            <tr>
	                                <th>userNo</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>닉네임</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>이메일</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>포인트</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>캐시</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>가입일자</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>등급</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>부여날짜</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>입금은행</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>계좌번호</th>
	                                <td>값</td>
	                            </tr>
	                            <tr>
	                                <th>총 수익</th>
	                                <td>값</td>
	                            </tr>
	                        </table>
	                    </div>
	                </div> -->
	            </section>
	            <section id="content4">
	            	<jsp:include page="userInfo.jsp" /> 
		        </section>
	        </div>
	    </div>
	
	</div>
</body>
</html>
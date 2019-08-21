<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
    
<%
	// 로그인했을 경우 유저정보
	User loginUser = (User)session.getAttribute("loginUser");
	
	String msg = (String)session.getAttribute("msg"); 
	
	// 카카오로그인 app key
	String kakaoKey = "188493ea165a4a41ea7f70b87d9da98c";
	
	// 네이버 로그인 클라이언트ID, callbackURL
	String naverClientID = "TyJHkEkL1q5EMX7mTaF3";
	String naverCallbackUrl = request.getContextPath() + "/views/common/naverLoginCallback.jsp";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Insert title here</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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

<!-- 이용약관&동의 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/join_agree.css"></link>

<!-- 회원가입 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/joinForm.css"></link>

<!-- 아이디/비번 찾기 스타일 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/idPwdSearch.css"></link>

<!-- 소셜아이디로 로그인시 추가정보 입력폼 스타일-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/style/addInfoForm.css"></link>
	


<script>
	var msg = "<%= msg%>";
	
	if(msg != "null") { // msg 값이 있을 경우
		alert(msg);	
		<% session.removeAttribute("msg"); %>
	}
</script>



</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="<%=request.getContextPath()%>">로고자리</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover " href="#">악보공유</a>
                    <ul class="detailList">
                        <li><a href="#">피아노</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">바이올린</a></li>
                        <li><a href="#">플루트</a></li>
                        <li><a href="#">하모니카</a></li>
                        <li><a href="#">etc</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="<%=request.getContextPath()%>/sheetapplyWrite.li">악보신청</a>
                    <ul class="detailList">
                        <li><a href="<%=request.getContextPath()%>/sheetapplyWrite.li">피아노</a></li>
                        <li><a href="#">기타</a></li>
                        <li><a href="#">바이올린</a></li>
                        <li><a href="#">플루트</a></li>
                        <li><a href="#">하모니카</a></li>
                        <li><a href="#">etc</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="#">커뮤니티</a>
                    <ul class="detailList detailList2">
                        <li><a href="<%= request.getContextPath() %>/notice.me">공지사항</a></li>
                        <li><a href="<%= request.getContextPath() %>/freeBoard.bo">자유게시판</a></li>
                        <li><a href="#">Q&A</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="<%=request.getContextPath()%>/playgroupSearch.bo">연주모임</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
                    <div class="sign_in_btndiv">
        	<!-- 로그인 안했을 경우 -->
        	<% if(loginUser == null) { %>
            	<button class="sign_in_btn">sign in</button>
            <% } else { %>
            	<!-- 로그인 했을 경우. 마이페이지 이동, 로그아웃 가능  -->
            	<div id="mypageDiv" class="userFuncArea" 
            		onclick="location.href='<%=request.getContextPath()%>/myPage.me'">
            		<img src="<%=request.getContextPath() %>/views/image/mypage_w.png"/>	
            	</div>
            	<div id="logoutDiv" class="userFuncArea" onclick="logout()">
            		<img src="<%=request.getContextPath() %>/views/image/logout_w.png"/>
            	</div>
            
            <% } %>
        </div>
        </div>

    </nav>


    <footer>

    </footer>
    <script>
            $(window).scroll(function(){
                $(".navbar").css("left", 0-$(this).scrollLeft());
            })
        </script>


	<!--로그인 버튼을 눌렀을 때의 모달. -->
	<div id="login-modal" class="all-area-modal">
	
	
		<!-- 로그인 창 -->
	    <div id="login-form" class= "animate-top">
        	<div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <div id="login-input-email-pwd">
               <form method="post" id="login-form-input" action="<%=request.getContextPath() %>/loginUser.us">
               		<!-- 이메일로 로그인. loginWay -->
               		<input type="hidden" name="loginWay" value="E"></input>
                   <div id="email_label" class="login_input_label">EMAIL</div>
                   <div id="login-input-email">
                       <input type="text" id="input-email" name="inputEmail" required>
                   </div>
                   <di id="pwd_label" class="login_input_label">PASSWORD</di>
                   <div id="login-input-pwd">
                       <input type="password" id="input-pwd" name="inputPwd" required>
                   </div>
                   <div id="login-input-btn" class="login_btn_area">
                       <button type="submit" id="go-login" class="center login_btn">로그인</button>
                   </div>
               </form>
           </div>
	        
			<!-- 소셜로그인 영역. 카카오, 네이버 -->
	        <div id="social_login">
	            <div id="kakao_area" class="login_btn_area">
	                <img class="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
	                	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_p.png'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png'">
	            </div>
	            <div id="naver_area" class="login_btn_area">
	            	<img id="naverCreateBtn" src="<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG"
	            	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_p.PNG'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG'"></img>
	            </div>
	        </div>
	       
	        <!-- 회원가입, id/pwd 찾기 버튼 영역 -->
	        <div id="login_form_footer">
	            <span id="join_search_btn_area">
	                <button id="btn-join">회원가입</button>
	                <button id="btn-id-pwd-search">ID / PASSWORD 찾기</button>
	            </span>
	        </div>
	    </div>
	    
	    
	    
	    <!-- 회원가입 눌렀을 때 -->
        <div id="agree-form" class="animate-top">
            <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
            
            <div id="terms-of-service">
                <span class="tos_label">이용약관</span>
                <div id="tos_content_area">
                    <textarea id="tos_content" readonly style="resize:none"></textarea>
                </div>
                <div id="tos_agree_area">
                    <input type="radio" name="agree" value="true"> 동의합니다.
                </div>
            </div>

            <div id="join_way">
                <span class="join_way_label">가입수단</span>
                <div id="email_area" class="join_btn_area">
                    <button id="join_email" class="join_btn">이메일</button>
                </div>
                <div id="kakao_area" class="join_btn_area">
                    <img class="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
	                	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_p.png'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png'">
                </div>
                <div id="naver_area" class="join_btn_area">
                    <img id="naverCreateBtn" src="<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG"
	            	onmouseover="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_p.PNG'"
	                		onmouseout="this.src='<%=request.getContextPath() %>/views/image/createNaverBtn_m.PNG'"></img>
                </div>
            </div>
            
        </div>
        
        
		<!-- (이메일로) 회원가입 모달 -->
        <div id="join_form" class="animate_top">
            <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
            <form method="post" action="<%=request.getContextPath() %>/emailJoin.do" id="join_form_input">
                
                <div id="join_input_info">
                    <span id="email_label" class="join_label">EMAIL</span>
                    <span class="chkMsg" id="emailChkMsg"></span>
                    <div id="join_input_pwd" class="join_input_area">
                        <input type="email" class="verify" id="joinEmail" name="joinEmail" required>
                        <button type="button" id="emailChk" class="chkBtn" disabled>인증</button>
                    </div>
                    
                    <span id="pwd_label" class="join_label">PASSWORD</span>
                    <span class="chkMsg" id="pwdRegMsg"></span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="joinPwd" name="joinPwd" required>
                    </div>
                    
                    <span id="pwd_chk_label" class="join_label">PASSWORD 확인</span>
                    <span class="chkMsg" id="pwdChkMsg"></span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="pwdChk" name="pwdChk" required>
                    </div>
                    
                    <span id="name_label" class="join_label">이름</span>
                    <div id="join_input_name" class="join_input_area">
                        <input type="text" class="info" id="joinName" name="joinName" required>
                    </div>
                    
                    
                    <span id="nickName_label" class="join_label">닉네임</span>
                    <span class="chkMsg" id="nickNameChkMsg"></span>
                    <div id="join_input_nickName" class="join_input_area">
                        <input type="text" class="verify" id="nickName" name="nickName" required>
                        <button type="button" id="nickNameChk" class="chkBtn">중복확인</button>
                    </div>

                    <div id="join_btn_area" class="login_btn_area">
                        <button type="submit" id="go_join" class="join_btn">가입하기</button>
                    </div>
                </div>
            
            </form>
        </div>
        
        <!-- ID/PWD 찾기 모달  -->
	    <!-- ID 찾기 창 -->
	    <div class="id_pwd_search_area animate_top">
	        <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <span class="id_pwd_search_header">ID 찾기</span>
	        
	        <div class="id_pwd_search_form">
	            
	            <span class=" id_pwd_search_label">이메일</span>
	            <div id="email_input_area" class="input_area">
	                <input type="text" class="info" id="email" name="id">
	            </div>
	            
	            <div class="verify_area">
	                <span class="msg">메일이 발송되었습니다.</span>
	                <button class="send_mail">메일 발송</button>
	            </div>
	            
	        </div>
	
	        <div class="id_pwd_search_footer">
	            <span class="middle_line"><hr></span>
	            <button id="id_go_loin" class="login_btn">로그인</button>
	        </div>
	        
	    </div>
	    
	    <!-- PASSWORD 찾기 창 -->
	    <div class="id_pwd_search_area animate_top">
	        <div id="loginHeader"><span id="loginClose" onclick="exitLoginModal()">x</span></div>
	        <span class="id_pwd_search_header">PASSWORD 찾기</span>
	        
	        <div class="id_pwd_search_form">
	            
	            <span class=" id_pwd_search_label">ID</span>
	            <div id="id_input_area" class="input_area">
	                <input type="text" class="info" id="id" name="id">
	            </div>
	
	            <span class=" id_pwd_search_label">이메일</span>
	            <div id="email_input_area" class="input_area">
	                <input type="text" class="info" id="email" name="id">
	            </div>
	            
	            <div class="verify_area">
	                <span class="msg">메일이 발송되었습니다.</span>
	                <button class="send_mail">메일 발송</button>
	            </div>
	            
	        </div>
	
	        <div class="id_pwd_search_footer">
	            <span class="middle_line"><hr></span>
	            <button id="pwd_go_loin" class="login_btn">로그인</button>
	        </div>
	        
	    </div>
	    
	    
	</div>
	
	
   <div id="addInfoModal" class="all-area-modal2"> 
    
       <!-- 소셜로그인시 추가정보 입력 모달 -->
		<div class="addInfoPositon">
			<span id="addInfoMsg"> 가입된 카카오 아이디가 없습니다.<br> 정보를 추가로 입력하면 가입이 완료됩니다.</span>
			<div id="addInfoWrap" class="animate-top">
				<!-- 추가정보 입력폼 닫기 버튼 -->
				<div id="addInfoHeader"><span id="addInfoClose" onclick="exitAddInfoModal()">x</span></div>
				
				<div id="addInfoForm">
					<!-- 추가정보 입력폼 -->
					<form id="addForm" method="post" action="<%=request.getContextPath() %>/kakaoJoin.us">
						<input type="hidden" name="socialUserId" value=""></input>
						<input type="hidden" name="socialUserName" value=""></input>
						<span id="add_email_label" class="addInfoLabel">EMAIL</span>
						<span class="addChkMsg" id="addEmailChkMsg">중복 x</span>
						<div id="join_input_pwd" class="add_input_area">
						   <input type="email" class="verify" id="addJoinEmail" name="addJoinEmail" required>
						   <button type="button" id="addEmailChk" class="addChkBtn" disabled>인증</button>
						</div>
						 
						<span id="add_nickName_label" class="addInfoLabel">닉네임</span>
						<span class="addChkMsg" id="addNickNameChkMsg">중복 x</span>
						<div id="join_input_nickName" class="add_input_area">
						   <input type="text" class="verify" id="addNickName" name="addNickName" required>
						   <button type="button" id="addNickNameChk" class="addChkBtn">중복확인</button>
						</div>
						
						<div id="addInfoFooter">
						   <span id="addMiddleLine"><hr></span>
						   <button type="submit" class="addJoinBtn">가입하기</button>  
						</div>
					</form>
				</div>
			  

         </div>
       </div>
    
    </div>
	
	<script>
	// 로그아웃 함수
	function logout() {
		<% if(loginUser != null) {
			if(loginUser.getSign().equals("E"))  { %>
				location.href = "<%=request.getContextPath()%>/logout.me";
			<% } else if(loginUser.getSign().equals("K")) { %>
				Kakao.Auth.logout();
				location.href = "<%=request.getContextPath()%>/logout.me";
			<% } else{ %>
				location.href = "<%=request.getContextPath()%>/logout.me";			
			<% } %>
		<% } %>
	}
	
	// 로그인 버튼을 누르거나 x를 누르면 모달 닫기.
    function exitLoginModal() {
    
        $("#login-modal").css("display","none");
		$("#login-modal form").each(function() {
			this.reset();
		});
		$(".chkMsg, .msg, .addChkMsg").text("");
	}
	// 소셜로그인시 추가정보 입력 모달. x를 누르면 모달 닫기.
    function exitAddInfoModal() {
        document.getElementById('addInfoModal').style.display = 'none';
        $(".addChkMsg").text("");
        $("#addInfoModal form").each(function() {
			this.reset();
		});
	}
	
	/* 
    // 모달 실행시 모달폼 이외의 영역 클릭하면 폼 닫기. 폼 데이터 리셋 
	$(document).on("click", function(e) {
		if($("#login-modal").is(e.target)) {
			$("#login-modal").css("display","none");
			$("#login-modal form").each(function() {
				this.reset();
			});
			$(".chkMsg, .msg, .addChkMsg").text("");
		}
	}); */
	
	
	$(function() {
		
		// 로그인 버튼 누르면 모달 실행. 
		$(".sign_in_btn").click(function() {
		   	$("#login-modal").css("display", "block");
		   	$("#login-form").css("display", "block");
		    $("#agree-form").css("display", "none");
		    $("#join_form").css("display", "none");
		    $(".id_pwd_search_area").css("display", "none");
		    $("#login-modal form").each(function() {
				this.reset();
			});
		    $(".chkMsg, .msg, .addChkMsg").text("");
	    });
		 
		 
	    // 회원가입 버튼 누르면 로그인 화면 사라지고 동의창 나옴. 
	    $("#btn-join").click(function() {
	    	$("#login-form").css("display", "none");
	    	$("#agree-form").css("display", "block");
	    	$("#tos_agree_area").css("color", "gray");
	    });
	    
	    // 이메일로 회원가입 버튼 누르면 동의창 사라지고 이메일 회원가입창 나옴.
	    $("#join_email").click(function() {
	    	var doAgree = $("#tos_agree_area input").is(':checked');
	    			
	    	if(doAgree) {
		    	$("#agree-form").css("display", "none");
		    	$("#join_form").css("display", "block");
		    	$("#emailChk").attr("disabled", true).css("border-style", "none");
	    	} else {
	    		$("#tos_agree_area").css("color", "red");
	    	}
	    });
	    
	    //id/pwd찾기 버튼 눌렀을 때 로그인 창 사라지고 id/pwd 찾기 모달 나옴.
	    $("#btn-id-pwd-search").click(function() {
	    	$("#login-form").css("display", "none");
	    	$(".id_pwd_search_area").css("display", "inline-block");
	    });
	    
	    // id/pwd 찾기 창에서 로그인 버튼 눌렀을 때 찾기 모달 사라지고 로그인 모달 나옴.
	    $(".login_btn").click(function() {
		   	$("#login-form").css("display", "block");
		    $(".id_pwd_search_area").css("display", "none"); 
	    });
   
	    // 카카오로그인 이미지 누르면 카카오 api 실행
    	/* $("#kakaoCreateBtn").click(function() {
    		$("#kakao-login-btn img").click();
    	}); */
    	// 카카오로그인 이미지 누르면 카카오 api 실행
		$(".kakaoCreateBtn").click(function() {
			kakaoLogin();
		});
    	
    	
    	
    	
	    // 네이버로그인 이미지 누르면 네이버 api 실행
    	$("#naverCreateBtn").click(function() {
    		$("#naverIdLogin_loginButton img").click();
    	});
	    
	    
	/* ---------- 이메일로 회원가입 시 필요한 function ----------- */
	    // 회원가입시 필요한 플래그 변수
    	var emailC = false;
		var pwdC = false;
		var pwd2C = false;
		var nickNameC = false;
    	
		// 이메일 입력하면 ajax로 체크 실행.
   		$("#join_form input[name=joinEmail]").on("input", function() {
   			
   			$("#emailChk").attr("disabled", true);
   			// 이메일 형식검사
   			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
			var joinEmail = $("#joinEmail").val().trim();
		
			if(regExp.test(joinEmail)) {
				
				$.ajax({
					url: "<%=request.getContextPath()%>/emailCheck.do",
	    			data: {joinEmail : joinEmail},
	    			type: "get",
					success : function(result) {
						if(result == 0) {
							$("#emailChkMsg").text("사용가능한 아이디입니다.").css({"color":"green", "font-weight":"bold"});
							$("#emailChk").attr("disabled", false).css("border","1px solid yellowgreen");
							emailC = true;
						} else {
							$("#emailChk").attr("disabled", true).css("border-style", "none");
							$("#emailChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
							emailC = false;
						}
					},
					error : function() {
						console.log("aJax 통신 오류");
					}
				});
			} else {
				emailC = false;
				$("#emailChkMsg").text("이메일을 올바르게 기입해주세요.").css({"color":"red", "font-weight":"bold"});
			}
		});
	
   		// 비밀번호 형식 검사
		$("#join_form input[name=joinPwd]").keyup(function() {
			var value = $("#joinPwd").val().trim();
		
			// 숫자, 문자(영어) 포함 형태
			// 6~12 자리 이내
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			
			if(regExp.test(value)) {
				$("#pwdRegMsg").text("비밀번호 형식 O").css("color", "green");
				pwdC = true;
			} else {
				$("#pwdRegMsg").text("비밀번호 형식 X").css("color", "red");
				pwdC = false;
			}
		
		});
	    
   		// 비밀번호 일치 여부 검사
		$("#join_form input[name=joinPwd], input[name=pwdChk]").keyup(function() {
			var pwd = $("#joinPwd").val().trim();
			var pwd2 = $("#pwdChk").val().trim();
			pwd2C = false;
			if(pwd == pwd2) {
				$("#pwdChkMsg").text("비밀번호 일치").css({"color":"green", "font-weight":"bold"});
				pwd2C = true;
			} else {
				$("#pwdChkMsg").text("비밀번호 불일치").css({"color":"red", "font-weight":"bold"});
				pwd2C = false;
			}
		});
   		
   		// 닉네임 중복확인 검사 
   		$("#nickName").keyup(function() {
   			nickNameC = false;
   			$("#nickNameChk").click(function() {
	   			nickNameC = false;
	   			
	   			var value = $("#nickName").val().trim();
	   			
	   			$.ajax({
					url : "<%=request.getContextPath()%>/nickNameCheck.do",
					type : "get",
					data : {nickName : value},
					success : function(result) {
						if(result == 0) {
							$("#nickNameChkMsg").text("사용가능한 닉네임입니다.").css({"color":"green", "font-weight":"bold"});
							nickNameC = true;
						} else {
							$("#nickNameChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
							nickNameC = false;
						}
					},
					error : function(e) {
						console.log("Ajax 통신 실패");
					}
				});
	   		});
   		});
   		
   		// 회원가입 버튼 클릭시 검사
		$("#go_join").click(function() {
			
			// 아이디 형식 검사
			if(!emailC) {
				$("#joinEmail").focus();
				return false;
			}
			if(!pwdC) {
				alert("비밀번호 형식에 맞게 입력해주세요.");
				$("#joinPwd").focus();
				return false;
			}
			if(!pwd2C) {
				$("#pwdChk").focus();
				return false;
			}
			if(!nickNameC) {
				$("#nickName").focus();
				return false;
			}
		});
   		
	
	
    
	/* ---------- 소셜아이디로 회원가입 시 필요한 function ----------- */
	    // 회원가입시 필요한 플래그 변수
		var addEmailC = false;
		var addNickNameC = false;
	    // 이메일 입력하면 ajax로 체크 실행.
		$("#addForm input[name=addJoinEmail]").on("input", function() {
	         
			$("#addEmailChk").attr("disabled", true);
	         // 이메일 형식검사
			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
			var addJoinEmail = $("#addJoinEmail").val().trim();
	
			if(regExp.test(addJoinEmail)) {
				$.ajax({
					url: "<%=request.getContextPath()%>/emailCheck.do",
					data: {joinEmail : addJoinEmail},
					type: "get",
					success : function(result) {
						if(result == 0) {
							$("#addEmailChkMsg").text("사용가능한 이메일입니다.").css({"color":"green", "font-weight":"bold"});
							$("#addEmailChk").attr("disabled", false).css("border","1px solid yellowgreen");
							addEmailC = true;
						} else {
							$("#addEmailChk").attr("disabled", true).css("border-style", "none");
							$("#addEmailChkMsg").text("이미 가입된 이메일입니다.").css({"color":"red", "font-weight":"bold"});
							addEmailC = false;
						}
					},
					error : function() {
						console.log("aJax 통신 오류");
					}
				});
			} else {
				addEmailC = false;
				$("#addEmailChkMsg").text("이메일을 올바르게 기입해주세요.").css({"color":"red", "font-weight":"bold"});
			}
		});
	
	   // 닉네임 중복확인 검사 
	   $("#addNickName").keyup(function() {
	      addNickNameC = false;
	      $("#addNickNameChkMsg").text("");
	      
	      $("#addNickNameChk").click(function() {
	         
	         var addValue = $("#addNickName").val().trim();
	         
	         $.ajax({
		         url : "<%=request.getContextPath()%>/nickNameCheck.do",
		         type : "get",
		         data : {nickName : addValue},
		         success : function(result) {
		            if(result == 0) {
		               $("#addNickNameChkMsg").text("사용가능한 닉네임입니다.").css({"color":"green", "font-weight":"bold"});
		               nickNameC = true;
		            } else {
		               $("#addNickNameChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
		               nickNameC = false;
		            }
		         },
		         error : function(e) {
		            console.log("Ajax 통신 실패");
		         }
		      });
	      });
	   });
	   
	   // 가입 버튼 클릭시 검사
		$("#addJoinBtn").click(function() {
		   
		   // 이메일 형식 검사
		   if(!addEmailC) {
		      $("#addJoinEmail").focus();
		      return false;
		   }
		   
		   // 닉네임 중복검사
		   if(!addNickNameC) {
		      $("#addNickName").focus();
		      return false;
		   }
		});
		   
		/* -------------- 카카오로그인, 회원가입시 필요한 스크립트 ----------------- */
	   //<![CDATA[
	   // 사용할 앱의 JavaScript 키를 설정해 주세요.
	   Kakao.init('<%=kakaoKey%>');
	   function kakaoLogin() {
		
		   Kakao.Auth.loginForm({
		      success : function(authObj) {
		         // 로그인 성공시, API를 호출합니다.
		         Kakao.API.request({
		            url : '/v2/user/me',
		            success : function(res) {
		               
		               var userId = res.id;
		               var userName = res.properties.nickname
		               console.log("userId / " + userId);
		               $.ajax({
		                  url :'<%=request.getContextPath()%>/isSocialUser.us',
		               data : {userId: userId, sign: "K"},
		               type: 'post',
		               success: function(result) {
		                  console.log("회원가입여부 / " + result);
		                  if(result > 0) {
		                     location.href="<%=request.getContextPath()%>/socialLogin.us?userId="+userId+"&sign=K";
		                     } else {
		                        console.log("모달 나오냐 / " + result);
		                        $("#addInfoModal").css("display", "block");
		                        $("input[name=socialUserId]").val(userId);
		                        $("input[name=socialUserName]").val(userName);
		                        console.log("userId: " + userId + " / userName: " + userName)
		                       
		                        if(res.kakao_account.email_needs_agreement == "true" && 
		                              res.kakao_account.email.is_email_verified == "true") {
		                           $("#addJoinEmail").val(res.kakao_account.email).attr("readonly");
		                        }
		                        
		                        
		                     }
		                  }, 
		                  fail: function(err) {
		                     console.log("카카오유저 확인 실패");
		                     console.log(err);
		                  }
		                  
		               });
		               
		            },
		            fail: function(err) {
		               console.log(err);
		            }
		         });
		      },
		      
		      fail: function(err) {
		         console.log(err);
		      }
		        
		   
		   });
		}

	   
	   var naverLogin = new naver.LoginWithNaverId({
	   	clientId : "TyJHkEkL1q5EMX7mTaF3",
	   	callbackUrl : "http://localhost:8080/NORE_DUCK/views/common/naverLoginCallback.jsp",
	   	isPopup : false, /* 팝업을 통한 연동처리 여부 */
	   	loginButton : {
	   		color : "green",
	   		type : 3,
	   		height : 60
	   	}
	   /* 로그인 버튼의 타입을 지정 */
	   });
	   /* 설정정보를 초기화하고 연동을 준비 */
	   naverLogin.init();
	   
	   
	});
	
</script>

    
			<!-- 카카오 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<a id="kakao-login-btn" class="login_btn"></a>
			<!-- 네이버 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<div id="naverIdLogin" class="api_login login_btn" style="display:none"></div>
  
  <%-- <script src="<%=request.getContextPath() %>/views/script/login.js"></script>    
  --%>

</body>
</html>
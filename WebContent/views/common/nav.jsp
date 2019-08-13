<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
    
<%

	// 로그인했을 경우 유저정보
	User loginUser = (User)session.getAttribute("loginUser");
	
	String msg = (String)session.getAttribute("msg"); 
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
        <a class="navbar-brand" href="#">로고자리</a>
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
                    <a class="nav-link nav-hover" href="#">악보신청</a>
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
                    <a class="nav-link nav-hover" href="#">커뮤니티</a>
                    <ul class="detailList detailList2">
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">Q&A</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-margin">
                    <a class="nav-link nav-hover" href="#">연주모임</a>
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
            		onclick="location.href='<%=request.getContextPath()%>/views/mypage/calendar.jsp'">
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
	        
	        <div id="login-input-email-pwd">
               <form method="post" id="login-form-input" action="<%=request.getContextPath() %>/loginUser.us">
               		<!-- 이메일로 로그인. loginWay -->
               		<input type="hidden" name="loginWay" value="E"></input>
                   <div id="email_label" class="login_input_label">EMAIL</div>
                   <div id="login-input-email">
                       <input type="text" id="input-email"
                           name="inputEmail">
                   </div>
                   <di id="pwd_label" class="login_input_label">PASSWORD</di>
                   <div id="login-input-pwd">
                       <input type="password" id="input-pwd"
                           name="inputPwd">
                   </div>
                   <div id="login-input-btn" class="login_btn_area">
                       <button type="submit" id="go-login" class="center login_btn" onclick="exitModalLogin()">로그인</button>
                   </div>
               </form>
           </div>
	        
			<!-- 소셜로그인 영역. 카카오, 네이버 -->
	        <div id="social_login">
	            <div id="kakao_area" class="login_btn_area">
	                <img id="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
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
                    <img id="kakaoCreateBtn" src="<%=request.getContextPath() %>/views/image/createKakaoBtn_m.png"
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
            
            <form method="post" action="<%=request.getContextPath() %>/emailJoin.do" id="join_form_input">
                
                <div id="join_input_info">
                    <span id="email_label" class="join_label">EMAIL</span>
                    <span class="chkMsg" id="emailChkMsg"></span>
                    <div id="join_input_pwd" class="join_input_area">
                        <input type="email" class="verify" id="joinEmail" name="joinEmail">
                        <button type="button" id="emailChk" class="chkBtn" disabled>인증</button>
                    </div>
                    
                    <span id="pwd_label" class="join_label">PASSWORD</span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="joinPwd" name="joinPwd">
                    </div>
                    
                    <span id="pwd_chk_label" class="join_label">PASSWORD 확인</span>
                    <span class="chkMsg" id="pwdChkMsg">일치합니다.</span>
                    <div id="join-input-pwd" class="join_input_area">
                        <input type="password" class="info" id="pwdChk" name="pwdChk">
                    </div>
                    
                    <span id="name_label" class="join_label">이름</span>
                    <div id="join_input_name" class="join_input_area">
                        <input type="text" class="info" id="joinName" name="joinName">
                    </div>
                    
                    
                    <span id="nickName_label" class="join_label">닉네임</span>
                    <div id="join_input_nickName" class="join_input_area">
                        <input type="text" class="verify" id="nickName" name="nickName">
                        <button id="nickNameChk" class="chkBtn">중복확인</button>
                    </div>

                    <div id="join_btn_area" class="login_btn_area">
                        <span id="middle_line"><hr></span>
                        <button type="submit" id="go_join" class="login_btn" onclick="exitModalLogin()">가입하기</button>
                    </div>
                </div>
            
            </form>
        </div>
        
        <!-- ID/PWD 찾기 모달  -->
	    <!-- ID 찾기 창 -->
	    <div class="id_pwd_search_area animate_top">
	        
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
	
	
	<script>
	// 로그아웃 함수
	function logout() {

		location.href = "<%=request.getContextPath()%>/logout.me";
	}
	
	// 로그인 버튼을 누르거나 x를 누르면 모달 닫기.
    function exitModalLogin() {
        document.getElementById('login-modal').style.display = 'none';
    }
	
	$(function() {
		

		
	    // 로그인 버튼 누르면 모달 실행. 
/* 	    function clickActionLogin() { */
		$(".sign_in_btn").click(function() {
		   	$("#login-modal").css("display", "block");
		    $("#agree-form").css("display", "none");
		    $("#join_form").css("display", "none");
		    $(".id_pwd_search_area").css("display", "none");
	/*         document.getElementById("login-modal").style.display = "block";
	        document.getElementById("agree-form").style.display = "none"; */
	        
	    });
	
	    
	    // 회원가입 버튼 누르면 로그인 화면 사라지고 동의창 나옴. 
	    $("#btn-join").click(function() {
	    	$("#login-form").css("display", "none");
	    	$("#agree-form").css("display", "block");
	    });
	    
	    // 이메일로 회원가입 버튼 누르면 동의창 사라지고 이메일 회원가입창 나옴.
	    $("#join_email").click(function() {
	    	$("#agree-form").css("display", "none");
	    	$("#join_form").css("display", "block");
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
    	$("#kakaoCreateBtn").click(function() {
    		$("#kakao-login-btn img").click();
    	});
    	
	    // 네이버로그인 이미지 누르면 네이버 api 실행
    	$("#naverCreateBtn").click(function() {
    		$("#naverIdLogin_loginButton img").click();
    	});
    	
    	// 이메일 입력하면 ajax로 체크 실행.
   		$("#joinEmail").on("input", function() {
   			$("#emailChk").attr("disabled", true);
   			// 이메일 형식검사
   			regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
			var joinEmail = $("#joinEmail").val().trim();
		
			if(regExp.test(joinEmail)) {
				
				$.ajax({
					url: "<%=request.getContextPath()%>/joinEmailVerify.do",
	    			data: {joinEmail : email},
	    			type: "POST",
					success : function(result) {
						if(result == 0) {
							$("#emailChkMsg").text("사용가능한 아이디입니다.").css({"color":"green", "font-weight":"bold"});
							$("#emailChk").attr("disabled", false);
						} else {
							$("#emailChkMsg").text("중복되었습니다.").css({"color":"red", "font-weight":"bold"});
						}
					},
					error : function() {
						console.log("aJax 통신 오류");
					}
				});
			} else {
				$("#emailChkMsg").text("이메일을 올바르게 기입해주세요.").css({"color":"red", "font-weight":"bold"});
			}
		});
 
	});
</script>

    
			<!-- 카카오 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<a id="kakao-login-btn" class="login_btn"></a>
			<!-- 네이버 api로 생성한 로그인 버튼. 보이지 않게 설정. -->
			<div id="naverIdLogin" class="api_login login_btn" style="display:none"></div>
  
  <script src="<%=request.getContextPath() %>/views/script/login.js"></script>    


</body>
</html>
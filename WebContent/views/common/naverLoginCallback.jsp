<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

   String naverClientID = "TyJHkEkL1q5EMX7mTaF3";
   String naverCallbackUrl = "http://localhost:8080/NORE_DUCK/views/common/naverLoginCallback.jsp";

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
* {
    /* border: 1px solid red; */
    padding: 0;
    margin: 0;
}

 .all-area-modal2 {
    width: 100%;
    height: 100%;
    position: fixed;
    z-index: 7;
    background-color: rgba(26, 29, 26, 0.9);
    top: 0;
    left: 0;
    /* display: none; */
    padding-top: 10%;
    /* visibility: hidden; */
    box-sizing: border-box;
}

/*  소셜로그인 추가 입력창 */
.addInfoPositon {
    width: 400px;
    height: 500px;
    margin: 0 auto;
    top: 100px;
}

#addInfoMsg {
    color: white;
    font-size: 15px;
    display: block;
    width: 100%;
    
    font-weight: bold;
    text-align: center;
    margin-bottom: 50px;
}


/*  소셜로그인 추가 입력창 */
#addInfoWrap{
    background-color: white;
    width: 400px;
    height: 250px;
    
    padding: 0;
    border-radius: 5px;
    display: block;

}

#addInfoHeader {
    width: 100%;
    height: 30px;
    background-color: black;
}

#addInfoClose {
    font-size: 20px;
    font-weight: bold;
    color: white;   
    display: block;
    float: right;
    padding: 0;
    margin-right: 5px;
}

#addInfoClose:hover{
    color: red;
    cursor: pointer;
}

/* 추가로 입력받을 이메일, 닉네임 입력폼*/
#addInfoForm{
    width: 100%;
    height: 85%;
    box-sizing: border-box;
    padding: 10px 30px 0 30px;
}



/* 닉네임 레이블 설정 */
.addInfoLabel {
    display: inline-block;
    margin-bottom : 10px;
    color : gray;
    font-weight : bold;
    width: 20%;
    height: 10%;
}

/* 확인 및 인증 메시지 영역 */
.addChkMsg {
    display: inline-block;
    width: 60%;
    height: 10%;
    margin-left: 5%;
    font-weight : bold;
    font-size: 0.8em;
    margin-bottom : 10px;
    padding-left: 10px;
    
}

/* 이메일, 닉네임 인풋 설정 */
.add_input_area{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    margin-bottom: 20px;

} 

/* email, nickName 인풋의 크기, 형태 설정 */
#addInfoForm input {
    padding-left: 5px; 
    width: 70%;
    height: 100%;
    background-color: lightgray;
    border : 0;
    outline : 0;
}

/* 이메일, 닉네임 확인 버튼 */
.addChkBtn{
    width: 20%;
    height: 100%;
    right: 0;
    background-color: lightgray;
    border : 0;
    outline : 0;
    border-radius: 5px;
    color : dimgray;
    font-weight : bold;
    font-size: 0.9em;
    margin-left: 10px;
    float: right;
}

#addInfoFooter {
    width: 100%;
    height: 60px;
}

#addMiddleLine {
    display: block;
    width: 100%;
}

#addMiddleLine hr {
    border: 1px solid gray;
    margin-top: 15px;
    margin-bottom: 15px;
}

.addJoinBtn{
    width: 100%;
    height: 80%;
    background-color: lightgray;
    border : 0;
    outline : 0;
    border-radius: 10px;
    color : dimgray;
    font-weight : bold;
}

/* 모달 공통적인 기능 */
.animate-top{
    position: relative;
    animation: animatetop 0.5s;
}

@keyframes animatetop{
    from{
        opacity: 0;
    }
    to{
        top: 0;
        opacity: 1;
    }
}
/* 모달 설정 종료--------------------------------------------- */


        
</style>
</head>



<body>



   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "<%=naverClientID%>",
            callbackUrl: "<%=naverCallbackUrl%>",
            isPopup: true,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
         }
      );

      /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
      naverLogin.init();

      /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
				console.log(status);
        	 if (status) {
               /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
               console.log(naverLogin.user);
               var email = naverLogin.user.getEmail();
               var name = naverLogin.user.getName();
               var unqId = naverLogin.user.getId();
               if( email == undefined || email == null || name == undefined || name == null) {
                  alert("이메일과 이름은 필수정보입니다. 정보제공을 동의해주세요.");
                  /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
                  naverLogin.reprompt();
                  return;
               } 
               console.log("이메일 : " + email);
               console.log("이름 : " + name);
               console.log("아이디 : " + unqId);
               
               
               $.ajax({
	               url :'<%=request.getContextPath()%>/isSocialUser.us',
	               data : {userId: unqId, sign: 'N'},
	               type: 'post',
	               success: function(result) {
	                  console.log("회원가입여부 / " + result);
	                  if(result > 0) {
	                     location.href="<%=request.getContextPath()%>/socialLogin.us?userId="+unqId+"&sign=N";
                     } else {
                        console.log("모달 나오냐 / " + result);
                        $("#addInfoModal").css("display", "block");
                        $("input[name=socialUserId]").val(unqId);
                        $("input[name=socialUserName]").val(name);
                        $("input[name=addJoinEmail]").val(email);
                        $("input[name=sign]").val("N");
                        
                        console.log("userId: " + unqId + " / userName: " + name)
                       
                     }
                  }, 
                  fail: function(err) {
                     console.log("네이버유저 확인 실패");
                     console.log(err);
                  }
                  
				});
               
			} else {
	              console.log("callback 처리에 실패하였습니다.");
			}
		});
      });
   </script>
   
   
   
   
   
   <!-- 닉네임 설정 위한 모달창 -->
   <div id="addInfoModal" class="all-area-modal2"> 
    
       <!-- 소셜로그인시 추가정보 입력 모달 -->
		<div class="addInfoPositon">
			<span id="addInfoMsg"> 가입된 네이버 아이디가 없습니다.<br> 정보를 추가로 입력하면 가입이 완료됩니다.</span>
			<div id="addInfoWrap" class="animate-top">
				<!-- 추가정보 입력폼 닫기 버튼 -->
				<div id="addInfoHeader"><span id="addInfoClose" onclick="exitAddInfoModal()">x</span></div>
				
				<div id="addInfoForm">
					<!-- 추가정보 입력폼 -->
					<form id="addForm" method="post" action="<%=request.getContextPath() %>/socialJoin.us">
						<input type="hidden" name="socialUserId" value=""></input>
						<input type="hidden" name="socialUserName" value=""></input>
						<input type="hidden" name="addJoinEmail" value=""></input>
						<input type="hidden" name="sign" value=""></input>
						
						<span id="add_nickName_label" class="addInfoLabel">닉네임</span>
						<span class="addChkMsg" id="addNickNameChkMsg"></span>
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
	
	$(function() {
		
		// 소셜로그인시 추가정보 입력 모달. x를 누르면 모달 닫기.
	    function exitAddInfoModal() {
	        document.getElementById('addInfoModal').style.display = 'none';
	        $(".addChkMsg").text("");
	        $("#addInfoModal form").each(function() {
				this.reset();
			});
		}
		
		
	   // 닉네임 중복확인 검사 
	   $("#addNickName").on("input", function() {
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
		   
		   // 닉네임 중복검사
		   if(!addNickNameC) {
		      $("#addNickName").focus();
		      return false;
		   }
		});
	
	});	
	
	
	</script>

</body>
</html>
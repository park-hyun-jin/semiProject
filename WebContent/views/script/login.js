
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('188493ea165a4a41ea7f70b87d9da98c');
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({
   container : '#kakao-login-btn',
   size : 'medium',
   success : function(authObj) {
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
         url : '/v2/user/me',
         success : function(res) {
            
            var userId = res.id;
            console.log("userId / " + userId);
            $.ajax({
               url :'../../isKakaoUser.us',
               data : {userId: userId},
               type: 'post',
               success: function(result) {
                  console.log("회원가입여부 / " + result);
                  if(result > 0) {
                     location.href="../../kakaoLogin.us?userId="+userId;
                  } else {
                     console.log("모달 나오냐 / " + result);
                     $("#addInfoModal").css("display", "block");
                     
                     if(res.kakao_account.email_needs_agreement && 
                           res.kakao_account.email.is_email_verified) {
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
//]]>



var naverLogin = new naver.LoginWithNaverId({
	clientId : "TyJHkEkL1q5EMX7mTaF3",
	callbackUrl : "http://localhost:8080/semi/views/member/callback.jsp",
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

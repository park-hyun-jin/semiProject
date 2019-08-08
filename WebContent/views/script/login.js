
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
				alert(JSON.stringify(res));
				alert(JSON.stringify(authObj));
				location.href="./callback.jsp?name=" + res.properties.nickname + "&email=" + res.properties.email;
			},
			fail : function(error) {
				alert(JSON.stringify(error));
			}
		});
	},
	fail : function(err) {
		alert(JSON.stringify(err));
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

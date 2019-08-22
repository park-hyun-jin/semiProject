package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
	// 부모 클래스에 기본생성자가 존재하지 않기 때문에 상속한 클래스가 부모개체를 매개변수로 받아 생성해주어야 함.
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	public static String getSha512(String userPwd) {
		String encPwd;
		
		// MessageDigest : 지정된 알고리즘에 따라
		//					해시함수를 진행하는 클래스
		// 해시함수 : 입력된 값을 여러 단계의 연산을 거쳐
		//			일정한 길이의 무작위 값을 얻어내는 함수.
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
			// 지정된 알고리즘을 사용해 MessageDigest 객체를 생성하여 반환.
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 암호화 전 전달받은 문자열(비밀번호)을 바이트 배열로 치환
		byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
		
		// md 객체에 userPwd 바이트 배열(bytes)을 전달하여 암호화 진행
		md.update(bytes);
		
		// java.util.Base64 인코더를 이용하여
		// 암호화된 바이트 배열을 문자 형태로 인코딩하여 출력
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}
	
	@Override
	public String getParameter(String key) {
		// request.getParameter("id");
		String value = "";
		
		if(key != null && (key.equals("userPwd") || key.equals("joinPwd2") || key.equals("inputPwd") || key.equals("joinPwd"))) {
			// request에 담긴 파라미터의 key값이
			// userPwd 또는 newPwd인 경우
			// -> 로그인, 회원가입, 비밀번호 변경에 해당.
			value = getSha512(super.getParameter(key));
		} else {
			value = super.getParameter(key);
		}
		
		return value;
	}

}

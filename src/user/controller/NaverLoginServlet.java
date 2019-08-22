package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/naverLogin.us")
public class NaverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NaverLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String unqId = request.getParameter("unqId");
		String thisUrl = request.getParameter("thisUrl");
		
		UserService uService = new UserService();
		
		// 네이버계정으로 회원가입되어 있는지 확인
		int result = uService.isSocialUser(unqId, "N");
		
		User user = null;
		
		// 네이버계정의 프로필정보를 통해 로그인회원의 정보 받아오기
		User joinUser = new User(unqId, email, name, nickname, "N");
		
		String page = "";
		// 네이버계정으로 회원가입이 되어 있다면 db애서 유저정보 가져옴.
		if(result > 0) {
			user = uService.socialLoginUser(unqId, "N");
			request.getSession().setAttribute("loginUser", user);
			response.sendRedirect(thisUrl);
			System.out.println("가입되어 있음");
		} else {
			
			// 네이버계정으로 회원가입이 되어 있지 않다면 해당 이메일로 가입이 되어있는지 확인, 가입정보 없으면 회원가입 후 바로 로그인.
			result = uService.emailCheck(email);
			System.out.println("네이버계정 로그인 정보 없음.");
			if(result > 0) {
				System.out.println("해당 이메일로 가입되어 있음.");
				request.getSession().setAttribute("msg", "이미 가입된 이메일입니다.");
			} else {
				// 가입성공했다면 바로 로그인.
				System.out.println("회원가입");
				result = uService.socialJoin(joinUser);
				
				if(result > 0) {
					System.out.println("가입성공");
					user = uService.socialLoginUser(unqId, "N");
					request.getSession().setAttribute("loginUser", user);
					response.sendRedirect(thisUrl);
				} else {
					System.out.println("가입실패");
					request.setAttribute("msg", "회원가입실패");
					request.getRequestDispatcher(request.getContextPath()+"/views/common/errorPage.jsp").forward(request, response);
				}
			}
		}
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

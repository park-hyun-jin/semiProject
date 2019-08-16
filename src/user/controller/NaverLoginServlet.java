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
		
		UserService uService = new UserService();
		
		int result = uService.isSocialUser(unqId, "N");
		
		User user = null;
		User joinUser = new User(unqId, email, name, nickname, "N");
		// 네이버계정으로 회원가입이 되어 있다면 유저정보 가져옴.
		if(result > 0) {
			user = uService.socialLoginUser(unqId, "N");
		} else {
			// 네이버계정으로 회원가입이 되어 있지 않다면 해당 이메일로 가입이 되어있는지 확인
			result = uService.emailCheck(email);

			if(result > 0) {
				request.getSession().setAttribute("msg", "이미 가입된 이메일입니다.");
				response.sendRedirect(request.getContextPath());
			} else {
				// 가입성공했다면 바로 로그인.
				result = uService.socialJoin(user);
				
				if(result > 0) {
					user = uService.socialLoginUser(unqId, "N");
				} else {
					request.setAttribute("msg", "회원가입실패");
					request.getRequestDispatcher(request.getContextPath()+"/views/common/errorPage.jsp").forward(request, response);
				}
			}
		}
		
		request.getSession().setAttribute("loginUser", user);
		response.sendRedirect(request.getContextPath());
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

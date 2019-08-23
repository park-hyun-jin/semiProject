package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet(urlPatterns="/loginUser.us", name="LoginEmailUserServlet")
public class LoginEmailUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginEmailUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String inputEmail = request.getParameter("inputEmail");
		String inputPwd = request.getParameter("inputPwd");
		String loginWay = request.getParameter("loginWay");
		String thisUrl = request.getParameter("thisUrl");
		User loginUser = new User(inputEmail, inputPwd, loginWay);
	
	
		loginUser = new UserService().loginUser(loginUser);
	
		HttpSession session = request.getSession();
		
		session.setMaxInactiveInterval(3600); // 단위 : per sec
		if(loginUser != null) {
			
			session.setAttribute("loginUser", loginUser);
			
			
		} else {
			session.setAttribute("msg", "아이디 혹은 비밀번호가 잘못 입력되었습니다.");
		}
		response.sendRedirect(thisUrl);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

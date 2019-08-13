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

@WebServlet("/loginUser.us")
public class LoginEmailUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginEmailUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String inputEmail = request.getParameter("inputEmail");
		String inputPwd = request.getParameter("inputPwd");
		char loginWay = request.getParameter("loginWay").charAt(0);
		
		User loginUser = new User(inputEmail, inputPwd, loginWay);
	
	
		loginUser = new UserService().loginUser(loginUser);
	
	
		if(loginUser != null) {
			HttpSession session = request.getSession();
			
			session.setMaxInactiveInterval(3600); // 단위 : per sec
			
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath());
			
		} else {
			request.setAttribute("msg", "로그인 실패");
			response.sendRedirect(request.getContextPath());
			
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

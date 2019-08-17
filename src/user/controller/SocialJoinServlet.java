package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/socialJoin.us")
public class SocialJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SocialJoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("socialUserId"));
		String userName = request.getParameter("socialUserName");
		String userEmail = request.getParameter("addJoinEmail");
		String userNickName = request.getParameter("addNickName");
		String userSign = request.getParameter("sign");
		User joinUser =  new User(userId, userEmail, userName, userNickName, userSign);
		
		
		
		System.out.println(joinUser);
		int result = new UserService().socialJoin(joinUser);
		System.out.println(result);
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/socialLogin.us?userId="+userId);
		} else {
			request.setAttribute("msg", "소셜회원가입 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

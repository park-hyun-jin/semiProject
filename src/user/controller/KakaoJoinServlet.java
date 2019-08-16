package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

@WebServlet("/kakaoJoin.us")
public class KakaoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoJoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("socialUserId");
		String userName = request.getParameter("socialUserName");
		String userEmail = request.getParameter("addJoinEmail");
		String userNickName = request.getParameter("addNickName");
		
		System.out.println("userID: " + userId + " / userName : " + userName + " / userEmail : " + userEmail + " / userNickName: " + userNickName);

		int result = new UserService().kakaoJoin(userId, userName, userEmail, userNickName);
		System.out.println(result);
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/kakaoLogin.us?userId="+userId);
		} else {
			request.setAttribute("msg", "카카오회원가입 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

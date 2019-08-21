package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/userBoardList.my")
public class userBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userBoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		int uNo = loginUser.getuNo();
		// DB에서 아이디가 일치하는 회원 정보 읽어오기
		UserService uService = new UserService();
		
		User user = uService.selectUser(uNo);
		
		// DB 조회 결과에 따라 view 연결 처리

		request.setAttribute("user", user);
		request.getRequestDispatcher("views/mypage/myPageBoard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

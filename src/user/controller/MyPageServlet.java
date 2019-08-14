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


@WebServlet("/myPage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyPageServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션을 이용하여 id값 가져오기
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		int uNo = loginUser.getuNo();
		// DB에서 아이디가 일치하는 회원 정보 읽어오기
		UserService uService = new UserService();
		
		User user = uService.selectUser(uNo);
		ArrayList<Integer> pointList = uService.getPoint(uNo);
		
		// DB 조회 결과에 따라 view 연결 처리
		RequestDispatcher view = null;

		if(user != null) {
			view = request.getRequestDispatcher("views/mypage/calendar.jsp");
			request.setAttribute("pointList", pointList);
			request.setAttribute("user", user);
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "회원 정보 조회 실패");
			
		}
		
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

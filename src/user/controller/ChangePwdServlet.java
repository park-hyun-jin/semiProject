package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import user.model.dao.UserDao;
import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/changePwd.me")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ChangePwdServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pwd = request.getParameter("joinPwd2");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int uNo = loginUser.getuNo();
		UserService uService = new UserService();
		User user = uService.selectUser(uNo);
		int result = uService.changePwd(uNo, pwd);
		
		if(result > 0) {
			request.setAttribute("user", user);
			request.getRequestDispatcher("views/mypage/myPageInfo.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "게시글 수정 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

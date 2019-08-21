package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/quit.me")
public class QuitUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QuitUserServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int uNo = loginUser.getuNo();
		int result = new UserService().quitUser(uNo);
		
		if(result > 0) {
			request.setAttribute("msg", "사요나라.. "+ loginUser.getNickName());
			
			
			response.sendRedirect(request.getContextPath());
			request.getSession().invalidate(); // 세션 무효화
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

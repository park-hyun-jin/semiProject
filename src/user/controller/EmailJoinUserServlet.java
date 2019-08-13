package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/emailJoin.do")
public class EmailJoinUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmailJoinUserServlet() {
    	super();
    	
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("UTF-8");
	      
    	String sign = "E";
	    String email = request.getParameter("joinEmail");
	    String userPwd = request.getParameter("joinPwd");
	    String userName = request.getParameter("joinName");
	    String nickName = request.getParameter("nickName");
	   
	    User joinUser = new User(email, userPwd, userName, nickName, sign);

	    int result = new UserService().emailJoin(joinUser);
	    
	    if(result > 0) {
	    	request.getSession().setAttribute("msg", "회원가입성공");
	    } else {
	    	request.getSession().setAttribute("msg",  "가입실패. 다시 시도해주세요.");
	    }
	    
	    response.sendRedirect(request.getContextPath());
	    	
	      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

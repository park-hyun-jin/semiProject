package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

@WebServlet("/joinEmailVerify.do")
public class JoinEmaillVerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinEmaillVerifyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String joinEmail = request.getParameter("joinEmail");
		int result = new UserService().checkEmail(joinEmail);
		System.out.println(joinEmail);
		
		if(result>0) {
			response.getWriter().print(result);
		} else {
			
		}
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

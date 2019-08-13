package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

@WebServlet("/emailCheck.do")
public class JoinEmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinEmailCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String joinEmail = request.getParameter("joinEmail");
		int result = new UserService().checkEmail(joinEmail);
		
		response.getWriter().print(result);

	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

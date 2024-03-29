package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/pointUpdate.me")
public class PointUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PointUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uNo = Integer.parseInt(request.getParameter("uNo"));
		
		int point = Integer.parseInt(request.getParameter("point"));
		String summary = request.getParameter("summary");

		int result = new UserService().updatePoint(uNo, point, summary);

		response.getWriter().print(result);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

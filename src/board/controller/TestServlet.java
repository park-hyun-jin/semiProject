package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/test.bo")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TestServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int uNo = loginUser.getuNo();
		
		User user = new UserService().selectUser(uNo);
		RequestDispatcher view = null;

		if(user != null) {
			view = request.getRequestDispatcher(request.getContextPath()+"/views/sheet_share/sheetShareFormIframe.jsp");
			request.setAttribute("user", user);
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
					
		}
		
		view.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

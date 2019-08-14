package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.vo.User;
@WebServlet("/playgroupWrite.in")
public class playgroupInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public playgroupInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String header = request.getParameter("header");
		String bTitle = request.getParameter("BTITLE");
		String bContent =request.getParameter("content");
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		int writer = loginUser.getuNo();
		
		Board board = new Board();
		board.setheader(header);
		board.setbTitle(bTitle);
		board.setbContent(bContent);
		board.setwriter(writer+"");
		
		

		int result = new BoardService().insertPlayGroup(board);


		if(result>0) { // insert 성공시
			// 어떤 페이지, 어떤 url 사용할지 생각  메세지도 전달할지 생각
			request.getSession().setAttribute("msg", "디비 등록 성공 ");
			response.sendRedirect(request.getContextPath() + "/playgroupWrite.li");
		}else {
			request.setAttribute("msg", " 등록 실패 ");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response); // 'http://localhost:8080/jspProject/'
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

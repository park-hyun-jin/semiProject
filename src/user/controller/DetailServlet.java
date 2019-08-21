package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.service.UserService;


@WebServlet("/detail.bo")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DetailServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("bno" + request.getParameter("bNo"));
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		Board board  = new UserService().selectBoard(bNo);
		
		String page ="";
		
		if(board != null) {
			page = "views/board/myPageBoard.jsp";
			request.setAttribute("board", board);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세조회 에러");
		}
		//request.getRequestDispatcher(page).forward(request, response);
		
	}
		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

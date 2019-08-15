package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

@WebServlet("/playgroupWrite.li")
public class playgroupListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public playgroupListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ArrayList<Board> playgroup = new BoardService().selectPlaygroup();
		String page="";

		if(playgroup!=null) { // 정상적으로 조회된 경우
			page = "views/play_group/playgroupList.jsp";
			request.setAttribute("playgroup", playgroup);
			
		}else { // 조회가 되지 않은 경우
			page = "views/common/errorPage.jsp";
			request.setAttribute("mag", "공지사항 조회중 문제 발생");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

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
		
		BoardService playgroup = new BoardService();
		
		int boardCount = playgroup.getplaygroupCount();
		
		int limit = 10; 		
		int pagingBarSize=10; 	
		
		int currentPage = 0; 	
		int maxPage = 0; 	 	 
		int startPage = 0;		
		int endPage=0;			
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		maxPage = (int)Math.ceil((double)boardCount / limit);
		 maxPage = (maxPage == 0) ? 1 : maxPage;

		startPage = ((currentPage-1) /  limit)*pagingBarSize+1;
		
		endPage = startPage + pagingBarSize -1;
		if(maxPage <= endPage) {
			endPage = maxPage; 
		}
		
		PageInfo pInf = new PageInfo(boardCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		ArrayList<Board> playgroupList = playgroup.selectPlaygroup(currentPage,limit);
		
		String page="";
		
		if(playgroupList!=null) { // 정상적으로 조회된 경우
			page = "views/play_group/playgroupList.jsp";
			request.setAttribute("playgroupList", playgroupList);
			request.setAttribute("pInf", pInf);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 목록 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
//		ArrayList<Board> playgroup = new BoardService().selectPlaygroup();
//		String page="";
//		
//		if(playgroup!=null) { // 정상적으로 조회된 경우
//			page = "views/play_group/playgroupList.jsp";
//			request.setAttribute("playgroup", playgroup);
//			
//		}else { // 조회가 되지 않은 경우
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("mag", "공지사항 조회중 문제 발생");
//		}
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

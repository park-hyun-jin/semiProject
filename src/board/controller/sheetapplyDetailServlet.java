package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

@WebServlet("/sheetapplyWrite.de")
public class sheetapplyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sheetapplyDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		
		BoardService sheetapplyService = new BoardService();
		
		Board board = sheetapplyService.selectSheetApply(bNo);
		
		RequestDispatcher view = null;
		String page = "";
		
		if(board != null) { // 해당 글이 존재하는 경우
			
				page = "views/sheet_apply/sheetapplyDetail.jsp";
				request.setAttribute("board", board);
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세 조회 중 에러 발생");
		}
		
		view =request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

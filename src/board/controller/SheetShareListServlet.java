package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;


@WebServlet("/sheetShare.bo")
public class SheetShareListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SheetShareListServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String head = request.getParameter("headValue");
		String keyword = request.getParameter("keyword");
		if(keyword == null) keyword = ""; 
		BoardService bService = new BoardService();
		if(head == null) head = "100";
		int searchCount = bService.searchSheet(head, keyword);
		
		int limit = 10;
		int pagingBarSize=10;
		
		int currentPage = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage=0;
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		maxPage = (int)Math.ceil((double)searchCount / limit);
		 maxPage = (maxPage == 0) ? 1 : maxPage;

		startPage = ((currentPage-1) /  limit)*pagingBarSize+1;
		
		endPage = startPage + pagingBarSize -1;
		if(maxPage <= endPage) {
			endPage = maxPage; 
		}
		
		PageInfo pInf = new PageInfo(searchCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		ArrayList<Board> SheetList = bService.SheetList(head, keyword, currentPage, limit);
		
		String page="";
		
		if(SheetList!=null) { // 정상적으로 조회된 경우
			page = "views/sheet_share/sheetShareList.jsp?headValue=" + head + "&keyword=" + keyword;
			request.setAttribute("SheetList", SheetList);
			request.setAttribute("pInf", pInf);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 목록 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

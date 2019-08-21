package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

@WebServlet("/boardList.ad")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		AdminService aService = new AdminService();
		int boardCount = aService.getBoardCount(uno);
		
		int limit = 10; 		// 한 페이지에 보여질 게시글 수
		int pagingBarSize = 10; // 보여질 페이징바의 페이지 개수
		
		int currentPage = 0;	// 현재 페이지 번호를 표시할 변수
		int maxPage = 0; 		// 전체 페이지에서 가장 마지막 페이지
		int startPage = 0; 		// 페이징바 시작 페이지 번호
		int endPage = 0; 		// 페이징바 끝 페이지 번호
		
		// currentPage - 현재 페이지 번호를 표시할 변수
		if(request.getParameter("currentPage") == null) {
			// 처음 게시판 목록으로 화면 전환 시 1페이지가 보이도록 함.
			currentPage = 1;
		} else {
			// 아닌 경우, 현재 currnetPage값을 전달 받음.
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)Math.ceil((double)boardCount / limit);
		
		startPage = ((currentPage-1) / limit) * pagingBarSize + 1;
		
		endPage = startPage + pagingBarSize - 1;
		endPage = (endPage > maxPage) ? maxPage : endPage;
		
		PageInfo pInf = new PageInfo(boardCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		ArrayList<Board> list = aService.boardList(uno, currentPage, limit);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bList", list);
		map.put("pInf", pInf);
		
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(map, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

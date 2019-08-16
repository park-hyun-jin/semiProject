//package board.controller;
//
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import board.model.service.BoardService;
//import board.model.vo.Board;
//
//
//@WebServlet("/playgroupWrite.de")
//public class playgroupDetailServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//    public playgroupDetailServlet() {
//        super();
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		int bNo = Integer.parseInt(request.getParameter("bNo"));
//		
//		// NoticeService를 여러번 사용하기 위해 미리 객체 생성
//		BoardService playgroupService = new BoardService();
//		
//		Board board = playgroupService.seletePlayGroup(bNo);
//		
//		RequestDispatcher view = null;
//		String page = "";
//		// 조회 성공 시 조회수를 증가시키고 view 연결 처리
//		
//		if(board != null) { // 해당 글이 존재하는 경우
//			
//				page = "views/play_group/playgroupDetail.jsp";
//				request.setAttribute("board", board);
//			
//		} else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "공지사항 상세 조회 중 에러 발생");
//		}
//		
//		view =request.getRequestDispatcher(page);
//		view.forward(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//}

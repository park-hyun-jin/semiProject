//package board.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import board.model.service.BoardService;
//import board.model.vo.Board;
//@WebServlet("/playgroupWriteForm.up")
//public class playgroupUpdateFormServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//    public playgroupUpdateFormServlet() {
//        super();
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int bNo = Integer.parseInt(request.getParameter("bNo"));
//		
//		Board board = new BoardService().seletePlayGroup(bNo);
//		
//		String page= "";
//		if(board != null) {
//			page = "views/play_group/playgroupUpdate.jsp";
//			request.setAttribute("board", board);
//		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "수정할 게시글을 불러오는 과정에서 오류 발생");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
//		
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//}

package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

@WebServlet("/sheetapplyWrite.up")
public class sheetapplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sheetapplyUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board sheetapplyboard = new Board();
		
		sheetapplyboard.setbNo(Integer.parseInt(request.getParameter("bNo")));
		sheetapplyboard.setheader(request.getParameter("header"));
		sheetapplyboard.setbTitle(request.getParameter("BTITLE"));
		sheetapplyboard.setbContent(request.getParameter("content"));
		
		int result = new BoardService().updateSheetApply(sheetapplyboard);
		
		if(result >0) {
			request.getSession().setAttribute("msg", "게시글이 수정되었습니다");
			response.sendRedirect("sheetapplyWrite.de?bNo=" + sheetapplyboard.getbNo());
		}else {
			request.setAttribute("msg", "수정 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

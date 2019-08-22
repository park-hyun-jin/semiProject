package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;


@WebServlet("/boardWrite.up")
public class boardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public boardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Board playgroupboard = new Board();
		
		playgroupboard.setbNo(Integer.parseInt(request.getParameter("bNo")));
		playgroupboard.setbTitle(request.getParameter("BTITLE"));
		playgroupboard.setbContent(request.getParameter("content"));
		
		int result = new BoardService().updatBoardGroup(playgroupboard);
		
		if(result >0) {
			request.getSession().setAttribute("msg", "게시글이 수정되었습니다");
			response.sendRedirect("boardgroupWrite.de?bNo=" + playgroupboard.getbNo());
		}else {
			request.setAttribute("msg", "수정 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

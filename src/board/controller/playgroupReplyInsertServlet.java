package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Reply;

@WebServlet("/playgroupReply.in")
public class playgroupReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public playgroupReplyInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo  = Integer.parseInt(request.getParameter("uNo"));
		String rContent = request.getParameter("content");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		rContent = rContent.replace("\n","<br>");
		Reply r = new Reply(rContent, bNo);
		
		int result = new BoardService().playgroupReplyInsert(r, userNo);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

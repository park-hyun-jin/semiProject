package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Report;

@WebServlet("/freeBoarddangerWrite.in")
public class freeBoardDangerWriteInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public freeBoardDangerWriteInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int userNo  = Integer.parseInt(request.getParameter("uNo"));
		String rpContent = request.getParameter("rpContent");
		
		Report report = new Report(rpContent, bNo, userNo);
		
		int result = new BoardService().dangerWriteInsert(report);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

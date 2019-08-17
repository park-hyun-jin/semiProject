package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;


@WebServlet("/detail.bo")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DetailServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		Board board  = new BoardService().selectBoard(bNo);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

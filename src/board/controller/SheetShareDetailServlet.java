package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Note;


@WebServlet("/SheetShareDetailServlet")
public class SheetShareDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SheetShareDetailServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("BNO"));
		BoardService bService = new BoardService();
		Note note = bService.selectSheetSharePdf(bNo);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

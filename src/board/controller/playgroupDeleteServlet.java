package board.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;



@WebServlet("/playgroupWrite.del") 
public class playgroupDeleteServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	public playgroupDeleteServlet() { 
		super(); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int result = new BoardService().deletePlayGroup(bNo);
		if(result >0) { 
			request.getSession().setAttribute("msg", "게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/playgroupWrite.li"); 
		}else { 
			request.setAttribute("msg", "삭제 오류"); 
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doGet(request, response); 
	}
 
}

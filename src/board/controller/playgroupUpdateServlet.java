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


@WebServlet("/playgroupWrite.up")
public class playgroupUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public playgroupUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Board playgroupboard = new Board();
		
		playgroupboard.setbNo(Integer.parseInt(request.getParameter("bNo")));
		playgroupboard.setheader(request.getParameter("header"));
		playgroupboard.setbTitle(request.getParameter("BTITLE"));
		playgroupboard.setbContent(request.getParameter("content"));
		// 수정한 것들을 가져와서 담아서 updatePlayGroup 보내~ 요것만 업데이트 할 것이다.
		int result = new BoardService().updatePlayGroup(playgroupboard); 
		
		// int 면 개수가 1개냐 0개냐 0개 이상이면 업데이트가 된거다. 
		
		if(result >0) {
			request.getSession().setAttribute("msg", "게시글이 수정되었습니다"); // 알려주고 
			response.sendRedirect("playgroupWrite.de?bNo=" + playgroupboard.getbNo()); // 옮길거야 디테일에 어떤 글번호에 게시글이 수정되었는지 너한테 보여줄거야~ 
			// 수정된 게시글을 글번호를 통해서 뿌려줄려고  
		}else {
			request.setAttribute("msg", "수정 에러"); 
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

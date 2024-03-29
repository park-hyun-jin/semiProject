package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dao.BoardDao;
import user.model.service.UserService;


@WebServlet("/deleteMyBoardList.bo")
public class DeleteList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteList() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		
		String deleteBoards = request.getParameter("deleteBoards");
		
		int result = new UserService().deleteCheck(deleteBoards);
		
		String page="";
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+ "/myPageList.me");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 삭제 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

@WebServlet("/detailBoard.ad")
public class DetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int bType = new AdminService().selectbType(bno);
		String page = "";
		switch(bType) {
		
		case 1 : 
		case 2 : 
		case 3 : 
		case 4 : 
		case 5 : break;
		case 6 : page = "/playgroupWrite.de?bNo="+bno; break;
		default : request.setAttribute("msg", "게시글 상세보기 오류"); page = "/views/common/errorPage.jsp"; 
		}
		
		
		if(page.equals("")) response.sendRedirect(request.getContextPath());
		else request.getRequestDispatcher(page).forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

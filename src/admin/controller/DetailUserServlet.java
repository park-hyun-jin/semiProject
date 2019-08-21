package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import user.model.vo.Artist;
import user.model.vo.User;

@WebServlet("/detailUser.ad")
public class DetailUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno = Integer.parseInt(request.getParameter("uno"));
	
		User user = new AdminService().selectUser(uno);
		Artist artist = new AdminService().selectArtist(uno);
		String page = ""; 
		if(user != null) {
			request.setAttribute("user", user);
			if(artist != null) 
				request.setAttribute("artist", artist);
				
			page = "/views/admin/user_management/userManagement.jsp";
		} else {
			request.setAttribute("msg", "유저정보 조회 실패");
			page = "/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import board.model.vo.Board;
import board.model.vo.Report;
import cash.model.vo.Imp;

@WebServlet("/updatedInfo.ad")
public class UpdatedInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatedInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService aService = new AdminService();
		
		ArrayList<Imp> impList = aService.getUpdatedImpList();
		ArrayList<Board> boardList = aService.getUpdatedBoardList();
		ArrayList<Report> reportList = aService.getUpdatedReportList();
		
		request.setAttribute("impList", impList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("reportList", reportList);
		String page = "/views/admin/adminMain.jsp";
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

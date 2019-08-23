package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

 import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 import admin.model.service.AdminService;

 import board.model.vo.PageInfo;
import board.model.vo.Report;

 @WebServlet("/ReportBoard.de")
public class ReportBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

     public ReportBoardServlet() {
        super();
    }

 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서비스 객체 생성
				AdminService aService = new AdminService();

 				// ----------------페이징 처리 ----------------

 				// 전체 게시글 수 구하기
				int reportCount = aService.getReportCount();

 				// 페이징 처리용 변수 선언
				int limit = 10; 		// 한 페이지에 보여질 게시글 수
				int pagingBarSize = 10; // 보여질 페이징바의 페이지 개수

 				int currentPage = 0;	// 현재 페이지 번호를 표시할 변수
				int maxPage = 0; 		// 전체 페이지에서 가장 마지막 페이지
				int startPage = 0; 		// 페이징바 시작 페이지 번호
				int endPage = 0; 		// 페이징바 끝 페이지 번호


 				if(request.getParameter("currentPage") == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}

 				maxPage = (int)Math.ceil((double)reportCount / limit);

 				startPage = ((currentPage-1) / limit) * pagingBarSize + 1;

 				endPage = startPage + pagingBarSize - 1;
				endPage = (endPage > maxPage) ? maxPage : endPage;

 				PageInfo pInf = new PageInfo(reportCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
				ArrayList<Report> reportList = aService.reportSelectList(currentPage, limit);

 				String page = "";
				if(reportList != null) {
					page = "views/admin/report_management/reportForm.jsp";

 					request.setAttribute("reportList",  reportList);
					request.setAttribute("pInf",  pInf);

 				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 목록 조회 실패");
				}
				request.getRequestDispatcher(page).forward(request, response);

 	}

 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

 }
package board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Note;
import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/pdfDownload.bo")
public class PdfDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PdfDownloadServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nNo = Integer.parseInt(request.getParameter("nNo"));
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		int uNo = loginUser.getuNo();
		UserService uService = new UserService();
		User user = uService.selectUser(uNo);
		
		BoardService bService = new BoardService();
		Note note = bService.pdfDownload(nNo);
		int result = 0;
		RequestDispatcher view = null;
		if(note!=null) {
			if(note.getDivide().equals("P")) {
				result = bService.usePoint(note.getnPrice(), uNo);
			}else {
				result = bService.useCash(note.getnPrice(), uNo);
			}
			if(result>0) {
				ServletOutputStream downOut = response.getOutputStream();
				
				// 2. 연결된 스트림을 통해서 내보낼 File 객체 생성
				File downFile = new File(note.getFilePath() + note.getChangeName());
				
				// 3. 선택한 파일을 내보내기위한 스트림 연결
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
				
				// 4. 다운로드 시 원래 파일명으로 다운로드 할 수 있도록 처리
				response.setHeader("Content-Disposition", "attachment; filename=\"" 
				+ new String(note.getOriginName().getBytes("UTF-8"),"ISO-8859-1") + "\"");
				
				response.setContentLength((int)downFile.length());
								
				// 6. 스트림을 통해서 출력
				int readBytes = 0;
				while((readBytes = bis.read()) != -1) {
					downOut.write(readBytes);
				}
				
				// 7. 사용한 스트림 자원 반환
				bis.close();
				downOut.close();
			}else {
				view = request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			
			
			
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		view.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

package board.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Note;
import common.MyFileRenamePolicy;
import user.model.vo.User;


@WebServlet("/sheetShareWrite.bo")
public class SheetShareWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SheetShareWriteServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*100; 


			String root= request.getServletContext().getRealPath("/");
			String savePath = root+"sheetPdf\\";
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			int uNo = ((User)request.getSession().getAttribute("loginUser")).getuNo();	
			String header = multiRequest.getParameter("header");
			String title = multiRequest.getParameter("board_title");
			String content = multiRequest.getParameter("content");
			
			String price = multiRequest.getParameter("price");

			int nPrice = 0;
			String nDivide = null;
			if(price.equals("point")) {
				nPrice = 150;
				nDivide = "P";
			}else {
				nPrice = Integer.parseInt(price);
				nDivide = "C";
			}
			String[] nContent = multiRequest.getParameterValues("msInfo_comp");

			
			Board board = new Board(title, content, "1", header, uNo+"");
			
			BoardService bService = new BoardService();
			
			
			Enumeration<String> files = multiRequest.getFileNames();
			String saveFile = null; // 저장될 파일이름
			String originFile = null; // 파일 원본 이름

			
			if(files.hasMoreElements()) { // 요소를 가지고 있냐
				String name = files.nextElement();
				// 파일 이름만 넘어오고 내용이 넘어오지 않는 경우 방지 
				if(multiRequest.getFilesystemName(name) != null) { //파일명+파일 제대로 넘어 왓을때 
					saveFile = multiRequest.getFilesystemName(name); // 변환된 이름의 파일
					originFile = multiRequest.getOriginalFileName(name);
				}
			}
			
			int result = 0;
			if(saveFile!=null) {
				Note note = new Note(originFile, saveFile, savePath, nContent[0], nContent[1], nContent[2], nContent[3], nDivide, nPrice);
				result = bService.insertPdfBoard(board, note);
			}
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/sheetShare.bo");
			}else {
				request.setAttribute("msg", "게시글 작성 에러");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		
	
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

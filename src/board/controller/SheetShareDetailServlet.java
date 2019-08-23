package board.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Note;
import user.model.service.UserService;
import user.model.vo.User;


@WebServlet("/sheetShareDetail.de")
public class SheetShareDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SheetShareDetailServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		int uNo = loginUser.getuNo();
		// DB에서 아이디가 일치하는 회원 정보 읽어오기
		UserService uService = new UserService();
		
		User user = uService.selectUser(uNo);
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		BoardService bService = new BoardService();
		Note note = bService.selectSheetSharePdf(bNo);
		
		String pdfFilename = "C:\\git\\semiProjectLocal\\semiProject\\WebContent\\sheetPdf\\"+note.getChangeName();
		System.out.println(pdfFilename);
		PDDocument document = PDDocument.load( new File( pdfFilename ) );

		PDFRenderer pdfRenderer = new PDFRenderer( document );


		BufferedImage bim = pdfRenderer.renderImageWithDPI( 0, 100, ImageType.RGB );

		// suffix in filename will be used as the file format

		ImageIOUtil.writeImage( bim, pdfFilename + ".png", 100 );

		document.close();
		
		Board board = bService.detailSheetShareBoard(bNo);
		
		RequestDispatcher view = null;
		String page = "";
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("msg", "로그인을 해주세요");
			response.sendRedirect(request.getContextPath());
		} else {
		
			if(board != null) { // 해당 글이 존재하는 경우
				page = "views/sheet_share/sheetShareDetail.jsp";
				request.setAttribute("board", board);
				request.setAttribute("note", note);
				request.setAttribute("user", user);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "상세 조회 중 에러 발생");
			}
			
			view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

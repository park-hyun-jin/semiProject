package board.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Note;


@WebServlet("/SheetShareDetailServlet")
public class SheetShareDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SheetShareDetailServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("BNO"));
		BoardService bService = new BoardService();
		Note note = bService.selectSheetSharePdf(bNo);
		
		String pdfFilename = request.getContextPath()+"/sheetPdf/"+note.getChangeName();

		PDDocument document = PDDocument.load( new File( pdfFilename ) );

		PDFRenderer pdfRenderer = new PDFRenderer( document );

		System.out.println( "전체페이지 수 : " + document.getNumberOfPages() );

		BufferedImage bim = pdfRenderer.renderImageWithDPI( 0, 100, ImageType.RGB );

		// suffix in filename will be used as the file format

		ImageIOUtil.writeImage( bim, pdfFilename + ".png", 100 );

		document.close();
		
		Board board = bService.detailSheetShareBoard(bNo);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

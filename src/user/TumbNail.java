package user;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

public class TumbNail {
	
	public void tumbnail() throws IOException{
		String pdfFilename = "C:\\dev\\m54667_Paint_Your_World.pdf";

		PDDocument document = PDDocument.load( new File( pdfFilename ) );

		PDFRenderer pdfRenderer = new PDFRenderer( document );

		System.out.println( "전체페이지 수 : " + document.getNumberOfPages() );

		BufferedImage bim = pdfRenderer.renderImageWithDPI( 0, 100, ImageType.RGB );

		// suffix in filename will be used as the file format

		ImageIOUtil.writeImage( bim, pdfFilename + ".png", 100 );

		document.close();
		
	}
	
	public static void main(String[] args) throws IOException {
		new TumbNail().tumbnail();
	}
	
}

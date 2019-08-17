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

import board.model.vo.Attachment;
import common.MyFileRenamePolicy;

@WebServlet("/playgroupImg.ch")
public class playgroupImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public playgroupImgServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10; 


			String root= request.getServletContext().getRealPath("/");
			String savePath = root+"uploadImages/";
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			
			
			Enumeration<String> files = multiRequest.getFileNames();
			String saveFile = null; // 저장될 파일이름
			String originFile = null; // 파일 원본 이름
			
			
			if(files.hasMoreElements()) { // 요소를 가지고 있냐
				String name = files.nextElement();
				// 파일 이름만 넘어오고 내용이 넘어오지 않는 경우 방지 
				if(multiRequest.getFilesystemName(name) != null) { //파일명+파일 제대로 넘어 왓을때 
					saveFile = multiRequest.getFilesystemName(name); // 변환된 이름의 파일
				}
			}
			
			int result =0;
			if(saveFile!=null) {
				Attachment file = new Attachment();
				file.setFilePath(savePath);
				file.setOriginName(originFile);
				file.setChangename(saveFile);
				
				response.getWriter().print(request.getContextPath()+"/uploadImages/"+saveFile);
			}
			
			
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.model.vo.User;
import user.model.service.UserService;
import user.model.vo.artist;

@WebServlet("/certificationInput.do")
public class test2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public test2() {
    	super();
    	
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("UTF-8");
	      
    	int uNo = ((User)request.getSession().getAttribute("loginUser")).getuNo();
    	
    	//계좌정보, 인증내용 컨텐트, 파일 
    	
	    String urlName = request.getParameter("urlName");
	    int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
	    String content = request.getParameter("content");
	    String pictureName = request.getParameter("pictureName");
	    
	   
	   
	    artist certification = new artist(urlName,accountNumber, content, pictureName);

	    int result = new UserService().certificationSubmit(certification, uNo);
	    
	    RequestDispatcher view = null;
	    
	    String page = "";
	    if(result >0) {
			page="views/common/test.jsp";
	
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시판 목록 조회 실패");
			}
	    
			view=request.getRequestDispatcher(page);
			view.forward(request, response);
	    	
	      
    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

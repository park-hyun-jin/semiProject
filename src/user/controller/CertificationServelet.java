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
import user.model.vo.Artist;

@WebServlet("/certificationInput.do")
public class CertificationServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CertificationServelet() {
    	super();
    	
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("UTF-8");
	      
    	int uNo = ((User)request.getSession().getAttribute("loginUser")).getuNo();
    	
    	//계좌정보, 인증내용 컨텐트, 파일 
    	
	    String urlName = request.getParameter("urlName");
	    String accountNumber = request.getParameter("accountNumber");
	    String content = request.getParameter("content");
	    String pictureName = request.getParameter("pictureName");
	    
	   
	   
	    Artist certification = new Artist(urlName,accountNumber, content, pictureName);

	    int result = new UserService().certificationSubmit(certification, uNo);
	    
	    User user =  new UserService().selectUser(uNo);

	    
	    String page = "";
	    if(result >0) {
			page="views/mypage/myPageCertification.jsp";
			request.setAttribute("user", user);
			request.getSession().setAttribute("msg" , "성공적으로 회원 정보를 수정하였습니다."); // nav가 인쿠르드가 다 되어있으니 메세지를 쏴주기면 하면 된다. jsp에서 
																					// 별도의 받는 작업을 안 해도 된다.
			
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시판 목록 조회 실패");
			}
	    
			request.getRequestDispatcher(page).forward(request, response);
	    	
	      
    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

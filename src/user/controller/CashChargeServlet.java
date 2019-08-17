package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cash.model.vo.Imp;
import user.model.service.UserService;


@WebServlet("/cashCharge.me")
public class CashChargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CashChargeServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int uNo = Integer.parseInt(request.getParameter("uNo"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String impUid = request.getParameter("imp_uid");
		String merchantUid = request.getParameter("merchant_uid");
		String receiptUrl = request.getParameter("receipt_url");
		
		Imp imp = new Imp(impUid, merchantUid, receiptUrl, amount);
		
		int result = new UserService().cashCharge(uNo, imp);
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

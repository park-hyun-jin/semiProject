package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import point.model.vo.Point;

@WebServlet("/userPointList.ad")
public class UserPointListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserPointListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uno = Integer.parseInt("uno");
		ArrayList<Point> pointList = new AdminService().userPointList(uno);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

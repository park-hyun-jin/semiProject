package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/kakaoLogin.us")
public class KakaoUserLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public KakaoUserLoginServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userId = request.getParameter("userId");
      
      User loginUser = new UserService().socialLoginUser(userId, "K");
      
      request.getSession().setAttribute("loginUser", loginUser);
      response.sendRedirect(request.getContextPath());
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
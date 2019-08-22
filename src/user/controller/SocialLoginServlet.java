package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/socialLogin.us")
public class SocialLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public SocialLoginServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userId = request.getParameter("userId");
      String sign = request.getParameter("sign");
      
      String thisUrl = request.getParameter("thisUrl");
      
      User loginUser = new UserService().socialLoginUser(userId, sign);
      
      request.getSession().setAttribute("loginUser", loginUser);
      response.sendRedirect(thisUrl);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
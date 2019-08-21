package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

@WebServlet("/isSocialUser.us")
public class IsSocialUserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public IsSocialUserServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String userId = request.getParameter("userId");
      String sign = request.getParameter("sign");
      
      int result = new UserService().isSocialUser(userId, sign);
      
      response.getWriter().print(result);
   
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
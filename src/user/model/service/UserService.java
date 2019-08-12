package user.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import user.model.dao.UserDao;
import user.model.vo.User;

public class UserService {

   public UserService() {   }
   
   public int checkEmail(String joinEmail) {
	   Connection conn = getConnection();
	   
	   int result = new UserDao().checkEmail(conn, joinEmail);
	   return 0;
   }

   public int emailJoin(User joinUser) {
      Connection conn = getConnection();
      int result = new UserDao().emailJoin(conn, joinUser);
      
      if(result > 0) commit(conn);
      else rollback(conn);
      
      return result;
   }

	public User loginUser(User user) {
		Connection conn = getConnection();
		User loginUser = new UserDao().loginUser(conn, user);
		
		return loginUser;
	}

   
   
}

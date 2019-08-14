package user.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import point.model.vo.Point;
import user.model.dao.UserDao;
import user.model.vo.User;


public class UserService {

	public UserService() {   }
   
	/**
    * 이메일 중복 확인
    * @param joinEmail
	* @return result
	*/
	public int checkEmail(String joinEmail) {
		Connection conn = getConnection();
	   
		int result = new UserDao().checkEmail(conn, joinEmail);
		return 0;
	}
	
	
	/**
	 * 닉네임 중복확인
	 * @param nickName
	 * @return result
	 */
	public int nickNameCheck(String nickName) {
		Connection conn = getConnection();
		
		int result = new UserDao().nickNameCheck(conn, nickName);
		
		return result;
	}

	/**
	 * 이메일로 회원가입
	 * @param joinUser
	 * @return result
	 */
	public int emailJoin(User joinUser) {
		Connection conn = getConnection();
		int result = new UserDao().emailJoin(conn, joinUser);
      
		if(result > 0) commit(conn);
		else rollback(conn);
      
		return result;
	}

	
	/**
	 * 로그인하기
	 * @param user
	 * @return user - 로그인한 유저 정보
	 */
	public User loginUser(User user) {
		Connection conn = getConnection();
		User loginUser = new UserDao().loginUser(conn, user);
		
		return loginUser;
	}

	public User selectUser(int uNo) {
		Connection conn = getConnection();
		
		User user = new UserDao().selectUser(conn, uNo);

		return user;
	}

	public int getBoardCount() {
		Connection conn = getConnection();
		
		int boardCount = new UserDao().getBoardCount(conn);
		
		
		
		return boardCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new UserDao().selectList(conn, currentPage, limit);
		
		
		return list;
	}

	public ArrayList<Integer> getPoint(int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Integer> pointList = new UserDao().getPoint(conn, uNo);
		
		return pointList;
	}

	public int updatePoint(int uNo, int point, String summary) {
		Connection conn = getConnection();
		
		int result = new UserDao().updatePoint(conn, uNo, point, summary);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}


   
   
}

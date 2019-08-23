package admin.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import board.model.vo.Board;
import board.model.vo.Reply;
import user.model.dao.UserDao;
import user.model.vo.Artist;
import user.model.vo.User;


public class AdminService {
	public AdminService() {	}
	
	/**
	 * 가입된 유저 수 조회용 Service
	 * @return result
	 */
	public int getUserCount() {
		Connection conn = getConnection();
		int result = new AdminDao().getUserCount(conn);
		
		return result;
	}

	
	/**
	 * 가입된 유저 리스트 조회용 Service
	 * @param currentPage
	 * @param limit
	 * @return User list
	 */
	public ArrayList<User> userSelectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<User> list = new AdminDao().selectList(conn, currentPage, limit);
		
		return list;
	}

	
	/**
	 * 유저 정보 조회용 Service
	 * @param uno
	 * @return User
	 */
	public User selectUser(int uno) {
		Connection conn = getConnection();
		
		User user = new AdminDao().selectUser(conn, uno);
	
		return user;
	}

	
	/**
	 * artist 유저 정보 조회용 Service
	 * @param uno
	 * @return artist
	 */
	public Artist selectArtist(int uno) {
		Connection conn = getConnection();
		
		Artist artist = new AdminDao().selectArtist(conn, uno);
		
		return artist;
	}

	
	/**
	 * 유저의 작성한 게시글 목록 조회용 Service
	 * @param uno
	 * @param currentPage
	 * @param limit
	 * @return Board list
	 */
	public ArrayList<Board> boardList(int uno, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new AdminDao().boardList(conn, uno, currentPage, limit);
		
		return list;
	}

	
	/**
	 * 유저의 작성한 게시글 수 조회용 Service
	 * @param uno
	 * @return result
	 */
	public int getBoardCount(int uno) {
		Connection conn = getConnection();
		int boardCount = new AdminDao().getBoardCount(conn, uno);
		
		return boardCount;
	}

	
	/**
	 * 게시글의 게시판 타입 조회용 Service
	 * @param bno
	 * @return result
	 */
	public int selectbType(int bno) {
		Connection conn = getConnection();
		int bType = new AdminDao().selectbType(conn, bno);
		
		return bType;
	}

	
	/**
	 * 작성한 댓글의 수 조회용 Service
	 * @param uno
	 * @return count
	 */
	public int getReplyCount(int uno) {
		Connection conn = getConnection();
		int replyCount = new AdminDao().getReplyCount(conn, uno);
		
		return replyCount;
	}

	
	/**
	 * 작성한 댓글의 목록 조회용 Service
	 * @param uno
	 * @param currentPage
	 * @param limit
	 * @return Reply list
	 */
	public ArrayList<ArrayList> replyList(int uno, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<ArrayList> list = new AdminDao().replyList(conn, uno, currentPage, limit);
		
		return list;
	}



}

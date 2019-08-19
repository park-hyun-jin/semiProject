package admin.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import board.model.vo.Board;
import user.model.dao.UserDao;
import user.model.vo.Artist;
import user.model.vo.User;


public class AdminService {
	public AdminService() {	}
	
	public int getUserCount() {
		Connection conn = getConnection();
		int result = new AdminDao().getUserCount(conn);
		
		return result;
	}

	public ArrayList<User> userSelectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<User> list = new AdminDao().selectList(conn, currentPage, limit);
		
		return list;
	}

	public User selectUser(int uno) {
		Connection conn = getConnection();
		
		User user = new AdminDao().selectUser(conn, uno);
	
		return user;
	}

	public Artist selectArtist(int uno) {
		Connection conn = getConnection();
		
		Artist artist = new AdminDao().selectArtist(conn, uno);
		
		return artist;
	}

	public ArrayList<Board> boardList() {
		Connection conn = getConnection();
		ArrayList<Board> list = new AdminDao().boardList(conn);
		
		return list;
	}

}

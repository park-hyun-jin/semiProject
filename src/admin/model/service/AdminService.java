package admin.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import user.model.dao.UserDao;
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

}

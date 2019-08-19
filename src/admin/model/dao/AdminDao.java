package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import user.model.vo.User;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {
		
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}	
	
	
	/**
	 * 등록된 유저 전체 수 구하기
	 * @param conn
	 * @return userCount
	 */
	public int getUserCount(Connection conn) {
		int userCount = -1;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getUserCount");
		
		try {
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) userCount = rset.getInt(1);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(stmt);
			
		}
		
		return userCount;
	}


	public ArrayList<User> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		ArrayList<User> list = null;
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			System.out.println("start: " + startRow + " / endRow : " + endRow);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				User u = new User(rset.getInt("UNO"), 
									rset.getString("NICKNAME"), 
									rset.getString("USER_NAME"), 
									rset.getString("ARTIST"),
									rset.getInt("USER_POINT"),
									rset.getInt("USER_CASH"));
				
				list.add(u);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public User selectUser(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectUser");
		User user = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, uno);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return user;
	}
	
	
	
}

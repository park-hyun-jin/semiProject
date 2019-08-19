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

import board.model.vo.Board;
import user.model.vo.Artist;
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
			rset = pstmt.executeQuery();
			System.out.println(query);
			if(rset.next()) {
				
				user = new User();
				user.setuNo(rset.getInt(1));
				user.setNickName(rset.getString(2));
				user.setEmail(rset.getString(3));
				user.setUserPoint(rset.getInt(4));
				user.setUserCash(rset.getInt(5));
				user.setEnrollDate(rset.getDate(6));
				user.setArtist(rset.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return user;
	}
	
	public Artist selectArtist(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectArtist");
		
		Artist artist = null;
		
		ArrayList userInfo = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			System.out.println(query);
			if(rset.next()) {
				artist = new Artist();
				
				artist.setuNo(rset.getInt(1));
				artist.setaDate(rset.getDate(2));
				artist.setAccount(rset.getString(3));
				artist.setTorofit(rset.getInt(4));
				artist.setaContent(rset.getString(5));
				artist.setPictureName(rset.getString(6));
				artist.setUrlName(rset.getString(7));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return artist;
	}


	public ArrayList<Board> boardList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("boardList");
		
		ArrayList<Board> list = null;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt(1));
				b.setbType(rset.getInt(2) + "," + rset.getString(3));
				b.setbTitle(rset.getString(4));
				b.setbContent(rset.getString(5));
				b.setwriter(rset.getInt(6) + "," + rset.getString(7));
				b.setCreateDate(rset.getDate(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	
}

package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.Reply;
import board.model.vo.Report;
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
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
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


	public ArrayList<Board> boardList(Connection conn, int uno, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("boardList");
		
		ArrayList<Board> list = null;
		
		try {
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow); 

			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt(2));
				b.setbType(rset.getInt(3) + "," + rset.getString(4));
				b.setbTitle(rset.getString(5));
				b.setbContent(rset.getString(6));
				b.setwriter(rset.getInt(7) + "," + rset.getString(8));
				b.setCreateDate(rset.getDate(9));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int getBoardCount(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getBoardCount");
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int selectbType(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectbType");
		int bType = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bType = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bType;
	}


	public int getReplyCount(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getReplyCount");
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<ArrayList> replyList(Connection conn, int uno, int currentPage, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("replyList");
		
		ArrayList<ArrayList> list = null;
		
		try {
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow); 

			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setrNo(rset.getInt(2));
				r.setbNo(rset.getInt(3));
				r.setrContent(rset.getString(7));
				r.setrCreateDate(rset.getDate(8));
				
				Board b = new Board();
				b.setbNo(rset.getInt(3));
				b.setbType(rset.getInt(4) + "," + rset.getString(5));
				b.setbTitle(rset.getString(6));
				
				ArrayList info = new ArrayList();
				info.add(r);
				info.add(b);
				list.add(info);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int getReportCount(Connection conn) {
		int reportCount = -1;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getReportCount");
		
		try {
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) reportCount = rset.getInt(1);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(stmt);
			
		}
		
		return reportCount;
	}


	public ArrayList<Report> reportSelectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Report> reportList = null;
		
		String query = prop.getProperty("reportSelectList");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			reportList = new ArrayList<Report>();
			
			while(rset.next()) {
				Report re = new Report(rset.getInt(2),
									 rset.getString(3) + "," + rset.getString(4) + "," + rset.getString(5),
									 rset.getInt(6)+"");
				reportList.add(re);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reportList;
	}


	
	
	
}

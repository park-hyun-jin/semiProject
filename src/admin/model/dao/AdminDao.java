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
import board.model.vo.Reply;
import board.model.vo.Report;
import cash.model.vo.Imp;
import point.model.vo.Point;
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


	public ArrayList<User> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		ArrayList<User> list = null;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
			close(stmt);
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


	/**
	 * 최신의 캐시충전 내역
	 * @return Imp list
	 */
	public ArrayList<Imp> getUpdatedImpList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getUpdatedImpList");
		
		ArrayList<Imp> impList = null;
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			impList = new ArrayList<>();
			
			while(rset.next()) {
				
				Imp imp = new Imp();
				imp.setiNo(rset.getInt(1));
				imp.setReceiptUrl(rset.getString(2));
				imp.setAmount(rset.getInt(3));
				imp.setImpUid(rset.getInt(4)+","+rset.getString(5));
				imp.setChargeDate(rset.getString(6));
				
				impList.add(imp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return impList;
	}


	/**
	 * 최신의 게시글 내역
	 * @param conn
	 * @return Board list
	 */
	public ArrayList<Board> getUpdatedBoardList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getUpdatedBoardList");
		
		ArrayList<Board> boardList = null;
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			boardList = new ArrayList<>();
			
			while(rset.next()) {
				System.out.println("조회결과 있음");
				Board board = new Board();
				board.setbNo(rset.getInt(2));
				board.setwriter(rset.getInt(3)+","+rset.getString(4));
				board.setbType(rset.getInt(5)+","+rset.getString(6));
				board.setbTitle(rset.getString(7));
				board.setCreateDate(rset.getDate(8));
				
				boardList.add(board);
				System.out.println(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}


	/**
	 * 최신의 신고 내역
	 * @param conn
	 * @return Report list
	 */
	public ArrayList<Report> getUpdatedReportList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("getUpdatedReportList");
		
		ArrayList<Report> reportList = null;
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			reportList = new ArrayList<>();
			
			while(rset.next()) {
				System.out.println("조회결과 있음");
				Report report = new Report();
				
				report.setRpNo(rset.getInt(2));
				report.setRpContent(rset.getString(3));
				report.setbNo(rset.getInt(4));
				report.setbType(rset.getInt(5)+","+rset.getString(6)+","+rset.getString(7));
				report.setUserNo(rset.getInt(8));
				report.setNickName(rset.getString(9));
				
				System.out.println(report);
				
				reportList.add(report);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reportList;
	}


	public ArrayList<Point> userPointList(Connection conn, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("userPointList");
		
		ArrayList<Point> pointList = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			pointList = new ArrayList<>();
			while(rset.next()) {
				Point point = new Point(rset.getInt(1), 
										rset.getString(2)+","+rset.getString(3),
										rset.getInt(4),
										rset.getDate(5),
										rset.getInt(6)+","+rset.getString(7));
				pointList.add(point);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pointList;
	}
	
	
}

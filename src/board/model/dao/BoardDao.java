package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.Reply;
import board.model.vo.Report;

public class BoardDao {
	
private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName =BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertPlayGroup(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPlayGroup");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, Integer.parseInt(board.getheader()));
			pstmt.setInt(4,Integer.parseInt(board.getwriter()));
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectPlaygroup(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> playgroupList = null;
		
		String query = prop.getProperty("playgroupSelectList");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			playgroupList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bo = new Board(rset.getInt(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getString(6),
									 rset.getInt(7),
									 rset.getDate(8),
									 rset.getDate(9),
									 "Y");
				playgroupList.add(bo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return playgroupList;
	}


	public Board seletePlayGroup(Connection conn, int bNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("selectPlayGroup");
		
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				board = new Board(rset.getInt(1),
								  rset.getString(2),
								  rset.getString(3),
								  rset.getString(4),
								  rset.getString(5) + ","+ rset.getString(6),
								  rset.getInt(7),
								  rset.getDate(8)
				);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
	}
		return board;
	}



	public int countPlayGroup(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("countPlayGroup");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// -------------------------------추가한 영역------------------------------------------------
	public int updatePlayGroup(Connection conn, Board playgroupboard) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePlayGroup");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			pstmt.setInt(1,Integer.parseInt(playgroupboard.getheader()));
			pstmt.setString(2, playgroupboard.getbTitle());
			pstmt.setString(3, playgroupboard.getbContent());
			pstmt.setInt(4, playgroupboard.getbNo());
			
			result=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deletePlayGroup(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePlayGroup");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getplaygroupCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null; 
		
		int boardCount = 0;
		
		String query = prop.getProperty("getplaygroupCount");
		try {
			stmt=conn.createStatement();
			rset =stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount =rset.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return boardCount;
	}

	public int playgroupReplyInsert(Connection conn, Reply r, int userNo) {
		PreparedStatement pstmt = null;
		
		int result =0;
		
		String query = prop.getProperty("playgroupReplyInsert");
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, r.getrContent());
			pstmt.setInt(2, r.getbNo());
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reply> playgroupReplySelect(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> rList = null;
		
		String query = prop.getProperty("playgroupReplySelect");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset=pstmt.executeQuery();
			
			rList= new ArrayList<Reply>();
			while(rset.next()) {
				rList.add(new Reply(rset.getInt("RNO"),
									rset.getString("RCONTENT"),
									rset.getString("NICKNAME"),
									rset.getDate("RCREATE_DATE"),
									rset.getInt("BNO")
									)
						 );
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public int getSearhPlaygroupCount(Connection conn, String head, String keyword) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getSearchPlaygroupCount");
		if(head == null || head.equals("100")) {
			query += " AND BTITLE LIKE '%" + keyword +"%'";
		} else {
			query += " AND HEADER=" + head + " AND BTITLE LIKE '%" + keyword +"%'";
		}
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("count: " + result);
		return result;
	}

	public ArrayList<Board> searchPlaygroupList(Connection conn, String head, String keyword, int currentPage, int limit) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchPlaygroupList");
		
		ArrayList<Board> list = null;
		
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow+limit -1;
		
		if(head != null && !head.equals("100"))
			query += "AND HEADER=" + head; 
		
		query += " AND BTITLE LIKE '%" + keyword + "%' ORDER BY  BNO DESC)) WHERE (RNO BETWEEN "+ startRow + " AND " + endRow + ")";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bo = new Board();
				bo.setbNo(rset.getInt(2));
				bo.setheader(rset.getString(3));
				bo.setbTitle(rset.getString(5));
				bo.setwriter(rset.getString(6));
				bo.setCreateDate(rset.getDate(7));
				bo.setbCount(rset.getInt(8));
				
				list.add(bo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	

	public int dangerWriteInsert(Connection conn, Report report) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("dangerWriteInsert");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, report.getRpContent());
			pstmt.setInt(2, report.getbNo());
			pstmt.setInt(3, report.getUserNo());
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertSheetApply(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSheetApply");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, Integer.parseInt(board.getheader()));
			pstmt.setInt(4,Integer.parseInt(board.getwriter()));
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getsheetapplyCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null; 
		
		int boardCount = 0;
		
		String query = prop.getProperty("getsheetapplyCount");
		try {
			stmt=conn.createStatement();
			rset =stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount =rset.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return boardCount;
	}

	public ArrayList<Board> selectsheetapplyList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> sheetapplyList = null;
		
		String query = prop.getProperty("selectsheetapplyList");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			sheetapplyList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bo = new Board(rset.getInt(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getString(6),
									 rset.getInt(7),
									 rset.getDate(8),
									 rset.getDate(9),
									 "Y");
				sheetapplyList.add(bo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return sheetapplyList;
	}

	public Board selectSheetApply(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("selectSheetApply");
		
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				board = new Board(rset.getInt(1),
								  rset.getString(2),
								  rset.getString(3),
								  rset.getString(4),
								  rset.getString(5) + ","+ rset.getString(6),
								  rset.getInt(7),
								  rset.getDate(8)
				);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
	}
		return board;
	}

	public int countSheetApply(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("countSheetApply");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateSheetApply(Connection conn, Board sheetapplyboard) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSheetApply");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			pstmt.setInt(1,Integer.parseInt(sheetapplyboard.getheader()));
			pstmt.setString(2, sheetapplyboard.getbTitle());
			pstmt.setString(3, sheetapplyboard.getbContent());
			pstmt.setInt(4, sheetapplyboard.getbNo());
			
			result=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteSheetApply(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteSheetApply");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	



}



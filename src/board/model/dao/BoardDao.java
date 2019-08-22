package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.concurrent.locks.StampedLock;

import board.model.vo.Board;
import board.model.vo.Note;
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
			pstmt.setInt(3,Integer.parseInt(board.getheader()));
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
		
		PreparedStatement pstmt = null; // 번호가 뭔데? 그 뭔데인 물음표를 쓰기 위해서 프리페어를 쓰기 위해서 
		ResultSet rset = null;     // 가져올 거를 담아올거가 필요하기에 리절트 셋 필요
		
		Board board = null;
		
		String query = prop.getProperty("selectPlayGroup"); // bNo에 맞는 이름 등등을 갖기 위한 쿼리문  bno?는 번호가 뭐다 
		
		
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo); // bno 값을 담아준다. 
			
			rset = pstmt.executeQuery(); //rset에 
			
			if(rset.next()) {
						// 한 줄씩 담아준다. 쿼리문 순서대로 
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
		return board; // 보드에 담아서 서블릿으로 넘길게~
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

	public int insertQnA(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnA");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3,Integer.parseInt(board.getwriter()));
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int qnaCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null; 
		
		int boardCount = 0;
		
		String query = prop.getProperty("qnaCount");
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

	

	public ArrayList<Board> selectQnAList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> qnaList = null;
		
		String query = prop.getProperty("selectQnAList");
		
		try {
			pstmt= conn.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			qnaList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bo = new Board(rset.getInt(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getInt(6),
									 rset.getDate(7),
									 rset.getDate(8));
				qnaList.add(bo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return qnaList;
	}

	
	public int getNoticeBoardCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int boardCount = 0;
		
		String query = prop.getProperty("getNoitceBoardCount");
		
		try {
			
			stmt=conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
				
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}		
    
		return boardCount;
	}


	public ArrayList<Board> selectList(Connection conn,int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> playgroupList = null;
		
		String query = prop.getProperty("freeBoardSelectList");
		
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

	// -------------------------------추가한 영역------------------------------------------------
	

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

	

	public ArrayList<Board> selectList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		
		   try {
		         stmt = conn.createStatement();
		      
		         rset = stmt.executeQuery(query);
		         
		         list = new ArrayList<Board>();
		       		         
		         while(rset.next()) {
		       
		            Board b = new Board(
		            		
		            		rset.getInt(2),
		            		rset.getString(3),
		            		rset.getInt(4),
		            		rset.getDate(5),
		            		rset.getString(6)
		            		);
		           		            		
		            		list.add(b);
		         }      		         
		      
		      } catch (Exception e) {
		         
		      }finally {
		         close(rset);
		         close(stmt);
		      }		      
		      
	      return list;
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
	
	
	public int insertPdfBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPdfBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, 1);
			pstmt.setInt(4, Integer.parseInt(board.getheader()));
			pstmt.setInt(5, Integer.parseInt(board.getwriter()));
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int insertPdfBoard(Connection conn, Note note) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPdf");
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, note.getOriginName());
			pstmt.setString(2, note.getChangeName());
			pstmt.setString(3, note.getFilePath());
			pstmt.setString(4, note.getnTitle());
			pstmt.setString(5, note.getnComposer());
			pstmt.setString(6, note.getnGenre());
			pstmt.setString(7, note.getnInstrument());
			pstmt.setString(8, note.getDivide());
			pstmt.setInt(9, note.getnPrice());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public Note selectSheetSharePdf(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectSheetSharePdf");
		Note note = null;
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				note = new Note(rset.getInt(1),
								rset.getString(2),
								rset.getString(3),
								rset.getString(4),
								rset.getString(5),
								rset.getString(6),
								rset.getString(7),
								rset.getString(8),
								rset.getString(9),
								rset.getInt(10),
								rset.getInt(11),
								rset.getInt(12)
						);
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}				
		return note;
	}

	

	public int getFreeBoardCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int boardCount = 0;
		
		String query = prop.getProperty("getFreeBoardCount");
		
		try {
			
			stmt=conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
				
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return boardCount;
	}

	

	public Board selectBoardGroup(Connection conn, int bNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("selectBoardGroup");
		System.out.println(query);
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				board = new Board();
				
				board.setbNo(bNo);
				board.setbTitle(rset.getString("bTitle"));
				board.setbContent(rset.getString("bContent"));
				board.setbCount(rset.getInt("bCount"));
				board.setCreateDate(rset.getDate("create_Date"));
				board.setwriter(rset.getInt("writer")+","+rset.getString("nickname"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return board;
		
	}

	public int deleteBoadGroup(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoadGroup");
		
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

	public int boardReplyInsert(Connection conn, Reply r, int userNo) {
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

	public int countBoard(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("countBoard");
		
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

	public int updatBoardGroup(Connection conn, Board playgroupboard) {
		
		PreparedStatement pstmt = null;
		int result = 0; 
		// 넣기만 하고 받아올게 없기 때문에  리절트셋을 아니고 리절트에 0 있는지 없는지 결과값을 확인하기 위해
		// 리절트 셋은 넣고 받고 
		// 받아오는 경우에는 셀렉트처럼 글 번호에 맞게 제목이랑 내용등등이 글 번호에 맞는거에 갖고 와야 되는데 담아올 게 있어야 한다. 장바구니 필요 
		//		한 개가 들어왔는 개수로만 파악할 경우에는 
		String query = prop.getProperty("updateBoardGroup");
		
		try {
			pstmt= conn.prepareStatement(query); // 쿼리를 갖고 와야 해 
			
		
			pstmt.setString(1, playgroupboard.getbTitle());
			pstmt.setString(2, playgroupboard.getbContent());
			pstmt.setInt(3, playgroupboard.getbNo());
//			나는 갱신할거야 어떤걸? 보드를 거기에서 애랑 애랑 애랑 애랑 세트로 묶어서 업데이트를 해버릴거야 뭐에 맞게? 글번호에 맞게? 이것들을 전부다 보드에서 바꿔버릴거야~ 글 번호 기준으로 
			result=pstmt.executeUpdate(); // 그거를 결과에 담아서 업데이트 시켜줄거야
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result; // 그리고 이 결과를 리턴해줄거야
	}

	
	public Board updateBoardGroup(Connection conn, int bNo) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      Board board = null;
	      
	      String query = prop.getProperty("updateBoardGroup");
	      
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
	
	
	public int insertFreeBoard(Connection conn, Board board) {
	      
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertFreeBoard");
	      
	      try {
	         pstmt= conn.prepareStatement(query);
	         
	         pstmt.setString(1, board.getbTitle());
	         pstmt.setString(2, board.getbContent());
	         pstmt.setInt(3,Integer.parseInt(board.getwriter()));
	         
	         result = pstmt.executeUpdate();
	         
	      }catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   }

	public ArrayList<Board> noticeSelectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> playgroupList = null;
		
		String query = prop.getProperty("noticeBoardSelectList");
		
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

	public int insertNoticeBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertNoticeBoard");
	      
	      try {
	         pstmt= conn.prepareStatement(query);
	         
	         pstmt.setString(1, board.getbTitle());
	         pstmt.setString(2, board.getbContent());
	         pstmt.setInt(3,Integer.parseInt(board.getwriter()));
	         
	         result = pstmt.executeUpdate();
	         
	      }catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   }

	}

	
	
	



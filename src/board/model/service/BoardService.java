package board.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Reply;
import board.model.vo.Report;

public class BoardService {

	public int insertPlayGroup(Board board) {
		Connection conn = getConnection();
		int result = new BoardDao().insertPlayGroup(conn,board);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Board> selectPlaygroup(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Board> playgroupList = new BoardDao().selectPlaygroup(conn,currentPage,limit);
		return playgroupList;
	}


	public Board selectBoard(int bNo) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		Board board = bDao.seletePlayGroup(conn,bNo);		
		
		
		return board;
	}

	public Board seletePlayGroup(int bNo) {
		Connection conn = getConnection();
		
		
		BoardDao bDao = new BoardDao();
		
		
		Board board = bDao.seletePlayGroup(conn, bNo);
		
		if(board != null) {
			int result = bDao.countPlayGroup(conn,bNo);
			
			if(result >0) {
				commit(conn);
				board.setbCount(board.getbCount()+1);
			}else {
				
				rollback(conn);
				board =null; 
			}
		}

		return board;
	}

	
// ---------------------------------- 수정 영역--------------------------	
	public int updatePlayGroup(Board playgroupboard) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updatePlayGroup(conn,playgroupboard);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int deletePlayGroup(int bNo) {
		Connection conn =getConnection();
		int result = new BoardDao().deletePlayGroup(conn,bNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int getplaygroupCount() {
		Connection conn =getConnection();		
		int boardCount = new BoardDao().getplaygroupCount(conn);
		
		return boardCount;
	}

	public int playgroupReplyInsert(Reply r, int userNo) {
		Connection conn = getConnection();
		int result = new BoardDao().playgroupReplyInsert(conn,r,userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Reply> playgroupReplySelect(int bNo) {
		Connection conn = getConnection();
		ArrayList<Reply> rList = new BoardDao().playgroupReplySelect(conn,bNo);
		
		return rList;
	}
	
	
	public int dangerWriteInsert(Report report) {
		Connection conn = getConnection();
		int result = new BoardDao().dangerWriteInsert(conn,report);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int insertSheetApply(Board board) {
		Connection conn = getConnection();
		int result = new BoardDao().insertSheetApply(conn,board);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int getsheetapplyCount() {
		Connection conn =getConnection();		
		int boardCount = new BoardDao().getsheetapplyCount(conn);
		
		return boardCount;
	}

	public ArrayList<Board> selectsheetapplyList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Board> sheetapplyPianoList = new BoardDao().selectsheetapplyList(conn,currentPage,limit);
		return sheetapplyPianoList;
	}

	public Board selectSheetApply(int bNo) {
		Connection conn = getConnection();
		
		
		BoardDao bDao = new BoardDao();
		
		
		Board board = bDao.selectSheetApply(conn, bNo);
		
		if(board != null) {
			int result = bDao.countSheetApply(conn,bNo);
			
			if(result >0) {
				commit(conn);
				board.setbCount(board.getbCount()+1);
			}else {
				
				rollback(conn);
				board =null; 
			}
		}

		return board;
	}

	public int updateSheetApply(Board sheetapplyboard) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateSheetApply(conn,sheetapplyboard);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int deleteSheetApply(int bNo) {
		Connection conn =getConnection();
		int result = new BoardDao().deleteSheetApply(conn,bNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int insertQnA(Board board) {
		Connection conn = getConnection();
		int result = new BoardDao().insertQnA(conn,board);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	
	public int qnaCount() {
		Connection conn =getConnection();		
		int boardCount = new BoardDao().qnaCount(conn);
		
		return boardCount;
	}
	
	
	public ArrayList<Board> selectQnAList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Board> qnaList = new BoardDao().selectQnAList(conn,currentPage,limit);
		return qnaList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getSearchPlaygroupCount(String head, String keyword) {
		Connection conn = getConnection();
		
		int result = new BoardDao().getSearhPlaygroupCount(conn, head, keyword);
		
		return result;
	}

	public ArrayList<Board> searchPlaygroupList(String head, String keyword, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Board> playgroupList = new BoardDao().searchPlaygroupList(conn, head, keyword, currentPage, limit);
		
		return playgroupList;
	}

	

	

	

	





}

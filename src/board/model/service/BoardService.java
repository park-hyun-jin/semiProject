package board.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;

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

	public ArrayList<Board> selectPlaygroup() {
		Connection conn = getConnection();
		ArrayList<Board> playgroup = new BoardDao().selectPlaygroup(conn);
		return playgroup;
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


	



	
	
	
	

}

package board.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;

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

	public ArrayList<Board> selectPlaygroup(Connection conn) {
		Statement stmt =null;
		ResultSet rset = null;
		ArrayList<Board> playgroup = null;
		Board bo = null;
		String query = prop.getProperty("playgroupSelectList");
		
		try {
			stmt = conn.createStatement();
			rset =stmt.executeQuery(query);
			playgroup = new ArrayList<Board>();
			
			while(rset.next()) {
				bo = new Board(rset.getInt(2),
									 rset.getString(3),
									 rset.getString(4),
									 rset.getString(5),
									 rset.getString(6),
									 rset.getInt(7),
									 rset.getDate(8),
									 rset.getDate(9),
									 "Y");
				playgroup.add(bo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return playgroup;
	}

	


}



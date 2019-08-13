package user.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Attachment;
import board.model.vo.Board;
import user.model.vo.User;

public class UserDao {
   Properties prop = null;
   
   public UserDao() {
      try {
         prop = new Properties();
         String fileName = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }


	public int checkEmail(Connection conn, String joinEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkEmail");
		
		int result = 0;
		System.out.println(query);
		System.out.println(joinEmail);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, joinEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int emailJoin(Connection conn, User joinUser) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("emailJoin");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, joinUser.getUserNo());
			pstmt.setString(2,  joinUser.getEmail());
			pstmt.setString(3, joinUser.getUserPwd());
			pstmt.setString(4, joinUser.getUserName());
			pstmt.setString(5, joinUser.getNickName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public User loginUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("loginUser");
		
		User loginUser = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getSign()+"");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new User(
						rset.getInt(1), 
						rset.getString(2),
						rset.getString(3), 
						rset.getString(4),
						rset.getString(5).charAt(0),
						rset.getString(6).charAt(0)	
					);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return loginUser;
	}


	public User selectUser(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		User user = null;
		
		String query = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User(email, 
						rset.getString(1), 
						rset.getString(2), 
						rset.getString(3), 
						rset.getString(4).charAt(0), 
						rset.getInt(5), 
						rset.getInt(6));
			}
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return user;
	}


	public int getBoardCount(Connection conn) {
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		int boardCount = 0;
		
		String query = prop.getProperty("getBoardCount");
		
		try {
			
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
		
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
	
		return boardCount;
	}


	public ArrayList<Board> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage-1) * limit +1 ;
			int endRow = startRow + limit -1 ;
			
			pstmt.setInt(1, 1); // 뒤에가 btype 
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board(
						      rset.getInt("BID"),
						      rset.getString("CNAME"),
						      rset.getString("BTITLE"),
						      rset.getString("BCONTENT"),
						      rset.getString("USER_NAME"),
						      rset.getInt("BCOUNT"),
						      rset.getDate("CREATE_DATE"),
						      rset.getDate("MODIFY_DATE")
						 
						      );
				
				list.add(b);
			}		
			
			
		} catch (Exception e) {
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		

		return list;
	}
	}


	
	
	



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
import cash.model.vo.Imp;
import point.model.vo.Point;
import user.model.vo.User;
import user.model.vo.Artist;

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


	/**
	 * 이메일 중복 체크
	 * @param conn
	 * @param joinEmail
	 * @return result
	 */
	public int emailCheck(Connection conn, String joinEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("emailCheck");
		
		int result = 0;

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
	
	/**
	 * 닉네임 중복체크
	 * @param conn
	 * @param nickName
	 * @return result
	 */
	public int nickNameCheck(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("nickNameCheck");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickName);
			
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

	/**
	 * 이메일로 회원가입
	 * @param conn
	 * @param joinUser
	 * @return result
	 */
	public int emailJoin(Connection conn, User joinUser) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("emailJoin");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  joinUser.getEmail());
			pstmt.setString(2, joinUser.getUserPwd());
			pstmt.setString(3, joinUser.getUserName());
			pstmt.setString(4, joinUser.getNickName());
			pstmt.setString(5, joinUser.getSign());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * 로그인하고 로그인 유저 정보 반환
	 * @param conn
	 * @param user
	 * @return user : loginUser
	 */
	public User loginUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("loginUser");
		
		User loginUser = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getSign());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new User(
						rset.getInt(1), 
						rset.getString(2),
						rset.getString(3), 
						rset.getString(4),
						rset.getString(5),
						rset.getString(6)	
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


	public User selectUser(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		User user = null;
		
		String query = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User(rset.getInt(1), 
						rset.getString(2),
						rset.getString(3), 
						rset.getString(4), 
						rset.getString(5), 
						rset.getString(6), 
						rset.getInt(7), 
						rset.getInt(8)
						);
			}
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return user;
	}


//	public int getBoardCount(Connection conn) {
//		
//		Statement stmt = null;
//		
//		ResultSet rset = null;
//		
//		int boardCount = 0;
//		
//		String query = prop.getProperty("getBoardCount");
//		
//		try {
//			
//			stmt = conn.createStatement();
//			
//			rset = stmt.executeQuery(query);
//			
//			if(rset.next()) {
//				boardCount = rset.getInt(1);
//		
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(stmt);
//		}
//		
//	
//		return boardCount;
//	}


	public ArrayList<Board> selectList(Connection conn,int writer, int currentPage, int limit) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		
		   try {
		         pstmt = conn.prepareStatement(query);
		         
		         int startRow = (currentPage-1) * limit +1 ;
		         int endRow = startRow + limit -1 ;
		         
		         pstmt.setInt(1, writer); // 뒤에가 btype 
		         pstmt.setInt(2, startRow);
		         pstmt.setInt(3, endRow);
		         
		         rset = pstmt.executeQuery();
		         
		         list = new ArrayList<Board>();
		       
		         System.out.println(query+"    "+"쿼리");
		         while(rset.next()) {
		         System.out.println(rset.getString(3));
		            Board b = new Board(
		            		
		            		rset.getInt(2),
		            		rset.getString(3),
		            		rset.getInt(4),
		            		rset.getDate(5),
		            		rset.getInt(6),
		            		rset.getString(7),
		            		rset.getString(9)
		            		);
		           
		            		
		            		list.add(b);

		         }      
		         
		         System.out.println("list : " +list);
		      } catch (Exception e) {
		         
		      }finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      
		      return list;
		   }
		   


	public ArrayList<Integer> getPoint(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Integer> pointList = null;
		int num = 0;
		String query = prop.getProperty("getPoint");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();

			pointList = new ArrayList<>();
			while(rset.next()) {
				num = Integer.parseInt(rset.getDate(1).toString().substring(8));
				
				pointList.add(num);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return pointList;
	}


	public int updatePoint(Connection conn, int uNo, int point, String summary) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePoint");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, summary);
			pstmt.setInt(2, point);
			pstmt.setInt(3, uNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	public int getWriteBoardCount(Connection conn, int writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int boardCount = 0;
		
		String query = prop.getProperty("getWriteBoardCount");
		
		try {
			
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, writer);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
				System.out.println("bc : " + boardCount);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
    
		return boardCount;
	}


	public int changePwd(Connection conn, int uNo, String pwd) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("changePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pwd);
			pstmt.setInt(2, uNo);
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
      close(pstmt);
		}
    return result;
  }
  
  
	  public int socialJoin(Connection conn, User joinUser) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("socialJoin");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, joinUser.getuNo());
	         pstmt.setString(2, joinUser.getEmail());
	         pstmt.setString(3, joinUser.getUserName());
	         pstmt.setString(4, joinUser.getNickName());
	         pstmt.setString(5, joinUser.getSign());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }
	  
	  /**
	    * 소셜계정으로 가입된 유저인가
	    * @param conn
	    * @param userId
	    * @return result
	    */
	   public int isSocialUser(Connection conn, String userId, String sign) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String query = prop.getProperty("isSocialUser");
	      int result = 0;
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, Integer.parseInt(userId));
	         pstmt.setString(2, sign);
	         
	         rset = pstmt.executeQuery();
	         if(rset.next()) result = rset.getInt(1);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      return result;
	   }
	   
	   
	   /**
	    * 소셜계정으로 로그인한 유저 정보 가져오기
	    * @param conn
	    * @param userId
	    * @return loginUser
	    */
	   public User socialLoginUser(Connection conn, String userId, String sign) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	         
	      String query = prop.getProperty("socialLoginUser");
	         
	      User loginUser = null;
	         
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, userId);
	         pstmt.setString(2, sign);
	            
	         rset = pstmt.executeQuery();
	            
	         if(rset.next()) {
	            loginUser = new User(
	                  rset.getInt(1), 
	                  rset.getString(2),
	                  rset.getString(3), 
	                  rset.getString(4),
	                  rset.getString(5),
	                  rset.getString(6)   
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

  
	public int deleteCheck(Connection conn, String deleteBoards) {
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCheck")+"(" + deleteBoards+ ")";
		System.out.println(query);
		try {
			stmt = conn.createStatement();

			result= stmt.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;		
	}
	
	
public Board selectBoard(Connection conn, int bNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(
					rset.getInt("bno"),	
					rset.getString("btitle"),
					rset.getString("bContent"),
					rset.getInt("bCount"),
					rset.getDate("createDate"),
					rset.getDate("modifyDate"),
					rset.getInt("rpCount"),
					rset.getString("bType"),
					rset.getString("header"),
					rset.getString("writer") 
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


	public int cashCharge(Connection conn, int uNo, Imp imp) {
	PreparedStatement pstmt = null;
	int result = 0;
	String query = prop.getProperty("cashCharge");	
	try {
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, imp.getImpUid());
		pstmt.setString(2, imp.getMerchantUid());
		pstmt.setString(3, imp.getReceiptUrl());
		pstmt.setInt(4, imp.getAmount());
		pstmt.setInt(5, uNo);
		
		result = pstmt.executeUpdate();		
		
	} catch (SQLException e) {			
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	
	return result;
	}
	
	
	public int quitUser(Connection conn, int uNo) {
		PreparedStatement pstmt = null;		
		int result = 0;		
		String query = prop.getProperty("quitUser");		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, uNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}


	public int certificationSubmit(Connection conn, Artist certification, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("certificationSubmit"); // 쿼리를 가져오는 거 
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
				
			pstmt.setInt(1, uNo);
			pstmt.setString(2, certification.getAccountNumber());
			pstmt.setString(3, certification.getContent());
			pstmt.setString(4, certification.getPictureName());
			pstmt.setString(5,  certification.getUrlName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
		
		




	
	
	
}


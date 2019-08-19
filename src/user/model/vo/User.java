package user.model.vo;

import java.sql.Date;

public class User {
   
   private int uNo;
   private String email;
   private String userPwd;
   private String userName;
   private String nickName;
   private Date enrollDate;
   private String artist;
   private String uStatus;
   private int userPoint;
   private int userCash;
   private String sign;

   
   public User() {   }
   
   
   public User(int uNo, String email, String userName, String nickName, String sign) {
	   super();
	   this.uNo = uNo;
	   this.email = email;
	   this.userName = userName;
	   this.nickName = nickName;
	   this.sign = sign;
	}	


	public User(int uNo, String email, String userPwd, String userName, String nickName, String artist, int userPoint, int userCash) {
		super();
		this.uNo = uNo;
		this.email = email;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.artist = artist;
		this.userPoint = userPoint;
		this.userCash = userCash;
	}



	public User(String email, String userPwd, String sign) {
		super();
		this.email = email;
		this.userPwd = userPwd;
		this.sign = sign;
	}


   public User(String email, String userPwd, String userName, String nickName, String sign) {
      super();
      this.email = email;
      this.userPwd = userPwd;
      this.userName = userName;
      this.nickName = nickName;
      this.sign = sign;
   }
   
	public User(int uNo, String email, String userName, String nickName, String artist, String sign) {
		super();
		this.uNo = uNo;
		this.email = email;
		this.userName = userName;
		this.nickName = nickName;
		this.artist = artist;
		this.sign = sign;
	}


	public User(int uNo, String email, String userPwd, String userName, String nickName, Date enrollDate,
         String artist, int userPoint, int userCash, String sign) {
		super();
		this.uNo = uNo;
		this.email = email;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.enrollDate = enrollDate;
		this.artist = artist;
     	this.userPoint = userPoint;
     	this.userCash = userCash;
     	this.sign = sign;
	}

   public User(int uNo, String email, String userPwd, String userName, String nickName, Date enrollDate,
         String artist, String uStatus, int userPoint, int userCash, String sign) {
      super();
      this.uNo = uNo;
      this.email = email;
      this.userPwd = userPwd;
      this.userName = userName;
      this.nickName = nickName;
      this.enrollDate = enrollDate;
      this.artist = artist;
      this.uStatus = uStatus;
      this.userPoint = userPoint;
      this.userCash = userCash;
      this.sign = sign;
   }

   
	public int getuNo() {
		return uNo;
	}
	
	
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}


	public String getEmail() {
		return email;
	}


   public void setEmail(String email) {
      this.email = email;
   }


   public String getUserPwd() {
      return userPwd;
   }


   public void setUserPwd(String userPwd) {
      this.userPwd = userPwd;
   }


   public String getUserName() {
      return userName;
   }


   public void setUserName(String userName) {
      this.userName = userName;
   }


   public String getNickName() {
      return nickName;
   }


   public void setNickName(String nickName) {
      this.nickName = nickName;
   }


   public Date getEnrollDate() {
      return enrollDate;
   }


   public void setEnrollDate(Date enrollDate) {
      this.enrollDate = enrollDate;
   }


   public String getArtist() {
      return artist;
   }


   public void setArtist(String artist) {
      this.artist = artist;
   }


   public String getuStatus() {
      return uStatus;
   }


   public void setuStatus(String uStatus) {
      this.uStatus = uStatus;
   }


   public int getUserPoint() {
      return userPoint;
   }


   public void setUserPoint(int userPoint) {
      this.userPoint = userPoint;
   }


   public int getUserCash() {
      return userCash;
   }


   public void setUserCash(int userCash) {
      this.userCash = userCash;
   }


   public String getSign() {
      return sign;
   }


   public void setSign(String sign) {
      this.sign = sign;
   }


   @Override
   public String toString() {
      return "User [uNo=" + uNo + ", email=" + email + ", userPwd=" + userPwd + ", userName=" + userName
            + ", nickName=" + nickName + ", enrollDate=" + enrollDate + ", artist=" + artist + ", uStatus="
            + uStatus + ", userPoint=" + userPoint + ", userCash=" + userCash + ", sign=" + sign + "]";
   }


public String urlName() {
	// TODO Auto-generated method stub
	return null;
}
   
   

}
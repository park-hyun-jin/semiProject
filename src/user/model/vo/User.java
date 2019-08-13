package user.model.vo;

import java.sql.Date;

public class User {
   
   private int userNo;
   private String email;
   private String userPwd;
   private String userName;
   private String nickName;
   private Date enrollDate;
   private char artist;
   private char uStatus;
   private int userPoint;
   private int userCash;
   private char sign;
   
   public User() {   }
   
   
   public User(String email, String userPwd, char sign) {
		super();
		this.email = email;
		this.userPwd = userPwd;
		this.sign = sign;
	}


   public User(String email, String userPwd, String userName, String nickName, char sign) {
      super();
      this.email = email;
      this.userPwd = userPwd;
      this.userName = userName;
      this.nickName = nickName;
      this.sign = sign;
   }
   
   public User(int userNo, String email, String userName, String nickName, char artist, char sign) {
	super();
	this.userNo = userNo;
	this.email = email;
	this.userName = userName;
	this.nickName = nickName;
	this.artist = artist;
	this.sign = sign;
}


public User(int userNo, String email, String userPwd, String userName, String nickName, Date enrollDate,
         char artist, int userPoint, int userCash, char sign) {
      super();
      this.userNo = userNo;
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

   public User(int userNo, String email, String userPwd, String userName, String nickName, Date enrollDate,
         char artist, char uStatus, int userPoint, int userCash, char sign) {
      super();
      this.userNo = userNo;
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


   public int getUserNo() {
      return userNo;
   }


   public void setUserNo(int userNo) {
      this.userNo = userNo;
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


   public char getArtist() {
      return artist;
   }


   public void setArtist(char artist) {
      this.artist = artist;
   }


   public char getuStatus() {
      return uStatus;
   }


   public void setuStatus(char uStatus) {
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


   public char getSign() {
      return sign;
   }


   public void setSign(char sign) {
      this.sign = sign;
   }


   @Override
   public String toString() {
      return "User [userNo=" + userNo + ", email=" + email + ", userPwd=" + userPwd + ", userName=" + userName
            + ", nickName=" + nickName + ", enrollDate=" + enrollDate + ", artist=" + artist + ", uStatus="
            + uStatus + ", userPoint=" + userPoint + ", userCash=" + userCash + ", sign=" + sign + "]";
   }
   
   

}
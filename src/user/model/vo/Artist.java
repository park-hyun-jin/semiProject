package user.model.vo;

import java.sql.Date;

public class Artist {

	private int uNo;
	private String account;
	private String aContent;
	private String pictureName;
	private Date aDate;
	private int torofit;
	private String urlName;
   
	public Artist() { }

	public Artist(int uNo, String account, String aContent, String pictureName, Date aDate, int torofit,
			String urlName) {
		super();
		this.uNo = uNo;
		this.account = account;
		this.aContent = aContent;
		this.pictureName = pictureName;
		this.aDate = aDate;
		this.torofit = torofit;
		this.urlName = urlName;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;

	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public int getTorofit() {
		return torofit;
	}

	public void setTorofit(int torofit) {
		this.torofit = torofit;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	@Override
	public String toString() {
		return "Artist [uNo=" + uNo + ", account=" + account + ", aContent=" + aContent + ", pictureName=" + pictureName
				+ ", aDate=" + aDate + ", torofit=" + torofit + ", urlName=" + urlName + "]";
	}
   
	   

}


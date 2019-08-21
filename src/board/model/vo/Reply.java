package board.model.vo;

import java.sql.Date;

public class Reply {
	private int rNo;
	private String rContent;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int bNo;
	private String nickName;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	

	public Reply(int rNo, String rContent, Date rCreateDate, Date rModifyDate, String rStatus, int bNo,
			String nickName) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.bNo = bNo;
		this.nickName = nickName;
	}



	public Reply(String rContent, int bNo) {
		super();
		this.rContent = rContent;
		this.bNo = bNo;
	}
	
	
	

	public Reply(int rNo, String rContent, String nickName, Date rCreateDate, int bNo) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.nickName = nickName;
		this.rCreateDate = rCreateDate;
		this.bNo = bNo;
	}



	public int getrNo() {
		return rNo;
	}



	public void setrNo(int rNo) {
		this.rNo = rNo;
	}



	public String getrContent() {
		return rContent;
	}



	public void setrContent(String rContent) {
		this.rContent = rContent;
	}



	public Date getrCreateDate() {
		return rCreateDate;
	}



	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}



	public Date getrModifyDate() {
		return rModifyDate;
	}



	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}



	public String getrStatus() {
		return rStatus;
	}



	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}



	public int getbNo() {
		return bNo;
	}



	public void setbNo(int bNo) {
		this.bNo = bNo;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rContent=" + rContent + ", rCreateDate=" + rCreateDate + ", rModifyDate="
				+ rModifyDate + ", rStatus=" + rStatus + ", bNo=" + bNo + ", nickName=" + nickName + "]";
	}

	
	
}

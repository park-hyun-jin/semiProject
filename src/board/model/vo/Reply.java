package board.model.vo;

import java.sql.Date;

public class Reply {
	private int rNo;
	private String rContent;
	private Date rCreateDate;
	private Date rModifyDate;
	private char rStatus;
	private int bNo;
	private int userNo;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int rNo, String rContent, Date rCreateDate, Date rModifyDate, char rStatus, int bNo, int userNo) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.bNo = bNo;
		this.userNo = userNo;
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

	public char getrStatus() {
		return rStatus;
	}

	public void setrStatus(char rStatus) {
		this.rStatus = rStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rContent=" + rContent + ", rCreateDate=" + rCreateDate + ", rModifyDate="
				+ rModifyDate + ", rStatus=" + rStatus + ", bNo=" + bNo + ", userNo=" + userNo + "]";
	}
	
	
	
	
	
	
	
	
	
}

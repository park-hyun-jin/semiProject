package cash.model.vo;

import java.sql.Date;

public class Cash {
	private int cNo;
	private String cSummary;
	private int cash;
	private Date cDate;
	private int userNo;
	
	public Cash() {}

	public Cash(int cNo, String cSummary, int cash, Date cDate, int userNo) {
		super();
		this.cNo = cNo;
		this.cSummary = cSummary;
		this.cash = cash;
		this.cDate = cDate;
		this.userNo = userNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcSummary() {
		return cSummary;
	}

	public void setcSummary(String cSummary) {
		this.cSummary = cSummary;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	

	
	
	
}

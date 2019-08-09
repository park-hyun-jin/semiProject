package user.model.vo;

import java.sql.Date;

public class Profit {
	private int pno;
	private int profit;
	private Date pDate;
	private int userNo;
	private int nNo;
	
	public Profit() {
		// TODO Auto-generated constructor stub
	}

	public Profit(int pno, int profit, Date pDate, int userNo, int nNo) {
		super();
		this.pno = pno;
		this.profit = profit;
		this.pDate = pDate;
		this.userNo = userNo;
		this.nNo = nNo;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	@Override
	public String toString() {
		return "Profit [pno=" + pno + ", profit=" + profit + ", pDate=" + pDate + ", userNo=" + userNo + ", nNo=" + nNo
				+ "]";
	}
	
	
	
	
	
}

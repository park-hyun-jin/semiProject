package point.model.vo;

import java.sql.Date;

public class Point {
	private int pNo;
	private char pSummary;
	private int point;
	private Date pDate;
	private int userNo;
	
	public Point() {}

	public Point(int pNo, char pSummary, int point, Date pDate, int userNo) {
		super();
		this.pNo = pNo;
		this.pSummary = pSummary;
		this.point = point;
		this.pDate = pDate;
		this.userNo = userNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public char getpSummary() {
		return pSummary;
	}

	public void setpSummary(char pSummary) {
		this.pSummary = pSummary;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
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
	
	
	
	
	
}

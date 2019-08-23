package point.model.vo;

import java.sql.Date;

public class Point {
	private int pNo;
	private String pSummary;
	private int point;
	private Date pDate;
	private String userNo;
	
	public Point() {}

	public Point(int pNo, String pSummary, int point, Date pDate, String userNo) {
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

	public String getpSummary() {
		return pSummary;
	}

	public void setpSummary(String pSummary) {
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

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	
	
	
	
}

package board.model.vo;

public class Report {
	private int rpNo;
	private String rpContent;
	private int bNo;
	private String userNo;
	
	
	public Report() {
		// TODO Auto-generated constructor stub
	}


	public Report(int rpNo, String rpContent, int bNo, String userNo) {
		super();
		this.rpNo = rpNo;
		this.rpContent = rpContent;
		this.bNo = bNo;
		this.userNo = userNo;
	}
	

	public Report( int bNo, String rpContent,String userNo) {
		super();
		this.rpContent = rpContent;
		this.bNo = bNo;
		this.userNo = userNo;
	}
	

	


	public int getRpNo() {
		return rpNo;
	}


	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}


	public String getRpContent() {
		return rpContent;
	}


	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Report [rpNo=" + rpNo + ", rpContent=" + rpContent + ", bNo=" + bNo + ", userNo=" + userNo + "]";
	}
	
	
	
}

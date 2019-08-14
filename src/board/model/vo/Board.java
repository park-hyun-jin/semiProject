package board.model.vo;

import java.sql.Date;

public class Board {

	private int bNo;
	private String bTitle;
	private String bContent;
	private int bCount;
	private Date createDate;
	private Date modifyDate;
	private String bStatus;
	private int rpCount;
	private int bType;
	private String header;
	private String writer;


	
	// int cid; 아니고  조인 결과 값인 String cateogry;로 함
	// int writer; 아니고 조인 결과 값이 int writer;로 함
	
	public Board() {}

	public Board(int bNo, int bType, String header, String bTitle, String bContent, String writer, int bCount,
			Date createDate, Date modifyDate, String bStatus) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.header = header;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.bStatus = bStatus;
	}

	

	public Board(int bNo, String header, String bTitle, String bContent, String writer, int bCount, Date createDate,
			Date modifyDate, String bStatus) {
		super();
		this.bNo = bNo;
		this.header = header;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.bStatus = bStatus;
	}


	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, String bStatus,
			int rpCount, int bType, String header, String writer) {

		super();
		this.bNo = bNo;
		this.header = header;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
		this.bCount = bCount;
		this.createDate = createDate;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getheader() {
		return header;
	}

	public void setheader(String header) {
		this.header = header;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getwriter() {
		return writer;
	}

	public void setwriter(String writer) {
		this.writer = writer;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getbStatus() {
		return bStatus;
	}

	public void setStatus(String bStatus) {
		this.bStatus = bStatus;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bType=" + bType + ", header=" + header + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", writer=" + writer + ", bCount=" + bCount
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + bStatus + "]";
	}

	
}
package board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bContent;
	private int bCount;
	private Date createDate;
	private Date modifyDate;
	private char bStatus;
	private int rpCount;
	private int bType;
	private int header;
	private int writer;
	
	public Board() { }

	public Board(String bTitle, String bContent, int bType, int header, int writer) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bType = bType;
		this.header = header;
		this.writer = writer;
	}

	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, int rpCount,
			int bType, int header, int writer) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.rpCount = rpCount;
		this.bType = bType;
		this.header = header;
		this.writer = writer;
	}

	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, char bStatus,
			int rpCount, int bType, int header, int writer) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.bStatus = bStatus;
		this.rpCount = rpCount;
		this.bType = bType;
		this.header = header;
		this.writer = writer;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
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

	public char getbStatus() {
		return bStatus;
	}

	public void setStatus(char bStatus) {
		this.bStatus = bStatus;
	}

	public int getRpCount() {
		return rpCount;
	}

	public void setRpCount(int rpCount) {
		this.rpCount = rpCount;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public int getHeader() {
		return header;
	}

	public void setHeader(int header) {
		this.header = header;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	

}

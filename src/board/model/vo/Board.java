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
	private String bType;
	private String header;
	private String writer;
	private String divide;
	private int nPrice;


	
	// int cid; 아니고  조인 결과 값인 String cateogry;로 함
	// int writer; 아니고 조인 결과 값이 int writer;로 함
	public Board( ) {}
	
	
	

	
	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, String bStatus,
			int rpCount, String bType, String header, String writer, String divide, int nPrice) {
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
		this.divide = divide;
		this.nPrice = nPrice;
	}





	public Board(String bTitle, String bContent, int bCount, Date createDate, String bType, String writer) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.bType = bType;
		this.writer = writer;
	}


	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, int rpCount, String bType, String header, String writer) {
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


	
	public Board(int bNo, String bType, String header, String bTitle, String bContent, String writer, int bCount,
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

	

	public Board(int bNo, String bTitle, int bCount, Date createDate, int rpCount, String header,String writer) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bCount = bCount;
		this.createDate = createDate;
		this.rpCount = rpCount;
		this.header = header;
		this.writer = writer;
		
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


	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate,
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
	
	

	
	
	

	public Board(int bNo, String bTitle, int bCount, Date createDate, int rpCount, String bType, String header, String writer) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bCount = bCount;
		this.createDate = createDate;
		this.rpCount = rpCount;
		this.bType = bType;
		this.header = header;
		this.writer = writer;
		
	}
	
	
	
	
	




	public Board(String bTitle, Date createDate, int rpCount, String header, String writer) {
		super();
		this.bTitle = bTitle;
		this.createDate = createDate;
		this.rpCount = rpCount;
		this.header = header;
		this.writer = writer;
	}

	public Board(String bTitle, Date createDate, String header, String writer) {
		super();
		this.bTitle = bTitle;
		this.createDate = createDate;
		this.header = header;
		this.writer = writer;
	}

	
	public Board(String bTitle, String bContent, String bType, String header, String writer) {
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bType = bType;
		this.header = header;
		this.writer = writer;
	}

	public Board(String bTitle, String bContent, String writer) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
	}



	public Board(int bNo, String header,String bTitle, String bContent, String writer,int bCount, Date createDate
			) {
		super();
		this.bNo = bNo;
		this.header = header;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
		this.bCount = bCount;	
		this.createDate = createDate;
	}



	public Board(int bNo, String bTitle, String bContent, String writer, int bCount, Date createDate, Date modifyDate) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.writer = writer;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		
	}



	public Board(int bNo, String bTitle, Date createDate) {
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.createDate = createDate;
		
	}



	public Board(int bNo, String bTitle, int bCount, Date createDate, String writer) {
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bCount = bCount;
		this.createDate = createDate;
		this.writer = writer;
		
	}



	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, String writer) {
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.writer = writer;
		
	}
	
	
	



	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, int rpCount, String header,
			String writer) {
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.createDate = createDate;
		this.rpCount = rpCount;
		this.header = header;
		this.writer = writer;
	}

	
	
	


	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
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





	public int getRpCount() {
		return rpCount;
	}





	public void setRpCount(int rpCount) {
		this.rpCount = rpCount;
	}





	public String getHeader() {
		return header;
	}





	public void setHeader(String header) {
		this.header = header;
	}





	public String getWriter() {
		return writer;
	}





	public void setWriter(String writer) {
		this.writer = writer;
	}





	public String getDivide() {
		return divide;
	}





	public void setDivide(String divide) {
		this.divide = divide;
	}





	public int getnPrice() {
		return nPrice;
	}





	public void setnPrice(int nPrice) {
		this.nPrice = nPrice;
	}





	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}





	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bCount=" + bCount
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", bStatus=" + bStatus + ", rpCount="
				+ rpCount + ", bType=" + bType + ", header=" + header + ", writer=" + writer + ", divide=" + divide
				+ ", nPrice=" + nPrice + "]";
	}


	

	
}
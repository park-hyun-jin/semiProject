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
	private int header;
	private int writer;

}
	
	// int cid; 아니고  조인 결과 값인 String cateogry;로 함
	// int bWriter; 아니고 조인 결과 값이 String bWriter;로 함
	
	public Board() {}

	public Board(int bId, int bType, String category, String bTitle, String bContent, String bWriter, int bCount,
			Date createDate, Date modifyDate, String status) {
		super();
		this.bId = bId;
		this.bType = bType;
		this.category = category;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	

	public Board(int bId, String category, String bTitle, String bContent, String bWriter, int bCount, Date createDate,
			Date modifyDate) {
		super();
		this.bId = bId;
		this.category = category;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}


	public Board(int bNo, String bTitle, String bContent, int bCount, Date createDate, Date modifyDate, String bStatus,
			int rpCount, int bType, int header, int writer) {

		super();
		this.bId = bId;
		this.category = category;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
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
		return "Board [bId=" + bId + ", bType=" + bType + ", category=" + category + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWriter=" + bWriter + ", bCount=" + bCount
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

	
}
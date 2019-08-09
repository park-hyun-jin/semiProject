package board.model.vo;

import java.sql.Date;

public class Attachment {

	private int aNo;
	private String originName;
	private String changename;
	private String filePath;
	private Date uploadDate;
	private int downloadCount;
	private char aStatus;
	private int bNo;
	
	public Attachment() {}
	
	public Attachment(String originName, String changename, String filePath, int bNo) {
		super();
		this.originName = originName;
		this.changename = changename;
		this.filePath = filePath;
		this.bNo = bNo;
	}
	
	public Attachment(int aNo, String originName, String changename, String filePath, Date uploadDate,
			int downloadCount, int bNo) {
		super();
		this.aNo = aNo;
		this.originName = originName;
		this.changename = changename;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.bNo = bNo;
	}

	public Attachment(int aNo, String originName, String changename, String filePath, Date uploadDate,
			int downloadCount, char aStatus, int bNo) {
		super();
		this.aNo = aNo;
		this.originName = originName;
		this.changename = changename;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.aStatus = aStatus;
		this.bNo = bNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setfNo(int aNo) {
		this.aNo = aNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public char getaStatus() {
		return aStatus;
	}

	public void setStatus(char aStatus) {
		this.aStatus = aStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	
	
	
	
}

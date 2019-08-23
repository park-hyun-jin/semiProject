package board.model.vo;

import java.sql.Date;

public class Note {

	private int nNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String nTitle;
	private String nComposer;
	private String nGenre;
	private String nInstrument;
	private String divide;
	private int nPrice;
	private Date uploadDate;
	private int downloadCount;
	private String nStatus;
	private int bNo;
	
	public Note() {	}

	public Note(int nNo, String originName, String changeName, String filePath, String nTitle, String nComposer,
			String nGenre, String nInstrument, String divide, int nPrice, Date uploadDate,
			int downloadCount, String nStatus, int bNo) {
		this.nNo = nNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.nTitle = nTitle;
		this.nComposer = nComposer;
		this.nGenre = nGenre;
		this.nInstrument = nInstrument;
		this.divide = divide;
		this.nPrice = nPrice;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.nStatus = nStatus;
		this.bNo = bNo;
	}

	public Note(String originName, String changeName, String filePath, String nTitle, String nComposer, String nGenre,
			String nInstrument, String divide, int nPrice) {
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.nTitle = nTitle;
		this.nComposer = nComposer;
		this.nGenre = nGenre;
		this.nInstrument = nInstrument;
		this.divide = divide;
		this.nPrice = nPrice;
	}
	
	
	

	public Note(int nNo, String originName, String changeName, String filePath, String nTitle, String nComposer,
			String nGenre, String nInstrument, String divide, int nPrice, int downloadCount, int bNo) {
		this.nNo = nNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.nTitle = nTitle;
		this.nComposer = nComposer;
		this.nGenre = nGenre;
		this.nInstrument = nInstrument;
		this.divide = divide;
		this.nPrice = nPrice;
		this.downloadCount = downloadCount;
		this.bNo = bNo;
	}
	
	
	

	public Note(String originName, String changeName, String filePath, String divide, int nPrice, int bNo) {
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.divide = divide;
		this.nPrice = nPrice;
		this.bNo = bNo;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnComposer() {
		return nComposer;
	}

	public void setnComposer(String nComposer) {
		this.nComposer = nComposer;
	}

	public String getnGenre() {
		return nGenre;
	}

	public void setnGenre(String nGenre) {
		this.nGenre = nGenre;
	}

	public String getnInstrument() {
		return nInstrument;
	}

	public void setnInstrument(String nInstrument) {
		this.nInstrument = nInstrument;
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

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	@Override
	public String toString() {
		return "Note [nNo=" + nNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", nTitle=" + nTitle + ", nComposer=" + nComposer + ", nGenre=" + nGenre + ", nInstrument="
				+ nInstrument + ", divide=" + divide + ", nPrice=" + nPrice + ", uploadDate=" + uploadDate
				+ ", downloadCount=" + downloadCount + ", nStatus=" + nStatus + ", bNo=" + bNo + "]";
	}

	
}

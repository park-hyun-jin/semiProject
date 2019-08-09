package board.model.vo;

public class Note {

	private int nNo;
	private String nCountent;
	private String nVideo;
	private char nDivide;
	private int nPrice;
	private int bNo;
	private int fNo;
	
	public Note() {	}
	
	public Note(String nCountent, String nVideo, char nDivide, int nPrice, int bNo, int fNo) {
		super();
		this.nCountent = nCountent;
		this.nVideo = nVideo;
		this.nDivide = nDivide;
		this.nPrice = nPrice;
		this.bNo = bNo;
		this.fNo = fNo;
	}

	public Note(int nNo, String nCountent, String nVideo, char nDivide, int nPrice, int bNo, int fNo) {
		super();
		this.nNo = nNo;
		this.nCountent = nCountent;
		this.nVideo = nVideo;
		this.nDivide = nDivide;
		this.nPrice = nPrice;
		this.bNo = bNo;
		this.fNo = fNo;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnCountent() {
		return nCountent;
	}

	public void setnCountent(String nCountent) {
		this.nCountent = nCountent;
	}

	public String getnVideo() {
		return nVideo;
	}

	public void setnVideo(String nVideo) {
		this.nVideo = nVideo;
	}

	public char getnDivide() {
		return nDivide;
	}

	public void setnDivide(char nDivide) {
		this.nDivide = nDivide;
	}

	public int getnPrice() {
		return nPrice;
	}

	public void setnPrice(int nPrice) {
		this.nPrice = nPrice;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	
	
	
}

package cash.model.vo;

public class Imp {
	private int iNo;
	private String impUid;
	private String merchantUid;
	private String receiptUrl;
	private int amount;
	
	public Imp() {
		
	}

	public Imp(int iNo, String impUid, String merchantUid, String receiptUrl, int amount) {
		this.iNo = iNo;
		this.impUid = impUid;
		this.merchantUid = merchantUid;
		this.receiptUrl = receiptUrl;
		this.amount = amount;
	}
	
	

	public Imp(String impUid, String merchantUid, String receiptUrl, int amount) {
		this.impUid = impUid;
		this.merchantUid = merchantUid;
		this.receiptUrl = receiptUrl;
		this.amount = amount;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getReceiptUrl() {
		return receiptUrl;
	}

	public void setReceiptUrl(String receiptUrl) {
		this.receiptUrl = receiptUrl;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Imp [iNo=" + iNo + ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", receiptUrl=" + receiptUrl
				+ ", amount=" + amount + "]";
	}
	
	
}

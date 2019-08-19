package user.model.vo;

public class artist {

	   private String urlName;
	   private String accountNumber;
	   private String content;
	   private String pictureName;
	   
	   public artist() {
		
	}
	   
	public artist(String urlName, String accountNumber, String content, String pictureName) {
		super();
		this.urlName = urlName;
		this.accountNumber = accountNumber;
		this.content = content;
		this.pictureName = pictureName;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	@Override
	public String toString() {
		return "artist [urlName=" + urlName + ", accountNumber=" + accountNumber + ", content=" + content
				+ ", pictureName=" + pictureName + "]";
	}

}
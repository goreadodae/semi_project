package faq.model.vo;

public class Faq {
	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqContents;
	
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Faq(int faqNo, String faqCategory, String faqTitle, String faqContents) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContents = faqContents;
	}

	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContents() {
		return faqContents;
	}
	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}
	
	
	
	
	
	
	
	
	

}

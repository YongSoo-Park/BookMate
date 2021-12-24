package com.kh.bookmate.faq.model.vo;

public class Faq {
	
	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private int faqReadCount;
	
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Faq(int faqNo, String faqCategory, String faqTitle, String faqContent, int faqReadCount) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqReadCount = faqReadCount;
	}

	public Faq(String faqCategory, String faqTitle, String faqContent) {
		super();
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
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

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public int getFaqReadCount() {
		return faqReadCount;
	}

	public void setFaqReadCount(int faqReadCount) {
		this.faqReadCount = faqReadCount;
	}

	@Override
	public String toString() {
		return "FaqVo [faqNo=" + faqNo + ", faqCategory=" + faqCategory + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqReadCount=" + faqReadCount + "]";
	}
	
	

}

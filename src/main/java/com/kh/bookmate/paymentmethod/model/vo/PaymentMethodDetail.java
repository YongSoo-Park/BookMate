package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentMethodDetail {

	private int paymentMethodDetailNo;
	private String bankName;
	private String bankAccount;
	private String bankPwd;
	private String userReg;
	private String cardCompany;
	private String cardNo;
	private String cardCVC;
	private String phoneNo;
	private String methodPwd;

	private int methodStatus; 
	private String user_Id;
	
	public PaymentMethodDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentMethodDetail(int paymentMethodDetailNo, String bankName, String bankAccount, String bankPwd,
			String userReg, String cardNo, String cardCVC, String phoneNo, String methodPwd, int methodStatus,
			String user_Id) {
		super();
		this.paymentMethodDetailNo = paymentMethodDetailNo;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankPwd = bankPwd;
		this.userReg = userReg;
		this.cardNo = cardNo;
		this.cardCVC = cardCVC;
		this.phoneNo = phoneNo;
		this.methodPwd = methodPwd;
		this.methodStatus = methodStatus;
		this.user_Id = user_Id;
	}
	public PaymentMethodDetail(String bankName, String bankAccount, String bankPwd, String userReg, String methodPwd,
			int methodStatus, String user_Id) {
		super();
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankPwd = bankPwd;
		this.userReg = userReg;
		this.methodPwd = methodPwd;
		this.methodStatus = methodStatus;
		this.user_Id = user_Id;
	}
	public PaymentMethodDetail(String userReg, String phoneNo, String methodPwd, String user_Id, int methodStatus) {
		super();
		this.userReg = userReg;
		this.phoneNo = phoneNo;
		this.methodPwd = methodPwd;
		this.methodStatus = methodStatus;
		this.user_Id = user_Id;
	}
	
	public PaymentMethodDetail(String cardCompany, String cardNo, String cardCVC, String methodPwd, int methodStatus,
			String user_Id) {
		super();
		this.cardCompany = cardCompany;
		this.cardNo = cardNo;
		this.cardCVC = cardCVC;
		this.methodPwd = methodPwd;
		this.methodStatus = methodStatus;
		this.user_Id = user_Id;
	}
	public int getPaymentMethodDetailNo() {
		return paymentMethodDetailNo;
	}
	public void setPaymentMethodDetailNo(int paymentMethodDetailNo) {
		this.paymentMethodDetailNo = paymentMethodDetailNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public String getBankPwd() {
		return bankPwd;
	}
	public void setBankPwd(String bankPwd) {
		this.bankPwd = bankPwd;
	}
	public String getUserReg() {
		return userReg;
	}
	public void setUserReg(String userReg) {
		this.userReg = userReg;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardCVC() {
		return cardCVC;
	}
	public void setCardCVC(String cardCVC) {
		this.cardCVC = cardCVC;
	}                                                                                 
	public String getPhoneNo() {                                                      
		return phoneNo;                                                               
	}                                                                                 
	public void setPhoneNo(String phoneNo) {                                          
		this.phoneNo = phoneNo;                                                       
	}                                                                                 
	public String getMethodPwd() {                                                    
		return methodPwd;                                                             
	}                                                                                 
	public void setMethodPwd(String methodPwd) {                                      
		this.methodPwd = methodPwd;                                                   
	}                                                                                 
	public int getMethodStatus() {                                                    
		return methodStatus;                                                          
	}
	public void setMethodStatus(int methodStatus) {
		this.methodStatus = methodStatus;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	
	
	public String getCardCompany() {
		return cardCompany;
	}
	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}
	@Override
	public String toString() {
		return "PaymentMethodDetail [paymentMethodDetailNo=" + paymentMethodDetailNo + ", bankName=" + bankName
				+ ", bankAccount=" + bankAccount + ", bankPwd=" + bankPwd + ", userReg=" + userReg + ", cardNo="
				+ cardNo + ", cardCVC=" + cardCVC + ", phoneNo=" + phoneNo + ", methodPwd=" + methodPwd
				+ ", methodStatus=" + methodStatus + ", user_Id=" + user_Id + "]";
	}
	
	

}

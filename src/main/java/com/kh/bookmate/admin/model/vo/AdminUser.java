package com.kh.bookmate.admin.model.vo;

import java.util.Date;

public class AdminUser {
	
	private String user_Id;
	private String user_Name;
	private String email;
	private Date enroll;
	private String status; 
	private String seller_Nickn;
	public AdminUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminUser(String user_Id, String user_Name, String email, Date enroll, String status, String seller_Nickn) {
		super();
		this.user_Id = user_Id;
		this.user_Name = user_Name;
		this.email = email;
		this.enroll = enroll;
		this.status = status;
		this.seller_Nickn = seller_Nickn;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEnroll() {
		return enroll;
	}
	public void setEnroll(Date enroll) {
		this.enroll = enroll;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSeller_Nickn() {
		return seller_Nickn;
	}
	public void setSeller_Nickn(String seller_Nickn) {
		this.seller_Nickn = seller_Nickn;
	}
	@Override
	public String toString() {
		return "AdminUser [user_Id=" + user_Id + ", user_Name=" + user_Name + ", email=" + email + ", enroll=" + enroll
				+ ", status=" + status + ", seller_Nickn=" + seller_Nickn + "]";
	}
	
	
}

package com.kh.bookmate.addressBook.model.vo;

public class AddressBook {

	private String user_Id;
	private String mainAddress;
	private String latelyAddress;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String address5;
	
	public AddressBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AddressBook(String user_Id, String mainAddress, String latelyAddress, String address1, String address2,
			String address3, String address4, String address5) {
		super();
		this.user_Id = user_Id;
		this.mainAddress = mainAddress;
		this.latelyAddress = latelyAddress;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.address5 = address5;
	}
	
	
	public AddressBook(String user_Id, String mainAddress) {
		super();
		this.user_Id = user_Id;
		this.mainAddress = mainAddress;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getMainAddress() {
		return mainAddress;
	}
	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}
	public String getLatelyAddress() {
		return latelyAddress;
	}
	public void setLatelyAddress(String latelyAddress) {
		this.latelyAddress = latelyAddress;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	public String getAddress5() {
		return address5;
	}
	public void setAddress5(String address5) {
		this.address5 = address5;
	}
	@Override
	public String toString() {
		return "AddressBook [user_Id=" + user_Id + ", mainAddress=" + mainAddress + ", latelyAddress=" + latelyAddress
				+ ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3 + ", address4="
				+ address4 + ", address5=" + address5 + "]";
	}
	

	

}

package com.kh.bookmate.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class User {

	private String userId;
	private String userPwd;
	private String userPwdCheck;
	private String userName;
	private String userNo;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private String enroll;
	private String status;
	private int point;
	
	private int paymentNo;
	

}

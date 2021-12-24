package com.kh.bookmate.clubApply.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ClubApply {

	private int applyNo;
	private int timeNo;
	private int clubNo;
	private String userId;
	private String applyCancle;
	private String applyParti;
	private String status;
	private Date applyDate;
	//리뷰상태 주기(11/22)
	private String reviewStatus;
}

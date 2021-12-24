package com.kh.bookmate.clubReview.model.vo;

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

public class ClubReview {

	private int reviewNo;
	private int refClubNo;
	private String reviewWriter;
	private int reviewRate;
	private String reviewContent;
	private String reviewPhoto;
	private Date createDate;
	private String status;
	
}

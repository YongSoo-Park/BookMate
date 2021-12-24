package com.kh.bookmate.club.model.vo;

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
public class ClubTime {
	private int timeNo;
	private int clubNo;
	//private String clubDate;
	private Date clubDate;
	private String startTime;
	private String endTime;
	private String status;
	//apply수정
	private int apply_count;
}

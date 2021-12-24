package com.kh.bookmate.club.model.vo;

import java.sql.Date;
import java.util.List;

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
public class Club {
	private int clubNo;
	private int placeNo;
	private String userId;
	private String clubTitle;
	private String intro;
	private String activity;
	private String want;
	private String notwant;
	private String times;
	private String onoffLine;
	private int clubCapacity;
	private Date clubStartDate;
	private Date clubEndDate;
	private String bkName;
	private String bkWriter;
	private String bkPublisher;
	private Date createDate;
	private int condition; 
	private String status;
	//10.29 추가 (HOST, HOSTTIME 테이블 삭제)
	private String hostName;
	private String hostComment;
	private String hstartDate;
	private String hendDate;
	private String hwhatTodo;
	private String category;
	//11.02 추가(clubTime 테이블 )
	private List<ClubTime> clubTimes;
	//11.06 추가(clubTime 테이블 )
	private List<ClubAttachment> clubAttachments;
	//11.11 추가(HEART_COUNT - 찜기능)
	private int heartCount;
	//11.19 추가(타이틀 img) - vo에만 추가
	private String titleChangeName;
}

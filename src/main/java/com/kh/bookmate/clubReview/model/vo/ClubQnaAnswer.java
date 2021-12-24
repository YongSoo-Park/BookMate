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
public class ClubQnaAnswer {
	private int qnaAnswerNo;
	private String userId;
	private int qnaNo;
	private String qnaAnswerContent;
	private Date qnaAnswerDate;
}

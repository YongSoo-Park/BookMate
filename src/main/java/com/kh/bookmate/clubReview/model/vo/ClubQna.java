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
public class ClubQna {
	private int qnaNo;
	private String userId;
	private int refClubNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaAnswer;
	private Date createDate;
	//answer 용 필드
	private int qnaAnswerNO;
	private String qnaAnswerContent;
	private Date answerDate;
}

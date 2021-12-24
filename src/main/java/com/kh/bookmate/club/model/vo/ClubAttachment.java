package com.kh.bookmate.club.model.vo;

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
public class ClubAttachment {

	private int fileNo;
	private int clubNo;
	private String originalName;
	private String changeName;
	private int fileType;
}

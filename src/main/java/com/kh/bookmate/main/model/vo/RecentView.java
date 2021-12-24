package com.kh.bookmate.main.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RecentView {
	
	private String userId;  //userId(PK)
	private String books;   //bookISBN ','구분자로 넣기
}

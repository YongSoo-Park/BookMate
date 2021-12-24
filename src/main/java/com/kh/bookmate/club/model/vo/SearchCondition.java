package com.kh.bookmate.club.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.lang.Nullable;

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
public class SearchCondition {
	private List<String> onoffLines;
	private List<String> categories;
	private List<String> times;
	//@Nullable
	private Date startDate;
	//@Nullable
	private Date endDate;
	private String keyword;
	
}

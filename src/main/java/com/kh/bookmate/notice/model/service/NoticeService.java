package com.kh.bookmate.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.bookmate.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> selectNoticeList(String temp, RowBounds rb);

	int selectNoticeCount(String temp);

	Notice selectNoticeDetail(int noticeNo);

	void insertNotice(Notice notice, String path);

	void updateNotice(Notice notice, String path, int deleteImg, String deletePath, String newNoticeImgName);

	void deleteNotice(int noticeNo, String path, int fileStatus);

}

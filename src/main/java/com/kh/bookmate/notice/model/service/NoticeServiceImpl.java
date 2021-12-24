package com.kh.bookmate.notice.model.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.notice.model.dao.NoticeDao;
import com.kh.bookmate.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	SqlSessionTemplate sqlSession;

	//공지사항 리스트
	@Override
	public List<Notice> selectNoticeList(String temp, RowBounds rb) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeList(sqlSession, temp, rb);
	}

	//공지사항 리스트 카운트
	@Override
	public int selectNoticeCount(String temp) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeCount(sqlSession, temp);
	}

	//공지사항 상세보기 및 조회수 업데이트
	@Override
	public Notice selectNoticeDetail(int noticeNo) {

		Notice notice = noticeDao.selectNoticeDetail(sqlSession, noticeNo);
		int result = noticeDao.updateReadCount(sqlSession, noticeNo);
		if (notice == null) {
			throw new RuntimeException("공지사항 상세보기 db 오류");
		}
		if (result < 0) {
			throw new RuntimeException("공지사항 조회수 업데이트 db 오류");
		}
		return notice;
	}

	//공지사항 등록
	@Override
	public void insertNotice(Notice notice, String path) {
		try {
			noticeDao.insertNotice(sqlSession, notice);
		} catch (Exception e) {
			if (notice.getNoticeImgStatus() == 1) {
				new File(path).delete();
			}
			throw new RuntimeException("공지사항 등록 db 오류");
		}

	}

	//공지사항 수정
	@Override
	public void updateNotice(Notice notice, String path, int deleteImg, String deletePath, String newNoticeImgName) {
		int check = notice.getNoticeImgStatus();
		if (newNoticeImgName != null) {
			notice.setNoticeImgStatus(1);
			notice.setNoticeImgName(newNoticeImgName);
		}
		if (deleteImg == 1) {

			notice.setNoticeImgStatus(0);
			notice.setNoticeImgName(null);
		}

		int result = noticeDao.updateNotice(sqlSession, notice);

		if (result < 1) {
			if (newNoticeImgName != null) {
				new File(path).delete();
			}
			throw new RuntimeException("공지사항  업데이트 db 오류");
		}
		if ((notice.getNoticeImgStatus() == 1 && deleteImg == 1) || (check == 1 && newNoticeImgName != null)) {
			if (!(new File(deletePath).delete())) {
				throw new RuntimeException("파일 삭제 오류");

			}

		}

	}

	//공지사항 삭제
	@Override
	public void deleteNotice(int noticeNo, String path, int fileStatus) {

		int result = noticeDao.deleteNotice(sqlSession, noticeNo);

		if (result < 1) {
			throw new RuntimeException("공지사항  삭제 db 오류");

		}
		if (fileStatus == 1) {
			if (!(new File(path).delete())) {
				throw new RuntimeException("파일 삭제 오류");
			}
		}

	}

}

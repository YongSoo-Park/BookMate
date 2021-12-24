package com.kh.bookmate.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public List<Notice> selectNoticeList(SqlSessionTemplate sqlSession, String noticeTitle, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.selectNoticeList",noticeTitle,rb);
	}

	public int selectNoticeCount(SqlSessionTemplate sqlSession, String noticeTitle) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNoticeCount",noticeTitle);
	}

	public Notice selectNoticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNoticeDetail",noticeNo);
	}

	public int updateReadCount(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateReadCount",noticeNo);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice",notice);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice",notice);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("noticeMapper.deleteNotice",noticeNo);
	}

}

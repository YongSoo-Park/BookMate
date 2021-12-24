package com.kh.bookmate.main.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.dao.MainDao;
import com.kh.bookmate.main.model.vo.RecentView;
import com.kh.bookmate.notice.model.vo.Notice;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainDao mainDao;

	@Override
	public List<Book> selectBestList() {
		// TODO Auto-generated method stub
		return mainDao.selectBestList(sqlSession);
	}

	@Override
	public List<Book> selectTodayList(int category_number) {
		// TODO Auto-generated method stub
		return mainDao.selectTodayList(sqlSession, category_number);
	}

	@Override
	public void insertRecentView(String bookISBN, String userId) {
		int result1 = -1;
		int result2 = -1;
		
		//0) insert, update 정하기 전 조회
		RecentView rv = selectRecentView(userId);
		
		//1) 조회결과에 따라 insert, update하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		
		if(rv == null) { 						//1-1)최근본상품 없는 경우(insert)
			map.put("bookISBN", bookISBN);
			result1 = mainDao.insertRecentView(sqlSession, map);
			
		}else {          						//1-2)최근본상품 있는 경우(update)
			String[] arr = rv.getBooks().split(",");
			ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
			
			//최근본상품조회에 이미 같은 책이 있는 경우 삭제해주기
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).equals(bookISBN)) {
					list.remove(i);
				}
			}
			
			//최근본상품으로 저장된 책이 12권 이상인 경우 -> 맨 뒤 삭제하기
			if(list.size() >= 12) {
				list.remove(11);
			}
			//최근본 상품 -> 맨앞에 추가하기
			list.add(0, bookISBN);
			
			String bookISBNS = String.join(",", list);
			
			map.put("bookISBNS", bookISBNS);
			result2 = mainDao.updateRecentView(sqlSession, map);
		}

		if(result1 * result2 < 0) {
			//오류처리
		}
		
	}

	@Override
	public RecentView selectRecentView(String userId) {
		// TODO Auto-generated method stub
		return mainDao.selectRecentView(sqlSession, userId);
	}

	@Override
	public List<Book> selectRecentViewList(ArrayList<String> isbnList) {
		// TODO Auto-generated method stub
		return  mainDao.selectRecentViewList(sqlSession, isbnList);
	}

	@Override
	public List<Notice> selectEventImg() {
		return  mainDao.selectEventImg(sqlSession);
	}

}

package com.kh.bookmate.common;

public class Paging {
	private int nowPage;  // 화면에 보여질 페이지
	private int startPage; // 하단에 보여질 페이지 번호 시작 숫자
	private int endPage; // 하단에 보여질 페이지 번호 마지막 숫자
	private int total; // 모든 자료의 개수
	private int cntPerPage; //한 페이지에 보여질 자료 수, MYBATIS 사용시 LIMIT
	private int lastPage; // 마지막 페이지 번호
	private int start; // sql에서 사용할 가져올 자료 범위 시작 부분 , MYBATIS 사용시 OFFSET 으로 -1후에 사용
	private int end; //sql에서 사용할 가져올 자료 범위 끝 부분
	private int cntPage; // 하단에 보여질 페이지 범위
	private int prePage; // pre 버튼이 필요한지 여부
	private int nextPage; // next 버튼이 필요한지 여부
	
	
	
	public Paging() {
	}
	
	public Paging(int total, int nowPage, int cntPerPage,int cntPage) {
		setCntPage(cntPage);
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		calcPrePage(getStartPage(), cntPage);
		calcNextPage(getStartPage(), getLastPage(), cntPage);
	}
	
	private void calcNextPage(int startPageTemp, int lastPageTemp, int cntPageTemp) {
		if((startPageTemp+cntPageTemp) <= lastPageTemp) {
			setNextPage(1);
		}else {
			setNextPage(0);
		}
		
	}

	private void calcPrePage(int startPageTemp, int cntPageTemp) {
		if(startPageTemp>cntPageTemp) {
			setPrePage(1);
		}else {
			setPrePage(0);
		}
	}

	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
	}
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}	
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", prePage=" + prePage + ", nextPage=" + nextPage + "]";
	}
	
}

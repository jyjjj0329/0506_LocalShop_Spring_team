package kr.project.VO;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public class GoodsSoldList {
	private ArrayList<GoodsSoldVO> goodsSoldVO = new ArrayList<GoodsSoldVO>();
	private int pageSize = 12;
	private int totalCount = 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo = 0;
	private int endNo = 0;
	
	public GoodsSoldList() { }
	
//	인수 초기화
	public void initPageList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
//	값을 초기화(계산) 시켜주는 함수
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
	}
	
	public ArrayList<GoodsSoldVO> getGoodsSoldVO() {
		return goodsSoldVO;
	}

	public void setGoodsSoldVO(ArrayList<GoodsSoldVO> goodsSoldVO) {
		this.goodsSoldVO = goodsSoldVO;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	@Override
	public String toString() {
		return "GoodsSoldList [goodsSoldVO=" + goodsSoldVO + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + "]";
	}
	
	
}

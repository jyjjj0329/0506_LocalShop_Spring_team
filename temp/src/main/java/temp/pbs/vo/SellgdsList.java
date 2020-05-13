package temp.pbs.vo;

import java.util.ArrayList;

public class SellgdsList {
	
	private ArrayList<SellgdsVO> sellgdsvo = new ArrayList<SellgdsVO>();
	private int pageSize = 5;
	private int totalCount = 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo = 0;
	private int endNo = 0;
	private int startPage = 0;
	private int endPage = 0;

	public SellgdsList() {}
//	pageSize, totalCount, currentPage를 인수로 넘겨받아 멤버 변수를 초기화 시키는 메소드
	public void initSellgdsList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 5 * 5 + 1;
		endPage = startPage + 4;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
}

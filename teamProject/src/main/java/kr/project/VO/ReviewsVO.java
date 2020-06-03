package kr.project.VO;

import java.util.Date;

public class ReviewsVO {

	private int sellgds_idx; 
	private int idx;
	private String buyer_id;
	private int star;
	private String content;
	private Date reg_date;
	
	public int getSellgds_idx() {
		return sellgds_idx;
	}
	public void setSellgds_idx(int sellgds_idx) {
		this.sellgds_idx = sellgds_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "ReviewsVO [sellgds_idx=" + sellgds_idx + ", idx=" + idx + ", buyer_id=" + buyer_id + ", star=" + star
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	
	
	

}

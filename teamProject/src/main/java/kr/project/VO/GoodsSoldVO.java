package kr.project.VO;

import org.springframework.stereotype.Repository;

/** 판매된 물품 리스트 */
@Repository
public class GoodsSoldVO {

	private int idx;
	private String buyer_id;
	private String seller_id;
	private String del_status;
	private String name;
	private String phonenum;
	private String address;
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
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getDel_status() {
		return del_status;
	}
	public void setDel_status(String del_status) {
		this.del_status = del_status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "GoodsSoldVO [idx=" + idx + ", buyer_id=" + buyer_id + ", seller_id=" + seller_id + ", del_status="
				+ del_status + ", name=" + name + ", phonenum=" + phonenum + ", address=" + address + "]";
	}
	
	
}

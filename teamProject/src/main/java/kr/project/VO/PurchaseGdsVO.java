package kr.project.VO;

import org.springframework.stereotype.Repository;

// 구매내역에 사용할 VO
@Repository
public class PurchaseGdsVO {
	
	private int idx;
	private String BuyerID;
	private String GdsName;
	private int num;
	private int price;
	private String origin;
	private String category;
	private String area;
	private String DOP;
	private String image_name;
	private long image_size;
	private String store;
	private String del_status;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBuyerID() {
		return BuyerID;
	}
	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}
	public String getGdsName() {
		return GdsName;
	}
	public void setGdsName(String gdsName) {
		GdsName = gdsName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDOP() {
		return DOP;
	}
	public void setDOP(String dOP) {
		DOP = dOP;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public long getImage_size() {
		return image_size;
	}
	public void setImage_size(long image_size) {
		this.image_size = image_size;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getDel_status() {
		return del_status;
	}
	public void setDel_status(String del_status) {
		this.del_status = del_status;
	}
	@Override
	public String toString() {
		return "PurchaseGdsVO [idx=" + idx + ", BuyerID=" + BuyerID + ", GdsName=" + GdsName + ", num=" + num
				+ ", price=" + price + ", origin=" + origin + ", category=" + category + ", DOP=" + DOP
				+ ", image_name=" + image_name + ", image_size=" + image_size + ", store=" + store + "]";
	}
	
	
	
	
	
}

package kr.project.VO;

import org.springframework.stereotype.Repository;

/** 판매 물품 VO */
@Repository
public class SellerGdsVO {

	private String seller_id;
	private int idx;
	private int price;
	private int num;
	private String category;
	private String name;
	private String origin;
	private String area;
	private String content; 
	private String image_name;
	private long image_size;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
<<<<<<< HEAD
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
=======
>>>>>>> refs/heads/parkc
	@Override
	public String toString() {
		return "SellerGdsVO [seller_id=" + seller_id + ", idx=" + idx + ", price=" + price + ", num=" + num
<<<<<<< HEAD
				+ ", category=" + category + ", name=" + name + ", origin=" + origin + ", area=" + area + ", content="
				+ content + ", image_name=" + image_name + ", image_size=" + image_size + "]";
=======
				+ ", category=" + category + ", name=" + name + ", origin=" + origin + ", content=" + content
				+ ", image_name=" + image_name + ", image_size=" + image_size + "]";
>>>>>>> refs/heads/parkc
	}

	
	
	
	
	
	
}

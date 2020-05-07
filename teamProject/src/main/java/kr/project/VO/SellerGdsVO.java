package kr.project.VO;

import org.springframework.stereotype.Repository;

@Repository
public class SellerGdsVO {

	private int price;
	private int num;
	private String title;
	private String origin;
	private String content; 
	private String org_image_name;
	private int imageSize;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getOrg_image_name() {
		return org_image_name;
	}
	public void setOrg_image_name(String org_image_name) {
		this.org_image_name = org_image_name;
	}
	public int getImageSize() {
		return imageSize;
	}
	public void setImageSize(int imageSize) {
		this.imageSize = imageSize;
	}
	@Override
	public String toString() {
		return "SellerGdsVO [price=" + price + ", num=" + num + ", title=" + title + ", origin=" + origin + ", content="
				+ content + ", org_image_name=" + org_image_name + ", imageSize=" + imageSize + "]";
	}
	
	
	
}

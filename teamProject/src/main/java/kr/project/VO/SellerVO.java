package kr.project.VO;

import org.springframework.stereotype.Repository;

/** 판매자 VO */
@Repository
public class SellerVO {

	private String id;
	private String pw;
	private String name;
	private boolean gender;
	private int age;
	private String email;
	private String phonenum;
	private String regnum;
	private String store;
	private String area;
	private String storeaddress;
	private String storeimg_Name;
	private String extension;
	
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getRegnum() {
		return regnum;
	}
	public void setRegnum(String regnum) {
		this.regnum = regnum;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStoreaddress() {
		return storeaddress;
	}
	public void setStoreaddress(String storeaddress) {
		this.storeaddress = storeaddress;
	}
	public String getStoreimg_Name() {
		return storeimg_Name;
	}
	public void setStoreimg_Name(String storeimg_Name) {
		this.storeimg_Name = storeimg_Name;
	}
	
	@Override
	public String toString() {
		return "SellerVO [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", age=" + age
				+ ", email=" + email + ", phonenum=" + phonenum + ", regnum=" + regnum + ", store=" + store + ", area="
				+ area + ", storeaddress=" + storeaddress + ", storeimg_Name=" + storeimg_Name + ", extension="
				+ extension + "]";
	}
	
}

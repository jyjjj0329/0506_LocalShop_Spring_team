package kr.project.VO;

import org.springframework.stereotype.Repository;


/** 일반 회원(소비자)의 회원가입 정보 한 건 */

@Repository
public class BuyerVO {

	/** 인덱스, 이름, 아이디, 비밀번호, 별명, 성별,
	 * 나이, 이메일, 휴대폰 번호, 카드 번호, 지역, 주소 */

	private int idx;
	private String name;
	private String id;
	private String pw;
	private String nickname;
	private boolean gender;
	private int age;
	private String email; 
	private String carrier;
	private String phonenum;
	private String creditcard;
	private String cardNum;
	private String area;
	private String address;
	private int money;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getCreditcard() {
		return creditcard;
	}
	public void setCreditcard(String creditcard) {
		this.creditcard = creditcard;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "VO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", gender=" + gender + ", age=" + age + ", email=" + email + ", phonenum=" + phonenum + ", cardNum="
				+ cardNum + ", area=" + area + ", address=" + address + "]";
	}
	
	
}

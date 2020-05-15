package kr.project.buyerVO;

// 일반 회원(소비자)의 회원가입 정보 한 건을 저장하는 클래스

public class BuyerVO {
	private int idx;
	private String name;
	private String id;
	private String pw;
	private String nickname;
	private boolean gender;
	private int age;
	private String email; 
	private String phonenum;
	private String cardNum;
	private String area;
	private String address;
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
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
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

	@Override
	public String toString() {
		return "VO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", gender=" + gender + ", age=" + age + ", email=" + email + ", phonenum=" + phonenum + ", cardNum="
				+ cardNum + ", area=" + area + ", address=" + address + "]";
	}
	
	
}

package kr.project.VO;

import org.springframework.stereotype.Repository;

@Repository
public class ConsumerFaqVO {
	
	private int idx;
	private String id;
	private String password;
	private String email;
	private String category;
	private String question;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
	@Override
	public String toString() {
		return "ConsumerFaqVO [idx=" + idx + ", category=" + category + ", question=" + question + "]";
	}
	
	
	
}

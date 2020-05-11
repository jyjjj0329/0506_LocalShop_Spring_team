package kr.project.Controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.project.DAO.SellerGdsDAO;

@Controller
public class HomeController {
	
//	SqlSession을 사용하기 위해 변수를 만들고 다른 설정 없이도 자동으로 실행되게 @Autowired 해줌.
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	
//	회원가입 버튼 클릭시
	@RequestMapping(value = "/signUp")
	public String signUp() {
		
		return "signUp/signUp";
	}
	
//	판매자 회원가입
	@RequestMapping(value = "/sellerSignUp")
	public String sellerSignUp() {
		
		return "signUp/sellerSignUp";
	}
	
//	ID 중복체크
	@RequestMapping(value = "/sellerCheckID")
	public String sellerCheckID(HttpServletRequest req, Model model) {
		System.out.println("컨트롤러에서 sellerCheckID 들어옴.");
		
		String id = req.getParameter("id");
		System.out.println("sellerCheckID에서 id의 값은 : " + id);
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		int result = mapper.CheckID(id);
		System.out.println("sellerCheckID에서 result의 값은 : " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		
		return "signUp/sellerCheckID";
	}
	
//	판매자 회원가입
	@RequestMapping(value = "/sellerSignUpOK")
	public String sellerSignUpOK(HttpServletRequest req, Model model) {
		
		return "signUp/sellerResult";
	}
	
	
}

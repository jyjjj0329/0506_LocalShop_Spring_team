package kr.project.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;

import kr.project.DAO.BuyerDAO;
import kr.project.VO.BuyerVO;

@Controller
public class MypageController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	public BuyerVO buyerVO;
	
//	비밀번호를 한번 더 입력 받는다.
	@RequestMapping(value="/mypage")
	public String mypage(HttpServletRequest request, Model model) {

		return "mypage/mypage";
	}
	
//	마이페이지
	@RequestMapping(value="/myinfo")
	public String myinfo(HttpServletRequest request, Model model, BuyerVO buyerVO) {
		System.out.println("myinfo에서 흔적을 남김.");
		String pw = request.getParameter("pw");
		model.addAttribute("pw", pw);
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		buyerVO = mapper.buyerInfo(id);
//		if(buyerVO.getId().equals(id)) {
//			System.out.println("통과");
//		} else {
//			System.out.println("?");
//		}
		model.addAttribute("buyerVO" , buyerVO);
		
		return "mypage/myinfo";
	}
	
//	탈퇴
	@RequestMapping(value="/infodelete")
	public String infodelete(HttpServletRequest request) {
		System.out.println("infodelete 실행");
		HttpSession session = request.getSession();
//		현재는 판매자 id를 받아서 사용 중임
		String id = (String) session.getAttribute("seller_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		mapper.buyerInfoDelete(id);
//		세션 정보 초기화
		session.invalidate();
		
		return "main/mainpage";
	}
//	비밀번호 변경
	@RequestMapping(value="/pwchange")
	public String pwchange(HttpServletRequest request, Model model) {
		System.out.println("pwchange 실행");
		/*
		 * HttpSession session = request.getSession(); String bpw = (String)
		 * session.getAttribute("seller_pw"); model.addAttribute("beforepw", bpw);
		 */
		return "mypage/pwchange";
	}
	
	@RequestMapping(value="/pwchk")
	public String pwchk(HttpServletRequest request, Model model) {
		System.out.println("pwchk 실행");
		String pw = request.getParameter("afterpw");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("id", id);
		hmap.put("pw", pw);
		mapper.changePW(hmap);
//		세션 정보 초기화
		session.invalidate();
		
		return "main/mainpage";
	}
	
	@RequestMapping(value="/infochange")
	public String infochange(HttpServletRequest request, Model model) {
		System.out.println("infochange 실행");
		
		return "mypage/infochange";
	}
}

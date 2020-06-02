package kr.project.Controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("컨트롤러에서 pw의 값은 : " + pw);
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		System.out.println("컨트롤러에서 id의 값은 : " + id);
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
		String id = (String) session.getAttribute("buyer_id");
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
		return "mypage/pwchange";
	}
	
	@RequestMapping(value="/pwchk")
	public String pwchk(HttpServletRequest request, Model model) {
		System.out.println("pwchk 실행");
		String pw = request.getParameter("afterpw");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
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
	public String infochange(HttpServletRequest request, Model model, BuyerVO buyerVO) {
		System.out.println("infochange 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		buyerVO = mapper.buyerInfo(id);
		
		model.addAttribute("buyerVO", buyerVO);
		
		return "mypage/infochange";
	}

	@RequestMapping(value="/infochangeOK")
	public String infochangeOK(HttpServletRequest request, BuyerVO vo) {
		System.out.println("infochange 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
//		id를 통해 vo를 가져오는 mapper
		vo = mapper.buyerInfo(id);
//		기존 address를 가져온다.
		String address = vo.getAddress();
//		System.out.println(address);
		vo.setId(id);
		vo.setName(request.getParameter("name"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
		if(Integer.parseInt(request.getParameter("age"))>150) {
			vo.setAge(150);
		}
		vo.setCarrier(request.getParameter("carrier"));
		vo.setPhonenum(request.getParameter("phonenum"));
		vo.setArea(request.getParameter("area"));
		vo.setCreditCard(request.getParameter("creditCard"));
		vo.setCardNum(request.getParameter("cardNum"));
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		vo.setEmail(email);
//		주소 파라미터값 3개가 다 ""이 아닐 경우에 값을 받아서 address에 넣는다.
		if((!request.getParameter("postcode").trim().equals(""))&&(!request.getParameter("address1").trim().equals(""))&&(!request.getParameter("address3").trim().equals(""))) {
			address = "(" + request.getParameter("postcode") + ")" + request.getParameter("address1")
			+ request.getParameter("address3");
		}
//		System.out.println(request.getParameter("postcode"));
//		System.out.println(request.getParameter("address1"));
//		System.out.println(request.getParameter("address3"));
		vo.setAddress(address);
		mapper.updateInfo(vo);
		
		
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/buyerNicknameUpdate")
	public String buyerNicknameUpdate(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러에서 nickname 체크하러옴");
		String nickname = request.getParameter("nickname");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		int result = mapper.CheckNickname(nickname);
		model.addAttribute("result", result);
		model.addAttribute("nickname", nickname);
		
		return "mypage/buyerCheckNickname";
	}
	
	@RequestMapping(value="/moneycharge")
	public String moneycharge(HttpServletRequest request, Model model, BuyerVO vo) {
		System.out.println("Mypage 컨트롤러에서 moneycharge");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
//		id를 통해 vo를 가져오는 mapper
		vo = mapper.buyerInfo(id);
		int money = vo.getMoney();
		model.addAttribute("money", money);
		
		return "mypage/moneycharge";
	}
	
	@RequestMapping(value="/paycomplete")
	public String paymoneycheck(HttpServletRequest request) {
		System.out.println("Mypage 컨트롤러에서 paymoneycheck 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		int money = Integer.parseInt(request.getParameter("moneyadd"));
		System.out.println(money);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("id", id);
		hmap.put("money", money);
		mapper.moneyadd(hmap);
		
		return "mypage/paycomplete";
		
	}
	
}

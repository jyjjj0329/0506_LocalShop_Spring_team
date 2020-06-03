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
import kr.project.DAO.PurchaseGdsDAO;
import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.BuyerVO;
import kr.project.VO.PurchaseGdsListVO;
import kr.project.VO.PurchaseGdsVO;

@Controller
public class MypageController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private PurchaseGdsListVO purchaseGdsListVO;
	
	@Autowired
	private PurchaseGdsVO purchaseGdsVO;
	
//	비밀번호 확인 처리 
	@RequestMapping(value="/mypage")
	public String mypage(HttpServletRequest request, Model model) {
		return "mypage/mypage";
	}
	
//	마이페이지
	@RequestMapping(value="/myinfo")
	public String myinfo(HttpServletRequest request, Model model, BuyerVO buyerVO) {
		System.out.println("myinfo에서 흔적을 남김.");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		System.out.println("컨트롤러에서 id의 값은 : " + id);
		buyerVO = mapper.buyerInfo(id);
		model.addAttribute("buyerVO" , buyerVO);		
		return "mypage/myinfo";
	}
	
//	탈퇴
	@RequestMapping(value="/infodelete")
	public String infodelete(HttpServletRequest request) {
		System.out.println("infodelete 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		mapper.buyerInfoDelete(id);
//		세션 정보 초기화 -> 로그아웃
		session.invalidate();
		return "main/mainpage";
	}
//	비밀번호 변경 창
	@RequestMapping(value="/pwchange")
	public String pwchange(HttpServletRequest request, Model model) {
		System.out.println("pwchange 실행");
		return "mypage/pwchange";
	}
	
//	비밀번호 확인 후 변경
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
	
//	정보 수정
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

//	현재 닉네임을 바꿔야만 확인이 가능한데 추후 수정 예정
	@RequestMapping(value="/infochangeOK")
	public String infochangeOK(HttpServletRequest request, BuyerVO vo, Model model) {
		System.out.println("infochange 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
//		id를 통해 vo를 가져오는 mapper
		vo = mapper.buyerInfo(id);
//		기존 address를 가져온다.
		String address = vo.getAddress();
//		vo에 변경될 값들을 넣는다.
		vo.setId(id);
		vo.setName(request.getParameter("name"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
//		number 창에 있는 화살표로는 1~150까지기 때문에 최대 150으로 받는다.
		if(Integer.parseInt(request.getParameter("age"))>150) {
			vo.setAge(150);
		}
		vo.setCarrier(request.getParameter("carrier"));
		vo.setPhonenum(request.getParameter("phonenum"));
		vo.setArea(request.getParameter("area"));
		vo.setCreditcard(request.getParameter("creditcard"));
		vo.setCardNum(request.getParameter("cardNum"));
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		vo.setEmail(email);
//		주소 파라미터값 3개가 다 ""이 아닐 경우에 값을 받아서 address에 넣는다.
		if((!request.getParameter("postcode").trim().equals(""))&&(!request.getParameter("address1").trim().equals(""))&&(!request.getParameter("address3").trim().equals(""))) {
			address = "(" + request.getParameter("postcode") + ")" + request.getParameter("address1")
			+ request.getParameter("address3");
		}
		vo.setAddress(address);
		mapper.updateInfo(vo);
		model.addAttribute("buyerVO", vo);
		return "mypage/myinfo";
	}
	/** 별명 중복체크 페이지 호출 */
	@RequestMapping(value = "/buyerUpdateCheckNickname")
	public String buyerUpdateCheckNickname(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러에서 buyerUpdateCheckNickname 들어옴.");
		
		/** nickname 값을 받고, 받은 nickname 값을 DB내의 nickname 값과 대조하여
		 *  일치하는 nickname의 개수를 반환받아 출력 */
		String nickname = request.getParameter("nickname");
		System.out.println("buyerCheckNickname에서 nickname의 값은 : " + nickname);
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		int result = mapper.CheckNickname(nickname);
		System.out.println("buyerCheckNickname에서 result의 값은 : " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("nickname", nickname);
		
		return "mypage/buyerUpdateCheckNickname";
	}
//	금액 충전 창
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
	
//	moneycharge에서 충전 버튼을 누를 때
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
	
// infochange에서 구매내역 버튼을 누를 때
	@RequestMapping(value="/buyhistory")
	public String buyhistory(HttpServletRequest request, Model model) {
		System.out.println("Mypage 컨트롤러에서 buyhistory 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("buyer_id");
//		페이지 관련 코드
		int page;
		if(request.getParameter("page")==null) {
		page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println(page);
		int pageSize = 4;
		PurchaseGdsDAO mapper = sqlSession.getMapper(PurchaseGdsDAO.class);
		BuyerVO vo = mapper.getbuyerid(id);
		System.out.println(vo);
		purchaseGdsListVO.setTotalCount(mapper.sellectCount(id));
//		Page값 초기화
		System.out.println("totalcount"+purchaseGdsListVO.getTotalCount());
		purchaseGdsListVO.initPageList(pageSize, purchaseGdsListVO.getTotalCount(), page);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", purchaseGdsListVO.getStartNo());
		hmap.put("endNo", purchaseGdsListVO.getEndNo());
		hmap.put("buyerid", id);
		hmap.put("area", vo.getArea());
		System.out.println("hmap"+hmap);
		purchaseGdsListVO.setPurchaseGdsVO(mapper.selectList(hmap));
		System.out.println("asdasd"+purchaseGdsListVO.getPurchaseGdsVO());
		model.addAttribute("purchaseGdsListVO", purchaseGdsListVO);
		return "mypage/buyhistory";
	}
	
	
}

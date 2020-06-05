package kr.project.Controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.SellerVO;

@Controller
public class SellerMypageController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	public SellerVO sellerVO;
	
//	비밀번호를 한번 더 
	@RequestMapping(value="/sellerMyPage")
	public String sellerMypage(HttpServletRequest request, Model model) {
		
		return "seller/sellerMyPage";
	}
	
//	마이페이지
	@RequestMapping(value="/sellerMyInfo")
	public String sellerMyinfo(HttpServletRequest request, Model model, SellerVO sellerVO) {
		System.out.println("myinfo에서 흔적을 남김.");
		String pw = request.getParameter("pw");
		model.addAttribute("pw", pw);
		System.out.println("컨트롤러에서 pw의 값은 : " + pw);
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		System.out.println("컨트롤러에서 id의 값은 : " + id);
		sellerVO = mapper.sellerInfo(id);
//		if(buyerVO.getId().equals(id)) {
//			System.out.println("통과");
//		} else {
//			System.out.println("?");
//		}
		model.addAttribute("sellerVO" , sellerVO);
		
		return "seller/sellerMyInfo";
	}
	
//	탈퇴
	@RequestMapping(value="/sellerInfodelete")
	public String sellerInfodelete(HttpServletRequest request) {
		System.out.println("infodelete 실행");
		HttpSession session = request.getSession();
//		현재는 판매자 id를 받아서 사용 중임
		String id = (String) session.getAttribute("seller_id");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
//수정
		mapper.sellerInfoDelete(id);
//		세션 정보 초기화
		session.invalidate();
		
		return "main/mainpage";
	}
//	비밀번호 변경
	@RequestMapping(value="/sellerPwchange")
	public String sellerPwchange(HttpServletRequest request, Model model) {
		System.out.println("sellerPwchange 실행 - 1");
		return "seller/sellerPwchange";
	}
	
	@RequestMapping(value="/sellerPwchk")
	public String sellerPwchk(HttpServletRequest request, Model model) {
		System.out.println("sellerPwchk 실행 - 2");
		String pw = request.getParameter("afterpw");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("id", id);
		hmap.put("pw", pw);
	
		mapper.sellerChangePW(hmap);
//		세션 정보 초기화
		session.invalidate();
		
		return "main/mainpage";
	}
	
	@RequestMapping(value="/sellerInfochange")
	public String sellerInfochange(HttpServletRequest request, Model model, SellerVO sellerVO) {
		System.out.println("sellerInfochange 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		sellerVO = mapper.sellerInfo(id);
		
		model.addAttribute("sellerVO", sellerVO);
		
		return "seller/sellerInfochange";
	}

	@RequestMapping(value="/sellerInfochangeOK")
	public String sellerInfochangeOK(HttpServletRequest request, SellerVO vo) {
		System.out.println("sellerInfochange OK 실행");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("seller_id");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
//		id를 통해 vo를 가져오는 mapper
		vo = mapper.sellerInfo(id);
//		기존 address를 가져온다.
		String storeaddress = vo.getStoreaddress();
//		System.out.println(address);
		vo.setId(id);
		vo.setName(request.getParameter("name"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
		if(Integer.parseInt(request.getParameter("age"))>150) {
			vo.setAge(150);
		}
		vo.setPhonenum(request.getParameter("phonenum"));
		vo.setRegnum(request.getParameter("regnum"));
		vo.setStore(request.getParameter("store"));
		vo.setArea(request.getParameter("area"));
// storeaddress 설정해야함		vo.set(request.getParameter("cardNum"));
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		vo.setEmail(email);
//		주소 파라미터값 3개가 다 ""이 아닐 경우에 값을 받아서 address에 넣는다. 
		if((!request.getParameter("postcode").trim().equals(""))&&(!request.getParameter("address1").trim().equals(""))&&(!request.getParameter("address3").trim().equals(""))) {
			storeaddress = "(" + request.getParameter("postcode") + ")" + request.getParameter("address1")
			+ request.getParameter("address3");
		}
		
		
		vo.setStoreaddress(storeaddress);
		
		
		mapper.sellerUpdateInfo(vo);
		
		return "seller/sellerMyPage";
	}
	

	
}

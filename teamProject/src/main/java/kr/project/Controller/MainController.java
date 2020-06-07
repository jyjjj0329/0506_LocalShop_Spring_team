package kr.project.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.project.DAO.BuyerDAO;
import kr.project.VO.ReviewsVO;
import kr.project.VO.SellerGdsListVO;
import kr.project.VO.SellerGdsVO;

@Controller
public class MainController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		System.out.println("컨트롤러에서 최초 mainpage로 들어옴");
		HttpSession session = req.getSession();
		session.removeAttribute("seller_id");                                                                                                
		session.removeAttribute("buyer_id");

		return "main/mainpage";
	}
	
	/** 메인 페이지 */
	@RequestMapping("/mainpage")
	private String home() {
		System.out.println("컨트롤러에서 mainpage로 들어옴");
		
		return "main/mainpage";
	}
	
//	소비자 물품
	@RequestMapping(value = "/buyerList")
	public String buyerList(Model model, HttpServletRequest req, SellerGdsListVO sellerGdsListVO) {
		System.out.println("컨트롤러에서 sellerList에 들어옴.");
		
//		area와 category의 값을 받아옴.
		String area = req.getParameter("area");
		String category = req.getParameter("category");
//		카테고리 값이 파라미터로 받는 값이 없다면 기본 셋팅값인 의류로 카테고리가 지정된다.
		if(category == null) {
			category = "의류";
		}
//		search 값 받음
		String search = req.getParameter("search");
//		값이 잘 들어왔는지 확인
		System.out.println("컨트롤러에서 area의 값은 : " + area);
		System.out.println("컨트롤러에서 category의 값은 : " + category);
		System.out.println("search의 값은 : " + search);
		
//		페이지 관련 코드
		int page = Integer.parseInt(req.getParameter("page"));
		
//		hmap에 area와 category 배열을 저장함.
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("area", area);
		hmap.put("category", category);
		hmap.put("search", search);
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
//		페이징을 하기 위한 총 페이지 갯수 가져오는 코드.
		sellerGdsListVO.setTotalCount(mapper.sellectCount(hmap));
		System.out.println("컨트롤러에서 sellectCount의 값은 : " + sellerGdsListVO.getTotalCount());
//		Page값 초기화
		sellerGdsListVO.initPageList(sellerGdsListVO.getPageSize(), sellerGdsListVO.getTotalCount(), page);
		
		hmap.put("startNo", sellerGdsListVO.getStartNo());
		hmap.put("endNo", sellerGdsListVO.getEndNo());
		sellerGdsListVO.setSellerGdsVO(mapper.selectList(hmap));
		model.addAttribute("sellerGdsListVO", sellerGdsListVO);
		model.addAttribute("area", area);
		model.addAttribute("category", category);
		
		return "buyer/buyerList";
	}
	
//	상품 상세정보 페이지 이동
	@RequestMapping(value = "buyerDetail")
	public String buyerDetail(HttpServletRequest req, Model model, 
			SellerGdsVO sellerGdsVO) {
		System.out.println("컨트롤러에서 buyerDetail에 들어옴.");
		
//		물품의 상세정보로 들어가기 위해 idx를 받아옴
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
//		idx를 기준으로 상세페이지 정보 가져와 넣어줌.
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		sellerGdsVO = mapper.buyerDetail(idx);
		
		System.out.println("sellerGdsVO의 값은 : " + sellerGdsVO.toString());
		model.addAttribute("sellerGdsVO", sellerGdsVO);
		
//		------------------------------------------------------------------------
		int sellgds_idx = idx;
//		댓글 총갯수
		int reviewsCount = mapper.reviewsCount(sellgds_idx);
		ArrayList<ReviewsVO> reviewsVO = null;
		if(reviewsCount > 0) {
//			댓글 보이기
			reviewsVO = mapper.reviewsSelect(sellgds_idx);
			System.out.println("컨트롤러에서 reviewsVO의 값은 : " + reviewsVO);
		}
		System.out.println("컨트롤러에서 reviewsCount의 값은 : " + reviewsCount);
		
//		model 객체에 담아줌.
		model.addAttribute("reviewsCount", reviewsCount);
		model.addAttribute("reviewsVO", reviewsVO);
		
		return "buyer/buyerDetail";
	}
	
//	댓글 입력
	@RequestMapping(value = "reviews")
	public String reviews(HttpServletRequest req, ReviewsVO reviewsVO) {
		System.out.println("컨트롤러에서 reviews에 들어옴.");
		System.out.println("컨트롤러에서 reviewsVO의 값은 : " + reviewsVO.toString());
		
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		
//		sellgds_idx 따로 꼽아줌.
		int sellgds_idx = Integer.parseInt(req.getParameter("sellgds_idx"));
		reviewsVO.setSellgds_idx(sellgds_idx);
		 
		
//		소비자 id도 따로 꼽아줌.
		HttpSession session = req.getSession();
		String buyer_id = (String) session.getAttribute("buyer_id");
		reviewsVO.setBuyer_id(buyer_id);

		mapper.revewsInsert(reviewsVO);
		System.out.println("컨트롤러에서 reviewsVO의 값은 : " + reviewsVO.toString());
		System.out.println("컨트롤러에서 sellgds_idx의 값은 : " + reviewsVO.getSellgds_idx());
		return "redirect:buyerDetail?idx=" + reviewsVO.getSellgds_idx();
	}

}

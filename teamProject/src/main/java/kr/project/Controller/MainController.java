package kr.project.Controller;

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
import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.SellerGdsListVO;

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
	
	@RequestMapping("/mainpage")
	private String mainpage() {
		System.out.println("컨트롤러에서 mainpage로 들어옴");
		
		return "main/mainpage";
	}
	
	@RequestMapping("/category")
	private String category(HttpServletRequest request, Model model) {
		
		String area = request.getParameter("area");
		model.addAttribute("area", area);
		
		return "main/category";
	}
	
	@RequestMapping(value = "/buyerList")
	public String buyerList(Model model, HttpServletRequest req, SellerGdsListVO sellerGdsListVO) {
		System.out.println("컨트롤러에서 sellerList에 들어옴.");
		
//		area와 category의 값을 받아옴.
		String area = req.getParameter("area");
		String category = req.getParameter("category");
//		값이 잘 들어왔는지 확인
		System.out.println("list에서 area의 값은 : " + area);
		System.out.println("list에서 category의 값은 : " + category);
		
//		페이지 관련 코드
		int page = Integer.parseInt(req.getParameter("page"));
		int pageSize = 4;
		
//		hmap에 area와 category 배열을 저장함.
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("area", area);
		hmap.put("category", category);
		BuyerDAO mapper = sqlSession.getMapper(BuyerDAO.class);
		sellerGdsListVO.setTotalCount(mapper.sellectCount(hmap));
		System.out.println("컨트롤러에서 sellectCount의 값은 : " + sellerGdsListVO.getTotalCount());
//		Page값 초기화
		sellerGdsListVO.initPageList(pageSize, sellerGdsListVO.getTotalCount(), page);
		
		hmap.put("startNo", sellerGdsListVO.getStartNo());
		hmap.put("endNo", sellerGdsListVO.getEndNo());
//		sellerGdsListVO.setSellerGdsVO(mapper.selectList(hmap));
		model.addAttribute("sellerGdsListVO", sellerGdsListVO);
		model.addAttribute("area", area);
		model.addAttribute("category", category);
		
		return "/seller/sellerList";
	}
}

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
import kr.project.VO.PurchaseGdsVO;
import kr.project.VO.SellerGdsVO;

@Controller
public class PaymentController {
	
	@Autowired
	SqlSession sqlsession;
	
//	결제 페이지 이동
	@RequestMapping(value = "payment")
	public String payment(HttpServletRequest req, Model model, SellerGdsVO sellerGdsVO) {
		System.out.println("컨트롤러에서 payment에 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		int num = Integer.parseInt(req.getParameter("num"));
		
		BuyerDAO mapper = sqlsession.getMapper(BuyerDAO.class);
		sellerGdsVO = mapper.paymentSelect(idx); 
		
		model.addAttribute("num", num);
		model.addAttribute("sellerGdsVO", sellerGdsVO);
		return "payment/payment";
	}
	
//	결제함.
	@RequestMapping(value = "paymentOK")
	public String paymentOK(HttpServletRequest req, Model model, PurchaseGdsVO purchaseGdsVO) {
		System.out.println("컨트롤러에서 paymentOK에 들어옴.");
		
//		buyerID 꼽아줌.
		HttpSession session = req.getSession();
		String buyerID = (String) session.getAttribute("buyer_id");
		purchaseGdsVO.setBuyerID(buyerID);
		
//		phonenum 꼽아줌.
		String phonenum = "(" + req.getParameter("phonenum1") + ")" 
		+ req.getParameter("phonenum2") + req.getParameter("phonenum3") 
		+ req.getParameter("phonenum4");
		purchaseGdsVO.setPhonenum(phonenum);

//		address 꼽아줌.
		String address = "(" + req.getParameter("postcode")  + ")"
		+ req.getParameter("address1") + req.getParameter("address3");
		purchaseGdsVO.setAddress(address);
		
//		num 꼽아줌.
		int num = Integer.parseInt(req.getParameter("num"));
		purchaseGdsVO.setNum(num);
		System.out.println("컨트롤러에서 num의 값은 : " + num);
		
		PurchaseGdsDAO mapper = sqlsession.getMapper(PurchaseGdsDAO.class);
		
//		idx, buyer_id, dop, name, phonenum, address, num INSERT
		System.out.println("컨트롤러에서 insert 전 purchaseGdsVO의 값은 : "
				+ purchaseGdsVO.toString());
		mapper.paymentInsert(purchaseGdsVO);
		System.out.println("컨트롤러에서 insert 후 purchaseGdsVO의 값은 : "
				+ purchaseGdsVO.toString());
		
//		나머지 INSERT해야 할 정보들을 rowunm을 기준으로 가장 최근 insert 된 문장을 찾아 update 해준다.
		int sellerGdsVO_idx = Integer.parseInt(req.getParameter("sellerGdsVO_idx"));
		SellerGdsVO sellerGdsVO = mapper.select(sellerGdsVO_idx);
		mapper.paymentupdate(sellerGdsVO);
		System.out.println("컨트롤러에서 update후 purchaseGdsVO의 값은 : "
				+ purchaseGdsVO.toString());
		
//		나머지 정보들은  하고 소비자 잔액 바꿔줌.
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("id", buyerID);
		hmap.put("price", purchaseGdsVO.getPrice());
		hmap.put("num", num);
		mapper.moneyUpdate(hmap);
		System.out.println("소비자 잔액 변경됨");
		System.out.println("컨트롤러에서 purchaseGdsVO의 값은 : " + purchaseGdsVO.toString());
		
//		나중에 구매내역 return으로 바꾸자.
		return "main/mainpage";
	}

}

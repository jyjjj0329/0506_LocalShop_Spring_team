package kr.project.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.project.VO.ConsumerFaqVO;

@Controller
public class ConsumerFAQController {

	@Autowired                                    
	SqlSession sqlSession;
	
	@RequestMapping("/consumerFAQ")
	private String consumerFAQ(HttpServletRequest req, Model model, ConsumerFaqVO faqVO) {
		System.out.println("컨트롤러에서 consumerFAQ로 들어옴");

		return "/consumerFAQ";
	}
	
	@RequestMapping("/1to1Faq")
	private String onetoone_faq(HttpServletRequest req, Model model) {
		System.out.println("컨트롤러에서 1to1Faq로 들어옴");
		return "/1to1Faq";
	}
}

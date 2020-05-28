package kr.project.Controller;



import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ConsumerFAQController {

	@Autowired                                    
	SqlSession sqlSession;
	
	@RequestMapping("/consumerFAQ")
	private String consumerFAQ(HttpServletRequest req, Model model) {
		System.out.println("컨트롤러에서 consumerFAQ로 들어옴");

		return "/consumerFAQ";
	}
}

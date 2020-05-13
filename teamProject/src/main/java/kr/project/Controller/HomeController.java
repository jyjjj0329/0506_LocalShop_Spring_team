package kr.project.Controller;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String buyerLogin(Locale locale, Model model) {
		
		return "buyerLogin";
	}
	
	@RequestMapping(value = "/buyer", method = RequestMethod.GET)
	public String buyerResults(Locale locale, Model model) {
		
		return "buyerResults";
	}
}

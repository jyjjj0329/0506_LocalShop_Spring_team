package temp.pbs.main;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "mainpage";
	}
	
	@RequestMapping("/mainpage")
	private String mainpage() {
		
		return "mainpage";
	}
	
	@RequestMapping("/category")
	private String category(HttpServletRequest request, Model model) {
		
		String area = request.getParameter("area");
		model.addAttribute("area", area);
		
		
		
		
		return "category";
	}
	
	@RequestMapping("/list")
	private String list(HttpServletRequest request, Model model) {
		
		
		String area = request.getParameter("area");
		model.addAttribute("area", area);
		String[] category = request.getParameterValues("category");
		model.addAttribute("category", category);
		
		return "list";
	}
	
}

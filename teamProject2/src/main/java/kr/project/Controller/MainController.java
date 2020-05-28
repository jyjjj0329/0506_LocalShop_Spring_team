package kr.project.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		System.out.println("컨트롤러에서 최초 mainpage로 들어옴");
		HttpSession session = req.getSession();
		session.removeAttribute("seller_id");

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
	
	@RequestMapping("/list")
	private String list(HttpServletRequest request, Model model) {
		
		
		String area = request.getParameter("area");
		model.addAttribute("area", area);
		String[] category = request.getParameterValues("category");
		model.addAttribute("category", category);
		
		return "main/list";
	}
}

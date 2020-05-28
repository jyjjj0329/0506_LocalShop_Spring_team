package kr.project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	@RequestMapping(value = "paymentOK")
	public String paymentOK() {
		System.out.println("컨트롤러에서 paymentOK에 들어옴.");
		
		return "main/mainpage";
	}

	@RequestMapping(value = "paymentCancle")
	public String paymentCancle() {
		
		return "main/mainpage";
	}
}

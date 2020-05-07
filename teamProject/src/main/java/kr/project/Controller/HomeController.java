package kr.project.Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
//	SqlSession을 사용하기 위해 변수를 만들고 다른 설정 없이도 자동으로 실행되게 @Autowired 해줌.
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	
	
	
}

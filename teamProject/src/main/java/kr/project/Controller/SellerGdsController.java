package kr.project.Controller;

import java.io.File;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.project.VO.SellerGdsVO;

@Controller
public class SellerGdsController {

	@Autowired
	public SqlSession sqlSession;

	@Autowired
	private SellerGdsVO sellerGdsVO;
	
	@RequestMapping(value = "/sellerInsert")
	public String sellerIndex(Model model) {
		return "/seller/sellerInsert";
	}

	@RequestMapping(value = "/sellerInsertOK", method = RequestMethod.POST)
	public String sellerList(MultipartHttpServletRequest mtf) throws Exception {
		System.out.println("SellerGds컨트롤러에서 sellerInsertOK 들어옴.");
		
		/* 파일 관련 코드(여기부터) */
		String extension = null;
// 		파일 태그
		String fileTag = "file";
// 		업로드 파일이 저장될 경로
		String filePath = "C:\\ITstudy\\Project\\image\\";
		String fileName = filePath + "사진없음.png";
		
//		파일 이름을 랜덤으로 뽑아주기 위한 uuid.
		UUID uuid =  UUID.randomUUID();
//		file을 가져옴
		MultipartFile file = mtf.getFile(fileTag);
		String fileorigin = file.getOriginalFilename();
		System.out.println(fileorigin);
//		만약 file이 있다면
		if(fileorigin != null) {
//			파일 확장자 뽑아줌
			extension = fileorigin.substring(fileorigin.lastIndexOf("."), fileorigin.length());
// 			파일 이름	
			fileName = filePath + uuid + extension;
//			fileName이 이미 존재한다면
			File fName = new File(fileName);
			if(fName.exists()) {
				fileName = filePath + uuid + "2" + extension;
			}	
// 			파일 전송
			try {
				file.transferTo(new File(fileName));
			} catch(Exception e) {
				System.out.println("업로드 오류");
			}
		}
		/* 파일 관련 코드(여기까지) */
		
		return "/seller/sellerInsert";
	}
	

	
	
}

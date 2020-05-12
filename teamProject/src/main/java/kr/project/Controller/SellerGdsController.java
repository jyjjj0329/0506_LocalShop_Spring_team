package kr.project.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.SellerGdsListVO;
import kr.project.VO.SellerGdsVO;

@Controller
public class SellerGdsController {

	@Autowired
	public SqlSession sqlSession;

	
	@Autowired
	private SellerGdsListVO sellerGdsListVO;
	
	@RequestMapping(value = "/seller")
	public String seller() {
		return "/seller/sellerHome";
	}
	
	@RequestMapping(value = "/sellerInsert")
	public String sellerIndex() {
		return "/seller/sellerInsert";
	}

	int i = 1;
	@RequestMapping(value = "/sellerInsertOK", method = RequestMethod.POST)
	public String sellerList(MultipartHttpServletRequest mtf, SellerGdsVO sellerGdsVO) throws Exception {
		System.out.println("SellerGds컨트롤러에서 sellerInsertOK 들어옴.");
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		
		/* 파일 관련 코드(여기부터) */
		String extension = null;
// 		업로드 파일이 저장될 경로
		String filePath = "C:/Users/CHOYEJI/git/teamProject/teamProject/src/main"
				+ "/webapp/resources/image/";
		System.out.println(filePath);
//		만약 fileDirectory가 존재하지 않다면 폴더를 생성해라.
		File fileDirectory = new File(filePath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdir();
			System.out.println("폴더 생성!!");
		}
		String image_Name = "사진없음.png";
		long image_Size = 9602;
		
//		file을 가져옴
		MultipartFile file = mtf.getFile("file");
		String fileorigin = file.getOriginalFilename();
		System.out.println("컨트롤러에서 fileorigin의 값은 : " + fileorigin);
//		만약 file이 있다면
		if(fileorigin != "") {
//			파일 확장자 뽑아줌
			extension = fileorigin.substring(fileorigin.lastIndexOf("."),
					fileorigin.length());
// 			파일 이름	
			image_Name = i + extension;
//			파일 사이즈 구하기
			image_Size = file.getSize();
			System.out.println("컨트롤러에서 imageSize는 : " + image_Size);
// 			파일 전송
			try {
				file.transferTo(new File(filePath + image_Name));
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("업로드 오류");
			}
			i++;
		}
		/* 파일 관련 코드(여기까지) */
		
		System.out.println("컨트롤러에서 image_Name의 값은 : " + image_Name);
		
//		image_Name과 image_Size 값 꼽아주기.
		sellerGdsVO.setImage_name(image_Name);
		sellerGdsVO.setImage_size(image_Size);
		
		mapper.insert(sellerGdsVO);
		System.out.println("컨트롤러에서 sellerGdsVO의 데이터들은 : " + sellerGdsVO.toString());
		
		return "/seller/sellerInsert";
	}
	
	@RequestMapping(value = "/sellerList")
	public String sellerList(Model model, HttpServletRequest req) {
		System.out.println("컨트롤러에서 sellerList에 들어옴.");
		
//		session을 만들어서 판매자 id를 받아와 그 id를 가진 사람의 판매 물건만 가져와야 하지만
//		아직 판매자 회원은 구현전이니 구현후에 수정하자. mapper에 where id = ? 도 구현하기.
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		
//		페이지 관련 코드
		int page = Integer.parseInt(req.getParameter("page"));
		int pageSize = 4;
		
//		나중에 seller_id도 받아서 where문에 넣어주자. 일단은 없이 아무것도 받지 않는다.
		sellerGdsListVO.setTotalCount(mapper.sellectCount());
//		Page값 초기화
		sellerGdsListVO.initPageList(pageSize, sellerGdsListVO.getTotalCount(), page);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", sellerGdsListVO.getStartNo());
		hmap.put("endNo", sellerGdsListVO.getEndNo());
		sellerGdsListVO.setSellerGdsVO(mapper.selectList(hmap));;
		model.addAttribute("sellerGdsListVO", sellerGdsListVO);
		
		return "/seller/sellerList";
	}
	

	
	
}

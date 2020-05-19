package kr.project.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.SellerGdsListVO;
import kr.project.VO.SellerGdsVO;
import kr.project.VO.SellerVO;

@Controller
public class SellerGdsController {

	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private SellerGdsListVO sellerGdsListVO;
	
	@Autowired
	private SellerGdsVO sellerGdsVO;
	
	@RequestMapping(value = "/seller")
	public String seller(HttpServletRequest req, Model model, SellerVO sellerVO) {
		System.out.println("컨트롤러에서 seller 들어옴.");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
//		mapper에서 seller_id에 저장된 store를 가져오기 위해 session에 저장된 seller_id의 값을 가져온다.
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("seller_id");
		System.out.println("컨트롤러에서 seller_id의 값은 : " + id);
		
//		가게 이미지 가져오기 위한 store 이름 가져오기.
		sellerVO = mapper.store(id); 
		System.out.println("store의 값은 : " + sellerVO.getStore());
		System.out.println("phoneNum의 값은 : " + sellerVO.getPhonenum());
		
//		폴더 안에 들어있는 파일 갯수들 가져오는 코드들.
//		반드시 자바에서 경로는 절댓값으로 잡아줘야함. 상대경로는 인식 못하는것같습니다
		String path = "C:/Users/CHOYEJI/git/teamProject/teamProject/src/main"
				+ "/webapp/resources/storeImage/" + sellerVO.getStore();
		File f = new File(path);
		File[] files = f.listFiles();
		ArrayList<String> extension = new ArrayList<String>();
		extension.add("openImage");
		System.out.println("컨트롤러에서 files의 길이는 : " + files.length);
		
		int count = 0;
		for(int i = 0; i < files.length; i++) {
			if(files[i].isFile()) {
				count++;
				System.out.println("파일 : " + files[i].getName());
				extension.add(files[i].getName().substring(files[i].getName().lastIndexOf(".")));
				System.out.println("extension : " + extension.get(i));
			}else {
				System.out.println("디렉토리 명 : " + files[i].getName());
			}
		}
		System.out.println("파일의 갯수 : " + count);
		
		model.addAttribute("store", sellerVO.getStore());
		model.addAttribute("phoneNum", sellerVO.getPhonenum());
		model.addAttribute("count", count);
		model.addAttribute("extension", extension);
		
		return "/seller/sellerHome";
	}
	
	@RequestMapping(value = "/sellerInsert")
	public String sellerIndex() {
		return "/seller/sellerInsert";
	}

	int i = 1;
	@RequestMapping(value = "/sellerInsertOK", method = RequestMethod.POST)
	public String sellerInsertOK(HttpServletRequest req, MultipartHttpServletRequest mtf, SellerGdsVO sellerGdsVO) throws Exception {
		System.out.println("SellerGds컨트롤러에서 sellerInsertOK 들어옴.");
//		session에 저장된 판매자 id를 가져와서 seller_id에 꼽아줌.
		HttpSession session = req.getSession();
		String seller_id = (String) session.getAttribute("seller_id");
		sellerGdsVO.setSeller_id(seller_id);
		
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
		
//		session에 저장된 판매자 id를 가져와서 seller_id에 꼽아줌.
		HttpSession session = req.getSession();
		String seller_id = (String) session.getAttribute("seller_id");
		
//		session을 만들어서 판매자 id를 받아와 그 id를 가진 사람의 판매 물건만 가져와야 하지만
//		아직 판매자 회원은 구현전이니 구현후에 수정하자. mapper에 where id = ? 도 구현하기.
		
//		페이지 관련 코드
		int page = Integer.parseInt(req.getParameter("page"));
		int pageSize = 4;
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
//		나중에 seller_id도 받아서 where문에 넣어주자. 일단은 없이 아무것도 받지 않는다.
		sellerGdsListVO.setTotalCount(mapper.sellectCount(seller_id));
		System.out.println("컨트롤러에서 sellectCount의 값은 : " + sellerGdsListVO.getTotalCount());
//		Page값 초기화
		sellerGdsListVO.initPageList(pageSize, sellerGdsListVO.getTotalCount(), page);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", sellerGdsListVO.getStartNo());
		hmap.put("endNo", sellerGdsListVO.getEndNo());
		hmap.put("seller_id", seller_id);
		sellerGdsListVO.setSellerGdsVO(mapper.selectList(hmap));;
		model.addAttribute("sellerGdsListVO", sellerGdsListVO);
		System.out.println("컨트롤러 나감.");
		
		return "/seller/sellerList";
	}
	
//	idx와 pw 파라미터를 가지고 gdsUpdate(상세목록)로 넘어감.
	@RequestMapping(value = "gdsUpdate")
	public String gdsUpdate(HttpServletRequest req, Model model, SellerGdsVO sellerGdsVO) {
		System.out.println("컨트롤러에서 gdsUpdate 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		HttpSession session = req.getSession();
		String pw = (String) session.getAttribute("pw");
		System.out.println("컨트롤러에서 gdsUpdate의 pw의 값은 : " + pw);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		sellerGdsVO = mapper.updateList(idx);
		
		model.addAttribute("sellerGdsVO", sellerGdsVO);
		System.out.println("sllerGdsVO의 값은 " + sellerGdsVO.toString());
		
		return "/seller/gdsUpdate";
	}
	
//	물품 수정
	@RequestMapping(value = "gdsUpdateResult")
	public String gdsUpdateResult(SellerGdsVO sellerGdsVO) {
		System.out.println("컨트롤러에서 gdsUpdateResult에 들어옴.");
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);

		System.out.println("컨트롤러의 sellerGdsVO의 값은 : " + sellerGdsVO);
		mapper.gdsUpdate(sellerGdsVO);
		System.out.println("sellerGdsVO의 값은 : " + sellerGdsVO);
		
		return "redirect:sellerList?page=1";
	}
	
//	물품 삭제
	@RequestMapping(value = "gdsDelete")
	public String gdsDelete(HttpServletRequest req) {
		System.out.println("컨트롤러에서 gdsDelete 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		mapper.gdsDelete(idx);
//		sellerList로 들어가면 잘 안나오는 오류 해결하기
		return "redirect:sellerList?page=1";
	}
	
	
}

package kr.project.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.project.DAO.SellerGdsDAO;
import kr.project.VO.GoodsSoldList;
import kr.project.VO.GoodsSoldVO;
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
	private GoodsSoldList goodsSoldList;
	
	/** 판매자 메인 페이지 */
	@RequestMapping(value = "/seller")
	public String seller(HttpServletRequest req, Model model, SellerVO sellerVO) {
		System.out.println("컨트롤러에서 seller 들어옴.");
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		/** mapper에서 seller_id에 저장된 store를 가져오기 위해 session에 저장된 seller_id의 값을 가져온다. */
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("seller_id");
		System.out.println("컨트롤러에서 seller_id의 값은 : " + id);
		
		/** 가게 이미지와 가게 번호 가져오기 위한 store 이름 가져오기. */
		sellerVO = mapper.store(id); 
		session.setAttribute("store", sellerVO.getStore());
		session.setAttribute("phoneNum", sellerVO.getPhonenum());
		System.out.println("store의 값은 : " + session.getAttribute("store"));
		System.out.println("phoneNum의 값은 : " + session.getAttribute("phoneNum"));
		
		/**
		 * 폴더 안에 들어있는 파일 갯수들 가져오는 코드들. 반드시 자바에서 경로는 절댓값으로 잡아줘야함. 상대경로는 인식 못하는것같습니다.
		 */
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
		
		model.addAttribute("count", count);
		model.addAttribute("extension", extension);
		
		return "/seller/sellerHome";
	}
	
	/** 판매 물품 등록 페이지로 이동 */
	@RequestMapping(value = "/sellerInsert")
	public String sellerIndex() {
		return "/seller/sellerInsert";
	}

	/** 물품등록 코드 */
	int i = 1;
	@RequestMapping(value = "/sellerInsertOK", method = RequestMethod.POST)
	public String sellerInsertOK(HttpServletRequest req, MultipartHttpServletRequest mtf, SellerGdsVO sellerGdsVO) throws Exception {
		System.out.println("SellerGds컨트롤러에서 sellerInsertOK 들어옴.");
		/** session에 저장된 판매자 id를 가져와서 seller_id에 꼽아줌. */
		HttpSession session = req.getSession();
		String seller_id = (String) session.getAttribute("seller_id");
		sellerGdsVO.setSeller_id(seller_id);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		
		/** 파일 관련 코드(여기부터) */
		String extension = null;
		/** 업로드 파일이 저장될 경로 */
		String filePath = "C:/Users/CHOYEJI/git/teamProject/teamProject/src/main"
				+ "/webapp/resources/image/";
		System.out.println(filePath);
		/** 만약 fileDirectory가 존재하지 않다면 폴더를 생성해라. */
		File fileDirectory = new File(filePath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdir();
			System.out.println("폴더 생성!!");
		}
		String image_Name = "사진없음.png";
		long image_Size = 9602;
		
		/** file을 가져옴 */
		MultipartFile file = mtf.getFile("file");
		String fileorigin = file.getOriginalFilename();
		System.out.println("컨트롤러에서 fileorigin의 값은 : " + fileorigin);
		/** 만약 file이 있다면 */
		if(fileorigin != "") {
			/** 파일 확장자 뽑아줌 */
			extension = fileorigin.substring(fileorigin.lastIndexOf("."),
					fileorigin.length());
			/** 파일 이름 */
			image_Name = i + extension;
			/** 파일 사이즈 구하기 */
			image_Size = file.getSize();
			System.out.println("컨트롤러에서 imageSize는 : " + image_Size);
			/** 파일 전송 */
			try {
				file.transferTo(new File(filePath + image_Name));
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("업로드 오류");
			}
			i++;
		}
		/** 파일 관련 코드(여기까지) */
		
		System.out.println("컨트롤러에서 image_Name의 값은 : " + image_Name);
		
		/** image_Name과 image_Size 값 꼽아주기. */
		sellerGdsVO.setImage_name(image_Name);
		sellerGdsVO.setImage_size(image_Size);
		
		/** 판매자 정보에 있는 area 빼서 넣어주는 코드 */
		String area = mapper.selectarea(seller_id);
		sellerGdsVO.setArea(area);
		
		mapper.insert(sellerGdsVO);
		System.out.println("컨트롤러에서 sellerGdsVO의 데이터들은 : " + sellerGdsVO.toString());
		
		return "seller/sellerInsert";
	}
	
	@RequestMapping(value = "/sellerList")
	public String sellerList(Model model, HttpServletRequest req) {
		System.out.println("컨트롤러에서 sellerList에 들어옴.");
		
		/** session에 저장된 판매자 id를 가져와서 seller_id에 꼽아줌. */
		HttpSession session = req.getSession();
		String seller_id = (String) session.getAttribute("seller_id");
		
		/** 페이지 관련 코드 */
		int page = Integer.parseInt(req.getParameter("page"));
		int pageSize = 4;
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		/** seller_id를 where문에 넣어준다. */
		sellerGdsListVO.setTotalCount(mapper.selectCount(seller_id));
		System.out.println("컨트롤러에서 sellectCount의 값은 : " + sellerGdsListVO.getTotalCount());
		/** Page값 초기화 */
		sellerGdsListVO.initPageList(pageSize, sellerGdsListVO.getTotalCount(), page);
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", sellerGdsListVO.getStartNo());
		hmap.put("endNo", sellerGdsListVO.getEndNo());
		hmap.put("seller_id", seller_id);
		sellerGdsListVO.setSellerGdsVO(mapper.selectList(hmap));
		model.addAttribute("sellerGdsListVO", sellerGdsListVO);
		System.out.println("컨트롤러 나감.");
		
		return "/seller/sellerList";
	}
	
	/** idx와 pw 파라미터를 가지고 gdsUpdate(상세목록)로 넘어감. */
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
	
	/** 물품 수정 */
	@RequestMapping(value = "gdsUpdateResult")
	public String gdsUpdateResult(SellerGdsVO sellerGdsVO) {
		System.out.println("컨트롤러에서 gdsUpdateResult에 들어옴.");
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);

		System.out.println("컨트롤러의 sellerGdsVO의 값은 : " + sellerGdsVO);
		mapper.gdsUpdate(sellerGdsVO);
		System.out.println("sellerGdsVO의 값은 : " + sellerGdsVO);
		
		return "redirect:sellerList?page=1";
	}
	
	/** 물품 삭제 */
	@RequestMapping(value = "gdsDelete")
	public String gdsDelete(HttpServletRequest req) {
		System.out.println("컨트롤러에서 gdsDelete 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		mapper.gdsDelete(idx);
		/** sellerList로 들어가면 잘 안나오는 오류 해결하기 */
		return "redirect:sellerList?page=1";
	}
	
	/** 판매된 물품 */
	@RequestMapping(value = "goodsSold")
	public String goodsSold(HttpServletRequest req, Model model, GoodsSoldVO goodsSoldVO) {
		System.out.println("컨트롤러에서 goodsSold에 들어옴.");
		
		/** 세션에 저장된 seller_id를 가져온다. */
		HttpSession session = req.getSession();
		String seller_id = (String) session.getAttribute("seller_id");
		
		/** 페이지 관련 코드 */
		int page = Integer.parseInt(req.getParameter("page"));
		int pageSize = 4;
		
		/** seller_id를 받아 where문에 넣어준다. */
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		goodsSoldList.setTotalCount(mapper.soldSelectCount(seller_id));
		System.out.println("컨트롤러에서 sellectCount의 값은 : " + goodsSoldList.getTotalCount());
		/** Page값 초기화 */
		goodsSoldList.initPageList(pageSize, goodsSoldList.getTotalCount(), page);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", goodsSoldList.getStartNo());
		hmap.put("endNo", goodsSoldList.getEndNo());
		hmap.put("seller_id", seller_id);
		goodsSoldList.setGoodsSoldVO(mapper.soldSelectList(hmap));
		
		/** goodsSoldVO를 jsp파일에서 가져오기 위해 모델에 넣어줌. */
		model.addAttribute("goodsSoldList", goodsSoldList);
		System.out.println("컨트롤러에서 goodsSoldList의 값은 : " + goodsSoldList.toString());
		return "seller/goodsSold";
	}
	
	
	@RequestMapping(value = "start_DEL", method = RequestMethod.GET)
	public String start_DEL(HttpServletRequest req) {
		System.out.println("컨트롤러에서 start_DEL에 들어옴.");
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		mapper.start_DEL(idx);
		
		return "redirect:goodsSold?page=1";
	}
	
	@RequestMapping(value = "complate_DEL", method = RequestMethod.GET)
	public String complate_DEL(HttpServletRequest req) {
		System.out.println("컨트롤러에서 complate_DEL에 들어옴.");
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("컨트롤러에서 idx의 값은 : " + idx);
		
		SellerGdsDAO mapper = sqlSession.getMapper(SellerGdsDAO.class);
		mapper.complate_DEL(idx);
		
		return "redirect:goodsSold?page=1";
	}
	
}

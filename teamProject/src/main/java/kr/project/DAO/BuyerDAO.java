package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.SellerGdsVO;

/** 소비자 DAO*/
public interface BuyerDAO {

	/** HashMap으로 id와 pw를 받아 DB에서 조회하여 일치하는 HashMap의 개수를 반환하는 메소드 */
	int buyerLogin(HashMap<String, String> hmap);
	
	/** HashMap으로 category와 area를 받아 DB에서 조회하여 일치하는 HashMap의 개수를 반환하는 메소드 */
	int sellectCount(HashMap<String, Object> hmap);

	/** HashMap으로 category와 area를 받아서 startNo 페이지부터 endNo 페이지 사이의 판매 물품들의
	 * 인덱스, 이름, 가격, 원산지, 이미지, 분류(category)를 Arraylist로 반환하는 메소드 */
	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);
	
	/** 회원가입 한 건의 정보를 받아 DB에 저장하는 메소드 */
	void buyerInsert(BuyerVO buyerVO);
	
	/** ID를 받아 DB에서 조회하여 일치하는 ID의 개수를 반환하는 메소드 */
	int CheckID(String id);
	
	/** nickname을 받아 DB에서 조회하여 일치하는 nickname의 개수를 반환하는 메소드 */
	int CheckNickname(String nickname);

	BuyerVO buyerInfo(String id);

	void buyerInfoDelete(String id);

	void changePW(HashMap<String, Object> hmap);

	void updateInfo(BuyerVO vo);

	void moneyadd(HashMap<String, Object> hmap);

}

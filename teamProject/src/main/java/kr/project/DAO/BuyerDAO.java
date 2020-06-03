package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.ReviewsVO;
import kr.project.VO.SellerGdsVO;

public interface BuyerDAO {

	int buyerLogin(HashMap<String, String> hmap);

	int sellectCount(HashMap<String, Object> hmap);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);
	
	void buyerInsert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);

	BuyerVO buyerInfo(String id);

	void buyerInfoDelete(String id);

	void changePW(HashMap<String, Object> hmap);

	void updateInfo(BuyerVO vo);

	void moneyadd(HashMap<String, Object> hmap);

	void buyerSearch(String search);
	
	String findarea(String id);

	SellerGdsVO buyerDetail(int idx);

	ArrayList<ReviewsVO> reviewsSelect(int idx);

	int reviewsCount(int idx);

	void revewsInsert(ReviewsVO reviewsVO);

}

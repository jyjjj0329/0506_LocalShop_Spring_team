package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.SellerGdsVO;

public interface BuyerDAO {

	int buyerLogin(HashMap<String, String> hmap);

	int sellectCount(HashMap<String, Object> hmap);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);
	
	void buyerInsert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);

	void buyerSearch(String search);

}

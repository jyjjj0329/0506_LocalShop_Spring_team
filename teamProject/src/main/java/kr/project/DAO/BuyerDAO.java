package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.SellerGdsVO;

public interface BuyerDAO {

<<<<<<< HEAD
	int buyerLogin(HashMap<String, String> hmap);

	int sellectCount(HashMap<String, Object> hmap);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);
	
	void buyerInsert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);
=======
	BuyerVO buyerInfo(String id);

	void buyerInfoDelete(String id);

	void changePW(HashMap<String, Object> hmap);

	int sellectCount(HashMap<String, Object> hmap);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);

	int buyerLogin(HashMap<String, String> hmap);

	void updateInfo(BuyerVO vo);

	int CheckNickname(String nickname);

	void moneyadd(HashMap<String, Object> hmap);



>>>>>>> refs/heads/parkc
	
}

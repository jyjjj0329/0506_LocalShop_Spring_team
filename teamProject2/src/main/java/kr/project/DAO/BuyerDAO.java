package kr.project.DAO;

import java.util.HashMap;

import kr.project.VO.BuyerVO;

public interface BuyerDAO {

	BuyerVO buyerInfo(String id);

	void buyerInfoDelete(String id);

	void changePW(HashMap<String, Object> hmap);
	
}

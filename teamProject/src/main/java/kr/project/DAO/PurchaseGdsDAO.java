package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.PurchaseGdsVO;

public interface PurchaseGdsDAO {

	int sellectCount(String id);

	ArrayList<PurchaseGdsVO> selectList(HashMap<String, Object> hmap);

	BuyerVO getbuyerid(String id);


}

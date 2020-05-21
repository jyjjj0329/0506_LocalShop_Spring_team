package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.SellerGdsVO;

public interface BuyerDAO {

	int buyerLogin(HashMap<String, String> hmap);

	int sellectCount(HashMap<String, Object> hmap);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);

}

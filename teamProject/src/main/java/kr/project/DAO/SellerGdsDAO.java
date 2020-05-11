package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.SellerGdsVO;

public interface SellerGdsDAO {

	void insert(SellerGdsVO sellerGdsVO);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Integer> hmap);

	int sellectCount();

	int CheckID(String id);

}

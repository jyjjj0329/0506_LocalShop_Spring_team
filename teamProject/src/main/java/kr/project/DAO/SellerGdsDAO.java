package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.SellerGdsVO;
import kr.project.VO.SellerVO;

public interface SellerGdsDAO {

	void insert(SellerGdsVO sellerGdsVO);

	ArrayList<SellerGdsVO> selectList(HashMap<String, Object> hmap);

	int sellectCount(String seller_id);

	int CheckID(String id);

	void sellerInsert(SellerVO sellerVO);

	int login(HashMap<String, String> hmap);

	SellerGdsVO updateList(int idx);

	void gdsDelete(int idx);

	void gdsUpdate(SellerGdsVO sellerGdsVO);

	SellerVO store(String id);

}

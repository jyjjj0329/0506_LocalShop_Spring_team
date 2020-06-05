package kr.project.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.project.VO.BuyerVO;
import kr.project.VO.PurchaseGdsVO;
import kr.project.VO.SellerGdsVO;

public interface PurchaseGdsDAO {

	int sellectCount(String id);

	ArrayList<PurchaseGdsVO> selectList(HashMap<String, Object> hmap);

	BuyerVO getbuyerid(String id);

	void paymentInsert(PurchaseGdsVO purchaseGdsVO);

	SellerGdsVO select(int sellerGdsVO_idx);

	void paymentupdate(SellerGdsVO sellerGdsVO);

	void moneyUpdate(HashMap<String, Object> hmap);



}

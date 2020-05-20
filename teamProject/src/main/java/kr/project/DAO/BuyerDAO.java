package kr.project.DAO;


import kr.project.VO.BuyerVO;

public interface BuyerDAO {
	
	void insert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);
	
}

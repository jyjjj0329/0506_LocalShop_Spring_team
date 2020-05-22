package kr.project.DAO;


import kr.project.VO.BuyerVO;

public interface BuyerDAO {
	
	void buyerInsert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);
	
}

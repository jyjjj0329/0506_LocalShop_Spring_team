<<<<<<< HEAD
package kr.project.DAO;

import java.util.HashMap;

public interface BuyerDAO {

	int buyerLogin(HashMap<String, String> hmap);

}
=======
package kr.project.DAO;


import kr.project.VO.BuyerVO;

public interface BuyerDAO {
	
	void buyerInsert(BuyerVO buyerVO);
	
	int CheckID(String id);
	
	int CheckNickname(String nickname);
	
}
>>>>>>> refs/heads/mkw

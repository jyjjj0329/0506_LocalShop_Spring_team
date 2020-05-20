package kr.project.DAO;

import java.util.HashMap;

public interface BuyerDAO {

	int buyerLogin(HashMap<String, String> hmap);

	int sellectCount(HashMap<String, Object> hmap);

}
